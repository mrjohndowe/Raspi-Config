#!/bin/sh
#  <-- THIS IS A COMMENT
# VARIABLE = "HELLO"
# echo $VARIABLE

###### VARIABLES ########
webserver="nginx"
sudoPass="rootme"
filesFolder="."
phpini="php.ini"
testphp="index.php"
webserverDefault="nginxDefault"

###### END VAR ######

# INSTALLING NGINX

echo "Getting ready to install NGINX";

echo "UPDATING.....";
sudo apt-get update -y;

echo "UPGRADING.....";
sudo apt-get upgrade -y;

echo "Installing NGINX";
sudo apt-get autoremove apache2 -y;
sudo apt-get install nginx -y;

echo "Starting the WebServer: NGINX"
sudo systemctl start nginx;

echo "Install PHP and all dependecies  needed";
sudo apt-get install php8.0-fpm php8.0-mbstring php8.0-mysql php8.0-curl php8.0-gd php8.0-curl php8.0-zip php8.0-xml -y;


echo "Waiting for the user to edit the file";
echo "FIND > index index.html index.htm;";
echo "REPLACE WITH > index index.php index.html index.htm;";
echo "FIND >";
echo " #location ~ \.php$ {";
echo "  #       include snippets/fastcgi-php.conf;";
echo "  #";
echo "  #       # With php5-cgi alone:";
echo "  #       fastcgi_pass 127.0.0.1:9000;";
echo "  #       # With php5-fpm:";
echo "  #       fastcgi_pass unix:/var/run/php5-fpm.sock;";
echo "  #}";
echo " REPLACE WITH >";
echo "location ~ \.php$ { ";
echo "               include snippets/fastcgi-php.conf; ";
echo "               fastcgi_pass unix:/var/run/php/php8.0-fpm.sock; ";
echo "        } ";
sudo cp $webserverDefault >>  /etc/nginx/sites-enabled/default -y;

echo " Reloading the WebServer NGINX";
sudo systemctl force-reload nginx;
sudo cp $testphp >> /var/www/html/index.php -y;

echo "Installing the PHP.ini file";
sudo cp $phpini >> /etc/php/8.0/fpm/$phpini -y;

echo "Reloading the webserver and php";
sudo service nginx stop; service php8.0-fpm force-reload; service nginx start;

echo "Congratulations you have successfully installed NGINX with PHP 8.0";
sudo service --status-all;
echo "Would you like to run the main installation file again? (Y/n) | " ; read ANSWER;
clear;
if($ANSWER == "Y" || $ANSWER == "y" || $ANSWER == "yes" || $ANSWER == "YES")
	then exec ../init.sh;
else 
	echo "Goodbye";
	sleep 1;
	clear;
fi