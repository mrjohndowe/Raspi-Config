#!/usr/bin/bash
# 
# -e option instructs bash to immediately exit if any command [1] has a non-zero exit status
# We do not want users to end up with a partially working install, so we exit the script
# instead of continuing the installation with something broken
#set -e

# Repo Location that contains all the scripts to run
REPO="https://raw.githubusercontent.com/mrjohndowe/Raspi-Config/refs/heads/master/"
#.doweFiles
DOWEFILES=".doweFiles/"
MOTDFILES="motd_files/"

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

echo -e "${Cyan} Welcome to the ${Blue}Dowe Server ${Red}Files Installation${Color_Off}...."

###### VARIABLES ########
webserver="nginx"
doweFiles=".doweFiles"
phpVersion="8.0"
mysql="mysql_install.sh"
nginx="nginx_install.sh"
phpmyadmin="phpmyadmin_installation.sh"
TEMP="/var/tmp/"

# ADMIN CHECK
# #############
# Must be root
str="Root user check"
if [[ ${EUID} -eq 0 ]]; then
    echo -e "  ${TICK} ${str}"
else
    # Check if sudo is actually installed
    # If it isn't, exit because the uninstall can not complete
    if [ -x "$(command -v sudo)" ]; then
        export SUDO="sudo"
    else
        echo -e "  ${CROSS} ${str}
            Script called with non-root privileges
            Thus requires elevated privileges to run"
        exit 1
    fi
fi
# MOTD SETUP
############
motd() {
	read -p " Would you like to setup MOTD? (Y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]
		then
		# Download the MOTD Files
		sudo wget ${REPO}${MOTDFILES}motd1.sh -O /etc/profile.d/motd.sh

		# Change Ownership of the file
		sudo chown root:root /etc/profile.d/motd.sh

		# Set the correct permissions
		sudo chmod +x /etc/profile.d/motd.sh

		# Removal of the Default MOTD
		sudo rm /etc/motd/
	elif [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		return 1
	fi
}

# BASH PROFILE
###################
# Copy the bashrc, profile, and bash_aliases file from the repository
copyFiles(){
	read -p " Would you like to Copy BashRC and Profile Files? (Y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]
		then
		curl -s ${REPO}.bashrc > ~/.bashrc
		curl -s ${REPO}.bash_aliases > ~/.bash_aliases
		curl -s ${REPO}.nanorc > ~/.nanorc
		curl -s ${REPO}.profile > ~/.profile
		curl -s ${REPO}${DOWEFILES}watch_files.sh > ${SCRIPTS_PATH}watch_files.sh
	elif [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		return 1
	fi
}

# WEBSERVER INSTALLATION
#######################
webserverInstall() {
	read -p " Would you like to install NGINX? (Y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]
		then
		# Download the NGINX Files
		sudo curl -s ${REPO}${DOWEFILES}$nginx | sudo bash
	elif [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		return 1
	fi
}
#If the color table file exists,
#################################
if [[ -f "${coltable}" ]]; then
    # source it
    source "${coltable}"
# Otherwise,
else
    # Set these values so the installer can still run in color
    COL_NC='\e[0m' # No Color
    COL_LIGHT_GREEN='\e[1;32m'
    COL_LIGHT_RED='\e[1;31m'
    TICK="[${COL_LIGHT_GREEN}?${COL_NC}]"
    CROSS="[${COL_LIGHT_RED}?${COL_NC}]"
    INFO="[i]"
    # shellcheck disable=SC2034
    DONE="${COL_LIGHT_GREEN} done!${COL_NC}"
    OVER="\\r\\033[K"
fi
# PHPMYADMIN INSTALLATION
########################
phpmyadminInstall() {
	read -p " Would you like to install PHPMyAdmin? (Y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]
		then
		# Download the PHPMyAdmin Files
		sudo curl -s ${REPO}${DOWEFILES}$phpmyadmin | sudo bash
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
    #
}
# SHOW RASBERRY
###############
show_ascii_berry() {
  clear
  echo -e "
        ${COL_LIGHT_GREEN}.;;,.
        .ccccc:,.
         :cccclll:.      ..,,
          :ccccclll.   ;ooodc
           'ccll:;ll .oooodc
             .;cll.;;looo:.
                 ${COL_LIGHT_RED}.. ','.
                .',,,,,,'.
              .',,,,,,,,,,.
            .',,,,,,,,,,,,....
          ....''',,,,,,,'.......
        .........  ....  .........
        ..........      ..........
        ..........      ..........
        .........  ....  .........
          ........,,,,,,,'......
            ....',,,,,,,,,,,,.
               .',,,,,,,,,'.
                .',,,,,,'.
                  ..'''.${COL_NC}
"
}
### RUN
########
show_ascii_berry
motd
show_ascii_berry
copyFiles
show_ascii_berry
webserverInstall
show_ascii_berry
phpmyadminInstall
show_ascii_berry
echo -e "${Yellow} Reloading.. ${Color_Off}"
reload