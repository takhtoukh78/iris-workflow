#!/bin/bash
# diagnostic-iris-api.sh
# Script de diagnostic pour l'API Iris Coiffure et Traefik

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

CONTAINER_NAME="iris-api"

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

echo "🔍 === DIAGNOSTIC IRIS API & TRAEFIK ==="
echo

# 1. Vérification des conteneurs
log_info "1. État des conteneurs"
echo "📋 Conteneurs actifs:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep -E "(NAMES|iris-api|traefik|iris-postgres)" || log_warning "Conteneurs manquants"
echo

# 2. Vérification du conteneur iris-api
if docker ps | grep -q "${CONTAINER_NAME}"; then
    log_success "✅ Conteneur ${CONTAINER_NAME} actif"
    
    log_info "2. Configuration du conteneur iris-api"
    echo "🏷️ Labels Traefik appliqués:"
    docker inspect ${CONTAINER_NAME} --format='{{range $k, $v := .Config.Labels}}{{if or (contains $k "traefik") (contains $k "TRAEFIK")}}{{$k}}: {{$v}}{{println}}{{end}}{{end}}' | sort
    
    echo
    echo "🌐 Réseaux connectés:"
    docker inspect ${CONTAINER_NAME} --format='{{range $k, $v := .NetworkSettings.Networks}}{{$k}}: {{$v.IPAddress}}{{println}}{{end}}'
    
    echo
    echo "🔧 Variables d'environnement clés:"
    docker exec ${CONTAINER_NAME} env | grep -E "(SERVER_PORT|SPRING_PROFILES_ACTIVE|SPRINGDOC)" | sort
    
    echo
    echo "💾 Utilisation des ressources:"
    docker stats ${CONTAINER_NAME} --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}" || log_warning "Stats non disponibles"
else
    log_error "❌ Conteneur ${CONTAINER_NAME} non actif"
    echo "📋 Tous les conteneurs:"
    docker ps -a | grep iris-api || log_error "Aucun conteneur iris-api trouvé"
    exit 1
fi

echo

# 3. Tests de connectivité interne
log_info "3. Tests de connectivité interne"

# Test direct sur le conteneur
if docker exec ${CONTAINER_NAME} wget -qO- --timeout=5 http://localhost:8087/actuator/health 2>/dev/null | grep -q "UP\|status"; then
    log_success "✅ Health check interne OK"
    docker exec ${CONTAINER_NAME} wget -qO- http://localhost:8087/actuator/health 2>/dev/null | head -3
else
    log_error "❌ Health check interne FAILED"
    echo "📋 Logs récents:"
    docker logs ${CONTAINER_NAME} --tail 10
fi

echo

# Test des endpoints Swagger
echo "📚 Test des endpoints Swagger:"
endpoints=("/v3/api-docs" "/swagger-ui.html" "/swagger-ui/index.html")
for endpoint in "${endpoints[@]}"; do
    if docker exec ${CONTAINER_NAME} wget -qO- --timeout=5 "http://localhost:8087${endpoint}" 2>/dev/null | head -1 | grep -q -E "(html|json|\{|\[)"; then
        log_success "✅ ${endpoint} accessible"
    else
        log_warning "⚠️ ${endpoint} non accessible ou vide"
    fi
done

echo

# 4. Vérification Traefik
log_info "4. Vérification de l'intégration Traefik"

