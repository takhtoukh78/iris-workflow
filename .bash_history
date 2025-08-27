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
