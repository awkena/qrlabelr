#!/bin/bash

# update vm 
sudo yum -y update 

# install docker
sudo yum -y install docker
sudo systemctl start docker
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -aG docker ec2-user
sudo chkconfig docker on
sudo yum install -y git
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl enable docker
sudo docker pull calebyeboah/qrlabelr:1.0.2
sudo docker run -d -p 80:80 calebyeboah/qrlabelr:1.0.2
