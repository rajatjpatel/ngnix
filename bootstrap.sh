#!/usr/bin/env bash

# "./tools/vagrant/bootstrap.sh"

echo "Provisioning virtual machine..."

echo "Updating packages list"
apt-get update


# Nginx
echo "Installing Nginx"
apt-get install nginx -y

# Nginx Configuration
echo "Configuring Nginx"
sudo cp /vagrant/tools/vagrant/nginx_vhost /etc/nginx/sites-available/nginx_vhost
sudo ln -sf /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/

sudo rm -rf /etc/nginx/sites-available/default

# php
echo "Installing php"
sudo apt-get install php5-common php5-cli php5-fpm -y

# Restart Nginx for the config to take effect
echo "Restarting Nginx"
sudo service nginx restart

