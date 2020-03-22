#! /bin/bash
clear


echo -n "Enter Database Name: "
read database
export database

if [ -d ./Databases/"$database" ]
then
	clear
	source ./DatabaseMenu.sh
else
	echo -e "There is no Database with this name"
	# source ./main.sh
fi



