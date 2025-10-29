#!/bin/bash

#clear;
echo "Would you like to run the main installation file again? (Y/n)"
#sleep 5;
#echo "Answer is Y";
#ANSWER="Y"
read ANSWER
echo "Run the check";
echo $ANSWER
#clear;
if [[ $ANSWER == "y" || $ANSWER == "Y" ]]; then 
	echo "RUN INSTALLATION"
else 
	echo "Not Working"
fi