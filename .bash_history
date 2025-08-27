ls
cd ../
ls
cd ubuntu
sudo nano jenkins.Dockerfile
docker
sudo nano docker-compose.yml
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
sudo nano 
tls:
  stores:
    default:
      defaultCertificate:
        certFile: /etc/ssl/traefik/cert.pem
        keyFile: /etc/ssl/traefik/privkey.pem
  certificates:
    - certFile: /etc/ssl/traefik/cert.pem
      keyFile: /etc/ssl/traefik/privkey.pem++++++++++++++++++++0
sudo nano tls.yml
sudo nano acme.json
sudo touch acme.json
docker compose up
sudo docker compose up
docker compose up -d --build
sudo docker compose up -d --build
docker network create private
sudo docker network create private
docker network create private
sudo docker compose up -d --build
docker network create web
sudo docker network create web
sudo docker compose up -d --build
docker logs traefik
sudo docker logs traefik
sudo chmod 600 acme.json
sudo chown 1000:1000 acme.json   # 1000 = user jenkins/traefik selon ton conteneur
sudo docker compose up -d --build
sudo docker compose down
sudo docker compose up -d --build
sudo docker logs traefik
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
sudo docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
sudo docker logs traefik
sudo docker logs gogs
sudo docker compose down
sudo docker compose up -d --build
sudo docker logs traefik
sudo docker logs gogs
ls
cd data
ls
sudo rm -rf ./data/gogs
ls
sudo rm -rf gogs
ls

sudo docker compose down
sudo docker compose up -d --build
sudo rm -rf ./data/gogs
sudo docker compose down
sudo docker compose up -d --build
sudo docker compose up -d --builddocker exec -it gogs-db psql -U gogs -d gogs
docker exec -it gogs-db psql -U gogs -d gogs
sudo docker exec -it gogs-db psql -U gogs -d gogs
sudo docker restart gogs
sudo cat /data/gogs/conf/app.ini
sudo rm -rf ./data/gogs
sudo docker restart gogs
sudo docker exec -it gogs-db psql -U gogs -d gogs
docker logs gogs-db
sudo docker logs gogs-db
docker-compose stop gogs
sudo docker-compose stop gogs
docker-compose up -d gogs
sudo docker-compose up -d gogs
ls
cd data
ls
cd gogs
ls
sudo chmod 700 postgres
cd ../
sudo docker restart gogs
cd gogs
sudo docker restart gogs-db
docker ps
sudo docker ps
sudo docker exec -it traefik curl -s http://127.0.0.1:8080/api/rawdata | jq '.http.routers' 
sudo docker exec -it traefik
sudo docker exec -it traefik bash
sudo docker exec -it traefik sh
nano
sudo nano docker-compose.yml
sudo docker compose down
sudo docker-compose up -d gogs
sudo docker compose up -d
sudo docker exec -it traefik sh
sudo nano docker-compose.yml
docker logs iris-api
sudo docker exec -it traefik sh
sudo docker stop traefik
sudo docker rm traefik
sudo nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
docker stop iris-api
docker rm iris-api
sudo docker compose up -d
sudo nano docker-compose.yml
sudo docker exec -it traefik curl -s http://127.0.0.1:8080/api/rawdata | jq '.http.routers' 
sudo docker exec -it traefik curl -s http://127.0.0.1:8080/api/rawdata
sudo docker logs traefik
curl -v https://api.iriscoiffure.com/actuator/health
sudo nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
curl -v https://api.iriscoiffure.com/actuator/health
sudo docker logs traefik
sudo docker logs iris-api
curl -v https://api.iriscoiffure.com/actuator/health
sudo docker exec -it traefik curl -s http://127.0.0.1:8080/api/rawdata
sudo docker exec -it traefik sh
sudo nano docker-compose.yml
sudo docker logs iris-api
sudo docker restart iris-api
sudo docker logs iris-api
sudo docker restart traefik
sudo docker logs iris-api
sudo nano docker-compose.yml
sudo docker restart iris-api
sudo docker restart traefik
sudo docker compose down
sudo docker compose up -d
sudo nano docker-compose.yml
sudo docker compose up -d
sudo nano docker-compose.yml
sudo docker compose up -d
sudo nano docker-compose.yml
sudo docker compose up -d
docker logs iris-display
sudo nano docker-compose.yml
sudo docker compose up -d
sudo nano docker-compose.yml
sudo docker compose up -d
sudo nano docker-compose.yml
sudo docker compose up -d
sudo nano docker-compose.yml
sudo docker compose up -d
docker ps | grep iris-api
docker inspect iris-api | grep -A 10 Networks
docker inspect iris-api | grep -A 20 Labels
sudo nano fix.sh
fix.sh
sh fix.sh
sudo docker exec -it traefik sh
# Vérifier l'image utilisée (doit être takhtoukh/iris-api:latest)
docker inspect iris-api --format='{{.Config.Image}}'
# Vérifier les réseaux (doit inclure 'web')
docker inspect iris-api | grep -A 10 Networks
# Vérifier les labels Traefik (port doit être 8087)
docker inspect iris-api | grep "loadbalancer.server.port"# Vérifier l'image utilisée (doit être takhtoukh/iris-api:latest)
docker inspect iris-api --format='{{.Config.Image}}'

