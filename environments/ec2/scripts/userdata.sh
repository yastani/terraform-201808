#!/bin/bash

# httpd
sudo yum -y install httpd
sudo chkconfig httpd on
sudo mkdir -p /var/www/html
sudo echo ${RANDOM} > /var/www/html/index.html
sudo service httpd start

# mysql57
sudo yum -y install mysql57