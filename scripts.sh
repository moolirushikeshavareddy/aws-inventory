#!/bin/bash
sudo yum update -y

#jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#sonarqube
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip
sudo unzip sonarqube-8.9.6.50800.zip
sudo useradd sonar
sudo chown sonar:sonar sonarqube-8.9.6.50800 -R
sudo chmod 777 sonarqube-8.9.6.50800 -R
sudo sh sonarqube-8.9.6.50800/bin/linux-x86-64/sonar.sh start

#trivy
sudo rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.rpm

sudo yum install git maven tree java-17 jenkins docker 

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
