
Color_Off='\033[0m'       # Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Temporary Directory
TMP="/var/tmp/"
REPO="https://github.com/mrjohndowe/Raspi-Config/tree/master/.doweFiles/"

update() {
	# Update system repos
	echo -e "\n ${Cyan} Updating package repositories.. ${Color_Off}"
	sudo apt -qq update 
}

installMyAdmin(){
	echo -e "\n ${Cyan} Installing PHPMyAdmin and common Modules.. ${Color_Off}";
	sudo apt-get install phpmyadmin -y;
	sudo ln -s /usr/share/phpmyadmin /var/www/html/
	
}

setPermissions() {
	# Permissions
	echo -e "\n ${Cyan} Setting Ownership for /var/www.. ${Color_Off}"
	sudo chown -R www-data:www-data /var/www
}

restartWebServer() {
	# Restart NGINX
	echo -e "\n ${Cyan} Restarting NGINX.. ${Color_Off}"
	sudo service nginx restart
}
restartAll(){
	echo -e "\n ${Yellow} Restarting All Services.. ${Color_Off}"
	sudo service nginx stop; service php8.4-fpm force-reload; service nginx start;
	
}

# RUN
update
installMyAdmin
setPermissions
restartWebServer
restartAll

echo -e "\n${Green} PHPMyAdmin Installation SUCCESS! ${Color_Off}"
clear