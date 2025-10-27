#!/usr/bin/env bash
#

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
    read -p " Would you like to Update and Install package Files? (Y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]
		then
        # Update system repos
        echo -e "\n ${Cyan} Updating package repositories.. ${Color_Off}"
     	sudo  apt-get update -y
        sudo apt-get upgrade -y
    elif [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		return 1
	fi
}

requiredPackages(){
	  read -p " Would you like to install required package Files? (Y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[yY]$ ]]
            then
            echo -e "\n ${Cyan} Installing required packages and modules.. ${Color_Off}";
            sudo apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python -y
    elif [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		return 1
	fi

}

webminPackages() {
    read -p " Would you like to install required package Files for WEBmin? (Y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[yY]$ ]]
            then
            # Permissions
            echo -e "\n ${Cyan} Downloading Packages.. ${Color_Off}"
            sudo wget http://prdownloads.sourceforge.net/webadmin/webmin_1.920_all.deb
    elif [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		return 1
	fi  
}

insstallWebmin() {
	 read -p " Would you like to install WEBMIN? (Y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[yY]$ ]]
            then
            # Permissions
            echo -e "\n ${Cyan} Install Webmin.. ${Color_Off}"
            sudo dpkg --install webmin_1.920_all.deb
    elif [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		return 1
	fi  
}


# RUN
update
requiredPackages
webminPackages
insstallWebmin

echo -e "\n${Green} WEBmin Installation SUCCESS! ${Color_Off}"