# Vérifier les réseaux (doit inclure 'web')
docker inspect iris-api | grep -A 10 Networks

# Vérifier les labels Traefik (port doit être 8087)
docker inspect iris-api | grep "loadbalancer.server.port"
[200~# Vérifier l'image utilisée (doit être takhtoukh/iris-api:latest)
docker inspect iris-api --format='{{.Config.Image}}'

# Vérifier les réseaux (doit inclure 'web')
docker inspect iris-api | grep -A 10 Networks

# Vérifier les labels Traefik (port doit être 8087)
docker inspect iris-api | grep "loadbalancer.server.port"~

docker inspect iris-api --format='{{.Config.Image}}'
docker inspect iris-api | grep -A 10 Networks
docker inspect iris-api | grep "loadbalancer.server.port"
docker ps
sudo docker exec -it iris-api sh
apk add --no-cache curl
curl -v http://localhost:8080/
sudo docker exec -it traefik sh
docker ps
sudo nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
docker stop "/iris-api"
docker rm "/iris-api"
sudo docker compose up -d
docker ps
docker logs iris-api
sudo nano docker-compose.yml
docker rm "/iris-api"
sudo docker compose down
sudo docker compose up -d
docker ps
docker logs iris-api
docker ps
docker logs iris-api
docker inspect iris-api | grep -A 10 Healthdocker inspect iris-api | grep -A 10 Health
docker inspect iris-api | grep -A 10 Health
docker exec -it iris-api curl http://localhost:8087/health
docker run -d --name iris-api-temp -p 8087:8087 takhtoukh/iris-api:latest
docker exec -it iris-api curl http://localhost:8087/health
docker inspect iris-api | grep -A 10 Health
docker exec -it iris-api ps aux
docker exec -it iris-api netstat -tlnp 2>/dev/null || docker exec -it iris-api ss -tlnp
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/actuator/health
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087
docker exec -it iris-api wget -qO- http://localhost:8087/ 2>&1
docker exec -it iris-api wget -qO- http://localhost:8087/actuator/health 2>&1
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/api/
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/health
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/status
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/ping
docker exec -it iris-api find / -name "application*.properties" -o -name "application*.yml" -o -name "application*.yaml" 2>/dev/null | head -10
sudo docker exec -it iris-api find / -name "application*.properties" -o -name "application*.yml" -o -name "application*.yaml" 2>/dev/null | head -10
docker exec -it iris-api ls -la /app/ 2>/dev/null || echo "No /app directory"
sudo docker exec -it iris-api ls -la / | grep -E "(app|config)"
docker exec -it iris-api wget -S -O /dev/null http://localhost:8087/ 2>&1
curl -v http://localhost:8087/ 2>&1 | head -20
docker history takhtoukh/iris-api:latest --no-trunc
docker logs iris-api
docker logs iris-api-temp
docker ps | grep iris-api-temp
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/actuator/health
# Spring Boot often uses these patterns
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/actuator
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/management/health
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/iris-api/actuator/health
# Stop the current container
docker stop iris-api
docker rm iris-api
# Run without health check to see if it works
docker run -d --name iris-api-no-health   --network iris_default   -p 8087:8087   takhtoukh/iris-api:latest
# Check logs
docker logs -f iris-api-no-health
docker rm iris-apidocker run -d --name iris-api-no-health   --network iris_default   -p 8087:8087   takhtoukh/iris-api:latest
docker logs -f iris-api-no-health
docker network ls
docker inspect traefik | grep -A 5 Networks
docker rm iris-api-no-health
docker run -d --name iris-api-debug   --network traefik_default   -p 8087:8087   takhtoukh/iris-api:latest
docker exec -it iris-api java -jar app.jar --help 2>&1 | head -10
docker exec -it iris-api ls -la /app/
docker logs iris-api
sudo docker compose up -d
docker exec -it iris-api ls -la /app/
docker logs iris-api
docker exec -it iris-api ls -la /app/
docker logs iris-api
docker run -d --name iris-api-test   --network $(docker inspect traefik | grep -A1 '"Name"' | tail -1 | cut -d'"' -f4)   -p 8088:8087   takhtoukh/iris-api:latestdocker run -d --name iris-api-test   --network $(docker inspect traefik | grep -A1 '"Name"' | tail -1 | cut -d'"' -f4)   -p 8088:8087   takhtoukh/iris-api:latest
docker run -d --name iris-api-test   --network $(docker inspect traefik | grep -A1 '"Name"' | tail -1 | cut -d'"' -f4)   -p 8088:8087   takhtoukh/iris-api:latest run -d --name iris-api-test   --network $(docker inspect traefik | grep -A1 '"Name"' | tail -1 | cut -d'"' -f4)   -p 8088:8087   takhtoukh/iris-api:latest
docker run -d --name iris-api-test   --web $(docker inspect traefik | grep -A1 '"Name"' | tail -1 | cut -d'"' -f4)   -p 8088:8087   takhtoukh/iris-api:latest
docker run -d --name iris-api-test   --network web   -p 8088:8087   takhtoukh/iris-api:latest
docker stop /iris-api-test/iris-api-test
docker stop /iris-api-test
docker run -d --name iris-api-test   --network web   -p 8088:8087   takhtoukh/iris-api:latest
docker stop /iris-api-test
docker rm /iris-api-test
docker run -d --name iris-api-test   --network web   -p 8088:8087   takhtoukh/iris-api:latest
curl -I http://localhost:8088/api/
curl -I http://localhost:8088/actuator/health
sudo nano docker-compose.yml
sudo docker compose down
docker ps
sudo docker compose up -d
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/health
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/public/health
docker logs iris-api
docker exec -it iris-api wget --no-verbose --tries=1 --spider http://localhost:8087/public/health
docker exec -it iris-api wget -qO- --http-user=user --http-password=a9ed59b1-02fe-49d9-8c91-b037061c3e6a http://localhost:8087/actuator/health
docker inspect traefik | grep -A 5 Networks
docker inspect traefik | grep -A 15 Networks
docker inspect traefik | grep -A  Networks
docker inspect traefik | grep -A 50  Networks
git init
git init .
git add remote https://github.com/takhtoukh78/iris-workflow.git
git add -remote https://github.com/takhtoukh78/iris-workflow.git
git remote add origin https://github.com/takhtoukh78/iris-workflow.git
git add .
sudo git add .
git commit
sudo git add .
sudo git add docker-compose.yml
git commit
sudo git commit
git push -u main
git push -u mster
git push -u master
git push origin main
git push origin master
git push -u origin master
git push origin -u master
git add .
echo "data/" >> .gitignore
echo "*.log" >> .gitignore
git add .
ls
echo "*.log" >> .gitignore
git add .
sudo nano .gitignore
git add .
sudo rm docker-compose-final.yml'
sudo rm docker-compose-final.yml
sudo rm docker-compose-final.yml
git add .
sudo rm docker-compose-temp.yml
git add .
sudo rm docker-compose.ymlold
git add .
sudo chown -R ubuntu:ubuntu .git
sudo chown -R ubuntu:ubuntu .
ls -ld .git
ls -l .git/objects
git add .
sudo git commit
git commit -m "first commit"
git push -u origin main
git push -u origin master
ssh-keygen -t ed25519 -C "takhtoukh76@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
git remote set-url origin git@github.com:takhtoukh78/iris-workflow.git
ssh -T git@github.com
git push -u origin master
sudo nano diagnostic-iris-api.sh
./diagnostic-iris-api.sh
sudo ./diagnostic-iris-api.sh
sh diagnostic-iris-api.sh
sudo docker compose up -d
sudo docker down
sudo docker compose down
sudo docker compose up -d
sudo rm docker-compose.ymlold
sudo rm docker-compose.yml
sudo nano docker-compose.yml
sudo docker compose up -d
sudo nano docker-compose.yml
sudo rm docker-compose.yml
sudo nano docker-compose.yml
sudo docker compose up -d
sudo rm docker-compose.yml
sudo nano docker-compose.yml
sudo docker compose up -d
docker logs iris-postgres
sudo rm docker-compose.yml
sudo nano docker-compose.yml
sudo docker compose up -d
sudo nano docker-compose.yml
sudo rm docker-compose.yml
sudo nano docker-compose.yml
sudo docker compose up -d
docker logs iris-api 
sudo rm docker-compose.yml
sudo nano docker-compose.yml
sudo docker compose up -d
docker logs iris-api 
sudo docker logs traefik
docker ps | grep iris-api
sudo nano docker-compose.yml
sudo docker compose up -d
docker logs iris-api --tail 50
docker exec iris-api curl -f http://localhost:8087/actuator/health
docker exec iris-api netstat -tlnp | grep 8087
docker exec iris-api wget -qO- http://localhost:8087/actuator/health
docker exec iris-api netstat -tlnp 2>/dev/null || docker exec iris-api ss -tlnp
docker logs iris-api --tail 50
# Tester différents chemins possibles
docker exec iris-api wget -qO- http://localhost:8087/
docker exec iris-api wget -qO- http://localhost:8087/health
docker exec iris-api wget -qO- http://localhost:8087/actuator/
docker exec iris-api wget -qO- http://localhost:8087/management/health
# Voir tous les endpoints mappés dans les logs de démarrage
docker logs iris-api | grep -i "Mapped\|actuator\|endpoint"# Tester différents chemins possibles
docker exec iris-api wget -qO- http://localhost:8087/
docker exec iris-api wget -qO- http://localhost:8087/health
docker exec iris-api wget -qO- http://localhost:8087/actuator/
docker exec iris-api wget -qO- http://localhost:8087/management/health
# Voir tous les endpoints mappés dans les logs de démarrage
docker logs iris-api | grep -i "Mapped\|actuator\|endpoint"
ubuntu@vps-f3bb2982:~$ # Tester différents chemins possibles
docker exec iris-api wget -qO- http://localhost:8087/
docker exec iris-api wget -qO- http://localhost:8087/health
docker exec iris-api wget -qO- http://localhost:8087/actuator/
docker exec iris-api wget -qO- http://localhost:8087/management/health
# Voir tous les endpoints mappés dans les logs de démarrage
docker logs iris-api | grep -i "Mapped\|actuator\|endpoint"# Tester différents chemins possibles
docker exec iris-api wget -qO- http://localhost:8087/
docker exec iris-api wget -qO- http://localhost:8087/health
docker exec iris-api wget -qO- http://localhost:8087/actuator/
docker exec iris-api wget -qO- http://localhost:8087/management/health
# Voir tous les endpoints mappés dans les logs de démarrage
docker logs iris-api | grep -i "Mapped\|actuator\|endpoint"
wget: server returned error: HTTP/1.1 404
grep: Tester: No such file or directory
grep: différents: No such file or directory
grep: chemins: No such file or directory
grep: possibles: No such file or directory
wget: server returned error: HTTP/1.1 404
ubuntu@vps-f3bb2982:~$
docker logs iris-api | grep -i "Mapped\|actuator\|endpoint"
docker exec iris-api ps aux
docker exec iris-api wget -qO- http://localhost:8087/anything 2>&1
sudo rm docker-compose.yml
sudo nano docker-compose.yml
sudo docker compose up -d
sudo rm docker-compose.yml
sudo nano docker-compose.yml
sudo docker compose up -d
docker exec iris-api ps aux
docker ps
curl -k https://gogs.iriscoiffure.com/admin-coif/Salon-coiffure-back
sudo docker compose down
sudo docker compose up -d
docker exec jenkins curl -I http://gogs:3000/admin-coif/Salon-coiffure-back
docker exec jenkins curl -I https://gogs.iriscoiffure.com/admin-coif/Salon-coiffure-back
curl -k https://gogs.iriscoiffure.com/
docker exec jenkins curl http://gogs:3000/admin-coif/
http://gogs:3000/admin-coif/Salon-coiffure-back.git
docker exec -it jenkins bash
docker ps | grep iris-api
docker logs iris-api --tail 50
docker stop iris-api-test
docker rm iris-api-test
docker stop iris-api-test
docker rm iris-api-test
docker logs iris-api | head -100
docker exec iris-api wget -qO- http://localhost:8087/
docker exec iris-api wget -qO- http://localhost:8087/swagger-ui/index.html
docker exec iris-api wget -qO- http://localhost:8087/actuator/
docker logs iris-api | grep -i "Mapped\|endpoint"
docker exec -it iris-api curl http://localhost:8087/v3/api-doc
docker exec iris-api wget -qO- http://localhost:8087/swagger-ui/index.html
docker exec iris-api wget -qO- http://localhost:8087/v3/api-docs
docker logs iris-api | grep -i "Mapped\|endpoint"
docker logs iris-api
git add .
sudo chmod 700 postgres
git add .
sudo git add .
git commit -m "first commit"
git push -u origin master
ls
cat acme.json 
ping api.iriscoiffure.com
PING api.iriscoiffure.com (123.45.67.89): 56 data bytes
dig api.iriscoiffure.com +short
curl -vk https://api.iriscoiffure.com
curl -vk https://api.iriscoiffure.com/
docker logs iris-api
sudo nano docker-compose.yml
sudo docker compose up -d
docker stop iris-api
docker rm iris-api
sudo docker compose up -d
docker logs iris-api
docker ps
sudo docker compose up -d iris-api
docker logs iris-api
sudo nano docker-compose.yml
docker logs iris-api
sudo docker compose up -d iris-api
docker logs iris-api
sudo nano docker-compose.yml
sudo docker compose up -d iris-api
docker logs iris-api
docker exec iris-api wget -qO- http://localhost:8087/swagger-ui/index.html
docker exec iris-api wget -qO- http://localhost:8087/swagger-ui.html
docker logs iris-api
docker exec iris-api wget -qO- http://localhost:8087/swagger-ui/index.html
docker exec iris-api wget -qO- http://localhost:8087/swagger-ui/
docker exec -it iris-api sh
sudo nano docker-compose.yml
sudo docker compose up -d iris-api
docker exec -it iris-api sh
wget -qO- http://localhost:8087/swagger-ui/
docker exec -it iris-api sh
docker logs iris-api
docker exec -it iris-api sh
sudo nano docker-compose.yml
sudo docker compose up -d iris-api
docker logs iris-api
docker exec -it iris-api sh
docker exec iris-api env | grep SERVER_PORT
sudo nano docker-compose.yml
docker exec -it traefik curl -kv http://iris-api:8087/v3/api-docs
docker network inspect web
docker run --rm --network web byrnedo/alpine-curl http://iris-api:8087/v3/api-docs
docker exec -it traefik /bin/sh
apk add --no-cache curl
curl -kv http://iris-api:8087/v3/api-docs
sudo nano docker-compose.yml
docker exec -it traefik traefik api
docker exec -it traefik traefik show routers
docker exec -it traefik traefik show services
docker exec -it traefik traefik show routers
docker exec -it traefik traefik show services
sudo nano docker-compose.yml
sudo docker compose up -d traefik
docker exec -it traefik ping iris-api
docker exec -it traefik wget -qO- http://iris-api:8087/v3/api-docs
exit
