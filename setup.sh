#!/usr/bin/env bash

# update
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y software-properties-common


# php
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update -y
sudo apt install -y php8.0 php8.0-curl php8.0-fpm php8.0-gd php8.0-intl php8.0-imagick php8.0-mysql php8.0-mbstring php8.0-mcrypt php8.0-zip php8.0-xml php8.0-xmlrpc ghostscript imagemagick
sudo systemctl enable php8.0-fpm
sudo systemctl start php8.0-fpm
sudo sed -i "s/;clear_env = no/clear_env = no/" /etc/php/8.0/fpm/pool.d/www.conf


# mysql
sudo apt update -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mariadb-server
sudo systemctl start mysql
sudo systemctl enable mysql
sudo mysql < create-db.sql


# nginx
sudo apt purge -y apache2
sudo apt autoremove -y
sudo apt install -y nginx
#openssl req -nodes -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
#sudo mkdir -p /etc/letsencrypt/live/
#sudo mv cert.pem /etc/letsencrypt/live/nextcloud.example.com.crt
#sudo mv key.pem /etc/letsencrypt/live/nextcloud.example.com.key
#sudo chown -R www-data:www-data /etc/letsencrypt/live/
cp ./nextcloud.conf to /etc/nginx/conf.d/nextcloud.conf


# certbot
sudo apt install -y certbot python3-certbot-nginx
sudo certbot certonly --nginx


# volume
sudo mkdir -p /mnt/volume01/nextcloud
sudo chown -R www-data:www-data /mnt/volume01/nextcloud