if docker ps | grep -q "traefik"; then
    log_success "✅ Conteneur Traefik actif"
    
    # Vérification de l'API Traefik
    echo "🔍 Services détectés par Traefik:"
    if docker exec traefik wget -qO- http://127.0.0.1:8080/api/rawdata 2>/dev/null > /tmp/traefik_data.json; then
        if grep -q "iris-api@docker" /tmp/traefik_data.json; then
            log_success "✅ Service iris-api détecté par Traefik"
            
            # Extraction des détails du service
            echo "📋 Détails du service iris-api:"
            if command -v jq >/dev/null 2>&1; then
                cat /tmp/traefik_data.json | jq '.services["iris-api@docker"]' 2>/dev/null || echo "Détails non disponibles avec jq"
                cat /tmp/traefik_data.json | jq '.routers["iris-api@docker"]' 2>/dev/null || echo "Router non disponible avec jq"
            else
                grep -A 10 -B 5 "iris-api@docker" /tmp/traefik_data.json | head -20
            fi
        else
            log_error "❌ Service iris-api NON détecté par Traefik"
            echo "🔍 Services détectés:"
            if command -v jq >/dev/null 2>&1; then
                cat /tmp/traefik_data.json | jq -r '.services | keys[]' | head -10
            else
                grep -o '"[^"]*@docker"' /tmp/traefik_data.json | sort | uniq | head -10
            fi
        fi
        rm -f /tmp/traefik_data.json
    else
        log_error "❌ Impossible d'accéder à l'API Traefik"
    fi
    
    echo
    echo "📡 Test de routage Traefik (interne):"
    # Test via l'API interne de Traefik
    if docker exec traefik wget -qO- --timeout=10 --header="Host: api.iriscoiffure.com" http://iris-api:8087/actuator/health 2>/dev/null | grep -q "UP\|status"; then
        log_success "✅ Routage Traefik interne OK"
    else
        log_warning "⚠️ Routage Traefik interne FAILED"
    fi
else
    log_error "❌ Conteneur Traefik non actif"
fi

echo

# 5. Tests de connectivité externe
log_info "5. Tests de connectivité externe"

# Test HTTPS
echo "🌐 Test HTTPS (api.iriscoiffure.com):"
for endpoint in "/actuator/health" "/v3/api-docs" "/swagger-ui.html"; do
    http_code=$(curl -k -s -o /dev/null -w "%{http_code}" --connect-timeout 10 "https://api.iriscoiffure.com${endpoint}" 2>/dev/null || echo "000")
    case $http_code in
        200) log_success "✅ ${endpoint}: HTTP $http_code" ;;
        404) log_warning "⚠️ ${endpoint}: HTTP $http_code (endpoint non trouvé)" ;;
        000) log_error "❌ ${endpoint}: Connexion échouée" ;;
        *) log_warning "⚠️ ${endpoint}: HTTP $http_code" ;;
    esac
done

echo

# 6. Vérification des réseaux Docker
log_info "6. Vérification des réseaux Docker"
echo "🌐 Réseaux disponibles:"
docker network ls | grep -E "(web|private)" || log_warning "Réseaux web/private manquants"

echo
echo "🔗 Conteneurs sur le réseau 'web':"
docker network inspect web --format='{{range .Containers}}{{.Name}}: {{.IPv4Address}}{{println}}{{end}}' 2>/dev/null || log_warning "Réseau web non accessible"

echo

# 7. Logs récents
log_info "7. Logs récents de l'application"
echo "📋 Dernières lignes des logs:"
docker logs ${CONTAINER_NAME} --tail 20 --timestamps | tail -10

echo

# 8. Recommandations
log_info "8. Recommandations de résolution"
echo "🔧 Actions recommandées si des problèmes sont détectés:"
echo
echo "   1. Si le service n'est pas détecté par Traefik:"
echo "      - Vérifiez que le conteneur est sur le réseau 'web'"
echo "      - Vérifiez les labels Traefik du conteneur"
echo "      - Redémarrez Traefik: docker restart traefik"
echo
echo "   2. Si Swagger retourne 404:"
echo "      - Vérifiez les endpoints dans les logs Spring Boot"
echo "      - Testez les URLs alternatives: /swagger-ui/index.html"
echo "      - Vérifiez la configuration SpringDoc dans application.properties"
echo
echo "   3. Si l'API n'est pas accessible:"
echo "      - Vérifiez le health check interne"
echo "      - Vérifiez les certificats TLS"
echo "      - Vérifiez la résolution DNS"
echo
echo "   4. Commandes de debug utiles:"
echo "      - docker logs ${CONTAINER_NAME} --tail 50"
echo "      - docker exec ${CONTAINER_NAME} netstat -tlnp"
echo "      - docker exec traefik wget -qO- http://127.0.0.1:8080/api/rawdata"

echo
log_success "🎯 Diagnostic terminé"

