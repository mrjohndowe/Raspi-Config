#!/bin/bash
# 
# Repo Location that contains all the scripts to run
REPO="https://scm.genesisrage.net/mrjohndowe/Raspi-Config/raw/branch/master/"
DOWEFILES=".doweFiles/"

# Location to save the scripts
SCRIPTS_PATH="/usr/local/bin/"

# Colors 
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
# Temp Location Folder
TEMP="/var/tmp/"

echo -e "${Cyan} Welcome to the Dowe Server Files Installation....${Color_Off}";

###### END VARIABLES ######

# BASH PROFILE
#############
# Copy the bashrc, profile, and bash_aliases file from the repository
bash_copy(){
	curl -s ${REPO}.bashrc > ~/.bashrc
	curl -s ${REPO}.bash_aliases > ~/.bash_aliases
	curl -s ${REPO}.nanorc > ~/.nanorc
	curl -s ${REPO}.profile > ~/.profile
}

# MOTD SETUP
############
motd() {
	read -p " Would you like to setup MOTD? (Y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]
	then
	# Download the MOTD Files
	sudo wget ${REPO}${doweFiles}/motd.sh -O /etc/profile.d/motd.sh
	# Change Ownership of the file
	sudo chown root:root /etc/profile.d/motd.sh
	# Set the correct permissions
	sudo chmod +x /etc/profile.d/motd.sh
	# Create a backup of the Default MOTD
	sudo mv /etc/motd /etc/motd.BACKUP
	
	elif [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		return 1
	fi
}

# Reload settings / files
#########################
reload() {
  source ~/.bashrc
  sudo service ssh restart
  # Empty Temp dir?
}

install_nginx() {
	read -p " Would you like to install NGINX? (Y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]
	then
	# Download the NGINX Files
	sudo curl -s ${REPO}${doweFiles}/$nginx | bash
	
	elif [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		return 1
	fi
}

motd
bash_copy
install_nginx

echo -n "${Yellow} Reloading.. ${Color_Off}"
reload

echo -n "${Green} All done. Enjoy! ${Color_Off}"
