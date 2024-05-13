# Jenkins-EC2-Terraform

## Terraform

Execute only Specific Resources in Terraform 

```
terraform apply --auto-approve -target=module.frontend -target=module.backend
```

## Deploy DotNet Application to ECS Cluster

    -> Install Jenkins in EC2
    -> Clone dotnet repo
    -> Create ECR and push the docker image
    -> Create ECS cluster and deploy the application

### Install Jenkins on EC2:

sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo dnf install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

Ref - https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/

### Generate and Add SSH Key:

ssh-keygen

### Install Docker:

yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo service jenkins restart
sudo service docker restart

### Add docker pipeline plugin

Ref - https://medium.com/@vijulpatel865/building-docker-image-using-jenkins-pipeline-push-it-to-aws-ecr-aa02cc7a295e

DotNet Code Repo - https://github.com/nopSolutions/nopCommerce/tree/release-4.50.4

### Create Jenkinsfile:

Build DotNet App - https://medium.com/southworks/creating-a-jenkins-pipeline-for-a-net-core-application-937a2165b073

https://medium.com/@vijulpatel865/building-docker-image-using-jenkins-pipeline-push-it-to-aws-ecr-aa02cc7a295e

https://medium.com/appgambit/part-1-running-docker-on-aws-ec2-cbcf0ec7c3f8

https://stackoverflow.com/questions/48957195/how-to-fix-docker-got-permission-denied-issue
sudo chmod 666 /var/run/docker.sock
