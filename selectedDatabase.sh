#!usr/bin/bash
clear


echo -n "Enter Database Name: "
read database
export database

if [ -d ./Databases/"$database" ]
then
	clear
	source ./DatabaseMenu
else
	echo -e "There is no Database with this name"
	source ./mainMenu
fi



