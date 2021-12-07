#!/bin/bash

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

# INSTALLER
###################
# Install inotify-tools
installTools(){
	read -p " Would you like to install the inotify-tools? (Y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]
		then
        echo -e "Please wait...."
		apt-get -qq install inotify-tools -y
        sleep 3
        echo -e "inotify-tools installed!"
	elif [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		return 1
	fi
}

installTools

#DIR="$PWD/user1"
DIR="/var/www/html"
OWNER="www-data:www-data"
LOGFILE="change.log"

inotifywait -m -r --format "%e %f" "$DIR" | awk '$1 ~ "CREATE" { print $2; fflush() }' | 
while read file
do
    FILE="${DIR}"/"${file}"
    echo "Changin permission for ${FILE}" >> "${DIR}"/"${LOGFILE}"
    chown $OWNER "${FILE}"
    chmod o+r "${FILE}"
done
