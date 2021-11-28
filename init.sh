#!/bin/sh
#

Color_Off='\033[0m'       # Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan


###### VARIABLES ########
webserver="nginx"
sudoPass="rootme"
doweFiles=".doweFiles"
phpVersion="8.0"
mysql="mysql_install.sh"
nginx="nginx_install.sh"
phpmyadmin="phpmyadmin_installation.sh"


###### END VARIABLES ######

sudo clear;
echo "Welcome to the Dowe Server Files Installation....";
echo "Please enter the name of the file you would like to install";
echo -n "Options are: [1] NGINX, [2] MySql, [3] SQLite3, [4] PHPMyAdmin, [5] Gittea, [0] Install All | ";

read OPTION;

	case $OPTION in
		1)
			echo -n $webserver;;
		4)
			exec $doweFiles/$phpmyadmin;;
		2)
			exec $doweFiles/$mysql;;
		3)
			echo -n "SQLite3";;
		5)
			echo -n "Gittea";;
		0) 	
			echo -n "Install All";;
		*)
			echo -n "\n ${Red} ERROR: Option $OPTION not available...${Color_Off}\n";;
	esac
			

	
	