#!/bin/bash

echo "🔧 CORRECTION IRIS-API"
echo "====================="

echo ""
echo "1. Arrêt et suppression du mauvais conteneur:"
echo "---------------------------------------------"
docker stop iris-api
docker rm iris-api

echo ""
echo "2. Vérification de l'image correcte:"
echo "------------------------------------"
docker pull takhtoukh/iris-api:latest
docker images | grep iris-api

echo ""
echo "3. Nettoyage:"
echo "------------"
docker system prune -f

echo ""
echo "4. Création des réseaux si nécessaire:"
echo "-------------------------------------"
docker network create web --driver bridge 2>/dev/null || echo "Réseau 'web' existe déjà"
docker network create private --driver bridge 2>/dev/null || echo "Réseau 'private' existe déjà"

echo ""
echo "5. Démarrage du conteneur corrigé:"
echo "---------------------------------"
docker run -d \
    --name iris-api \
    --restart always \
    --network web \
    -e SPRING_PROFILES_ACTIVE=prod \
    -e SPRING_DATASOURCE_URL=jdbc:postgresql://iris-postgres:5432/iris_coiffure_db \
    -e SPRING_DATASOURCE_USERNAME=admin \
    -e SPRING_DATASOURCE_PASSWORD=youAdmin123 \
    -e SERVER_PORT=8087 \
    -e SERVER_FORWARD_HEADERS_STRATEGY=FRAMEWORK \
    -e SERVER_USE_FORWARD_HEADERS=true \
    --label "traefik.enable=true" \
    --label "traefik.http.routers.iris-api.entrypoints=websecure" \
    --label "traefik.http.routers.iris-api.rule=Host(\`api.iriscoiffure.com\`)" \
    --label "traefik.http.services.iris-api.loadbalancer.server.port=8087" \
    --label "traefik.http.routers.iris-api.tls.certresolver=lets-encr" \
    --label "traefik.docker.network=web" \
    --label "traefik.http.middlewares.iris-api-headers.headers.customrequestheaders.X-Forwarded-Proto=https" \
    --label "traefik.http.routers.iris-api.middlewares=iris-api-headers" \
    --health-cmd="wget --no-verbose --tries=1 --spider http://localhost:8087/actuator/health || exit 1" \
    --health-interval=30s \
    --health-timeout=10s \
    --health-retries=3 \
    --health-start-period=60s \
    takhtoukh/iris-api:latest

echo ""
echo "6. Connexion au réseau private (pour base de données):"
echo "-----------------------------------------------------"
docker network connect private iris-api

echo ""
echo "7. Vérification du démarrage:"
echo "----------------------------"
sleep 5
docker ps | grep iris-api

echo ""
echo "8. Vérification de l'image utilisée:"
echo "------------------------------------"
docker inspect iris-api --#!/bin/bash

echo "🔧 CORRECTION IRIS-API"
echo "====================="

echo ""
echo "1. Arrêt et suppression du mauvais conteneur:"
echo "---------------------------------------------"
docker stop iris-api
docker rm iris-api

echo ""
echo "2. Vérification de l'image correcte:"
echo "------------------------------------"
docker pull takhtoukh/iris-api:latest
docker images | grep iris-api

echo ""
echo "3. Nettoyage:"
echo "------------"
docker system prune -f

echo ""
echo "4. Création des réseaux si nécessaire:"
echo "-------------------------------------"
docker network create web --driver bridge 2>/dev/null || echo "Réseau 'web' existe déjà"
docker network create private --driver bridge 2>/dev/null || echo "Réseau 'private' existe déjà"

echo ""
echo "5. Démarrage du conteneur corrigé:"
echo "---------------------------------"
docker run -d \
    --name iris-api \
    --restart always \
    --network web \
    -e SPRING_PROFILES_ACTIVE=prod \
    -e SPRING_DATASOURCE_URL=jdbc:postgresql://iris-postgres:5432/iris_coiffure_db \
    -e SPRING_DATASOURCE_USERNAME=admin \
    -e SPRING_DATASOURCE_PASSWORD=youAdmin123 \
    -e SERVER_PORT=8087 \
    -e SERVER_FORWARD_HEADERS_STRATEGY=FRAMEWORK \
    -e SERVER_USE_FORWARD_HEADERS=true \
    --label "traefik.enable=true" \
    --label "traefik.http.routers.iris-api.entrypoints=websecure" \
    --label "traefik.http.routers.iris-api.rule=Host(\`api.iriscoiffure.com\`)" \
    --label "traefik.http.services.iris-api.loadbalancer.server.port=8087" \
    --label "traefik.http.routers.iris-api.tls.certresolver=lets-encr" \
    --label "traefik.docker.network=web" \
    --label "traefik.http.middlewares.iris-api-headers.headers.customrequestheaders.X-Forwarded-Proto=https" \
    --label "traefik.http.routers.iris-api.middlewares=iris-api-headers" \
    --health-cmd="wget --no-verbose --tries=1 --spider http://localhost:8087/actuator/health || exit 1" \
    --health-interval=30s \
    --health-timeout=10s \
    --health-retries=3 \
    --health-start-period=60s \
    takhtoukh/iris-api:latest

echo ""
echo "6. Connexion au réseau private (pour base de données):"
echo "-----------------------------------------------------"
docker network connect private iris-api

echo ""
echo "7. Vérification du démarrage:"
echo "----------------------------"
sleep 5
docker ps | grep iris-api

echo ""
echo "8. Vérification de l'image utilisée:"
echo "------------------------------------"
docker inspect iris-api --
