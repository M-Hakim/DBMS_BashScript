#!/bin/bash
clear

db=`ls ./Databases | wc -l`

if ((db == 0))
then
	echo "No DataBase exist"
	source ./mainMenu
else
	clear
	echo -e "########DBMS########"
	ls ./Databases
fi

echo 
echo -n "To return main menu click (y/n):"
read request
if [ $request = "y" ]
then
	source ./mainMenu

fi
