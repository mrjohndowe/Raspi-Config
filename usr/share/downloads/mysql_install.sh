#!/bin/sh
# mysql -h "server-name" "database-name" < "filename.sql"
#	
#	mysql -p=password -u "root" -Bse "CREATE DATABASE \`${1}_database\`;
#   	CREATE USER '$1'@'%' IDENTIFIED BY '$2';
#		GRANT ALL PRIVILEGES ON `${1}_database`.* TO '$1'@'%' WITH GRANT OPTION;"
#
#
myConfig = "rootConfig.cnf"
MYSQL_ROOT="root"
MYSQL_PASS="rootme"
MYSQL_USER="mrjohndowe"
MYSQL_USER_PASS="53nrw695"
# Temporary Directory
TMP="/var/tmp/"
REPO="https://github.com/mrjohndowe/Raspi-Config/tree/master/.doweFiles/"

sudo clear;
echo "Getting ready to install MYSQL on Pi";
echo "";
echo "Updating Files.....";
echo "";
sudo apt update -y;
echo "Upgrading Files ....";
echo "";
sudo apt upgrade -y;
echo "";
echo "Getting the files for the database server";
echo "";
sudo apt install mariadb-server -y;
echo "Running the MySQL securing process";
echo "ATTENTION: User input may be needed....";
sleep 30
sudo mysql_secure_installation
echo "Creating a MySQL User.... because you cant just use root.....";

sudo mysql -p"${MYSQL_PASS}" -u $MYSQL_ROOT -Bse "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_USER_PASS}' WITH GRANT OPTION; \q;";
echo "Installing the PHP PHP MySQL Connector";S
sudo apt install php8.0-mysql -y;
sudo mv ~/.my.cnf ~/.my.cnf.BAK;
sudo curl -s $REPO/$myConfig > ~/.my.cnf
echo "MySQL installation complete";

#mysql -u root -p"rootme" -Bse "GRANT ALL PRIVILEGES ON *.* TO 'mrjohndowe' IDENTIFIED BY '1204563' WITH GRANT OPTION; \q;";