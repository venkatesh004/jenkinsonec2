#!/bin/bash

# Install Jenkins
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo dnf install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Docker
sudo yum install docker -y
sudo service docker start

sudo service jenkins restart
sudo service docker restart

sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock

# Install Git
sudo yum install git -y

# Install Maven
sudo yum install maven -y

# Install NPM
sudo yum install npm -y

# Install DotNet
sudo yum install dotnet -y

# Generate SSH Key
# ssh-keygen -N "" -f "/home/ec2-user/.ssh/id_rsa"
