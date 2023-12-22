#!/bin/bash

# Añadir el usuario 'jenkins' al grupo 'docker'
sudo usermod -aG docker jenkins

# Instalar Java
echo "Installing default-java"
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
sudo java --version

# Instalar Jenkins
echo "Installing Jenkins"
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y

sleep 1m

echo "Password Jenkins"
JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo $JENKINSPWD

# Instalar Docker
echo "Installing docker"
# Añadir la clave GPG oficial de Docker:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Añadir el repositorio a las fuentes de Apt:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo chmod 777 /var/run/docker.sock

# Pasos para instalar Node.js

sudo apt-get install curl -y
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile
nvm ls-remote
nvm install 12.1
node -v
