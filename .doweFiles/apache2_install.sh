#!/bin/sh
#  <-- THIS IS A COMMENT
# VARIABLE = "HELLO"
# echo $VARIABLE

###### VARIABLES ########
webserver="apache2"
filesFolder="."
phpini="php.ini"
testphp="index.php"
webserverDefault="apache2Default"
phpVersion="8.4"
# Temporary Directory
TMP="/var/tmp/"
REPO="https://raw.githubusercontent.com/mrjohndowe/Raspi-Config/refs/heads/master/.doweFiles/"

###### END VAR ######

# INSTALLING APACHE2

echo "Getting ready to install APACHE2 WebServer with PHP ${phpVersion} support";

echo "UPDATING.....";
sudo apt-get update -y;

echo "UPGRADING.....";
sudo apt-get upgrade -y;

echo "Installing APACHE2 WebServer";
sudo apt-get autoremove nginx -y;
sudo apt-get install apache2 -y;

echo "Starting the WebServer: APACHE2"
sudo systemctl start apache2;

echo "Install PHP and all dependecies  needed";
sudo apt-get install php$phpVersion-fpm php$phpVersion-mbstring php$phpVersion-mysql php$phpVersion-curl php$phpVersion-gd php$phpVersion-curl php$phpVersion-zip  php$phpVersion-xml php$phpVersion-sqlite3 php$phpVersion-bz2 php$phpVersion-intl php-smbclient php$phpVersion-imap php$phpVersion-gmp -y;


# echo "Waiting for the user to edit the file";
# echo "FIND > index index.html index.htm;";
# echo "REPLACE WITH > index index.php index.html index.htm;";
# echo "FIND >";
# echo " #location ~ \.php$ {";
# echo "  #       include snippets/fastcgi-php.conf;";
# echo "  #";
# echo "  #       # With php5-cgi alone:";
# echo "  #       fastcgi_pass 127.0.0.1:9000;";
# echo "  #       # With php5-fpm:";
# echo "  #       fastcgi_pass unix:/var/run/php5-fpm.sock;";
# echo "  #}";
# echo " REPLACE WITH >";
# echo "location ~ \.php$ { ";
# echo "               include snippets/fastcgi-php.conf; ";
# echo "               fastcgi_pass unix:/var/run/php/php8.0-fpm.sock; ";
# echo "        } ";
sudo curl -s ${REPO}${webserverDefault} > /etc/nginx/sites-enabled/default
sudo chown root:root /etc/nginx/sites-enabled/default

echo " Reloading the WebServer NGINX";
sudo systemctl force-reload nginx;

sudo curl -s ${REPO}${testphp} > /var/www/html/index.php
sudo chown www-data:www-data /var/www/html/index.php


echo "Installing the PHP.ini file";
sudo curl -s ${REPO}${phpini} > /etc/php/$phpVersion/fpm/$phpini
sudo chown root:root /etc/php/$phpVersion/fpm/$phpini

echo "Reloading the webserver and php";
sudo service nginx stop; sudo service php$phpVersion-fpm force-reload; sudo service nginx start;

echo "Congratulations you have successfully installed NGINX with PHP ${phpVersion}";
sudo service --status-all;
sleep 5
clear;