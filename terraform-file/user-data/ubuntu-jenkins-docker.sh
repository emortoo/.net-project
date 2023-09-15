#!/bin/bash

# Install and start docker as a service 
# This script works on amazon linux server  
# Your server must have at least 4GB of RAM

#update the server and change timezone and hostname 
sudo apt update -y
sudo hostnamectl set-hostname jenkins-docker-server
sudo timedatectl set-timezone America/New_York

#1.Install prerequisit: JAVA, git, unzip
sudo apt install wget git unzip tar -y
sudo apt install openjdk-17-jre -y

#2. Add the Jenkins repo using the following command and Import a key file from Jenkins-CI to enable installation from the package:

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y
sudo apt install jenkins -y 


#5. Start and Enable the Jenkins service to start at boot:
sudo systemctl enable jenkins
sudo systemctl start jenkins

###################################################################################


#1. Installing Docker and Docker compose, git and java on Amazon linux server 
sudo apt-get install docker.io -y
sudo chmod 777 /var/run/docker.sock 


#2 Enable and start the nexus services
sudo systemctl start docker
sudo systemctl enable docker

#3 Add docker to the user group 
sudo usermod -aG docker $USER
  
###################################################################################

sudo apt-get install wget apt-transport-https gnupg lsb-release

wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list

sudo apt-get update

sudo apt-get install trivy -y

#5 Installation complete  
echo "end of installation" 

