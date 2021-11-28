
Color_Off='\033[0m'       # Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

files=".doweFiles"

update() {
	# Update system repos
	echo -e "\n ${Cyan} Updating package repositories.. ${Color_Off}"
	sudo apt -qq update 
}

installPHP(){
	echo -e "\n ${Cyan} Installing PHP and common Modules.. ${Color_Off}";
	sudo apt -qy install php8.0-sqlite3 php8.0-fpm php8.0-mbstring php8.0-mysql php8.0-curl php8.0-gd php8.0-curl php8.0-zip php8.0-xml php8.0-bz2 php8.0-intl php-smbclient php8.0-imap php8.0-gmp libapache2-mod-php8.0;
	
}

installMyAdmin(){
	echo -e "\n ${Cyan} Installing PHPMyAdmin and common Modules.. ${Color_Off}";
	sudo apt-get install phpmyadmin -y;
	sudo ln -s /usr/share/phpmyadmin /var/www/html
	
}

setPermissions() {
	# Permissions
	echo -e "\n ${Cyan} Setting Ownership for /var/www.. ${Color_Off}"
	sudo chown -R www-data:www-data /var/www
}

copyPHPini(){
	echo -e "\n ${Yellow} Copying Files.. ${Color_Off}"
	cd $doweFiles;
	sudo cp php.ini >> /etc/php/8.0/fpm/php.ini -y;
	sudo cp nginxDefault /etc/nginx/sites-enabled/default -y;
	cd ../
}

restartWebServer() {
	# Restart NGINX
	echo -e "\n ${Cyan} Restarting NGINX.. ${Color_Off}"
	sudo service nginx restart
}
restartAll(){
	echo -e "\n ${Yellow} Restarting All Services.. ${Color_Off}"
	sudo service nginx stop; service php8.0-fpm force-reload; service nginx start;
	
}


#RUN
update
installPHP
installMyAdmin
copyPHPini
setPermissions
restartWebServer
restartAll

echo -e "\n${Green} SUCCESS! MySQL password is: ${PASS_MYSQL_ROOT} ${Color_Off}"