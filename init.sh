#!/bin/sh
#


###### VARIABLES ########
webserver="nginx"
sudoPass="rootme"
doweFiles=".doweFiles"
phpVersion="8.0"
mysql="mysql_install.sh"
nginx="nginx_install.sh"
myConfig = "rootConfig.cnf"

###### END VARIABLES ######

sudo clear;
sudo mv ~/.my.cnf ~/.my.cnf.BAK;
sudo cp "$doweFiles/$myConfig" ".my.cnf";
echo "Welcome to the Dowe Server Files Installation....";
echo "Please enter the name of the file you would like to install";
echo -n "Options are: [1] NGINX, [2] PHP${phpVersion}, [3] MySql, [4] SQLite3, [5] Gittea | ";

read OPTION;



	
		
	case $OPTION in
		1)
			echo -n $webserver;;
		2)
			echo -n "PHP \n";;
		3)
			exec $doweFiles/$mysql;;
		4)
			echo -n "SQLite3";;
		5)
			echo -n "Gittea";;
		
		*)
			echo -n "Option not available...";;
	esac
			

	
	