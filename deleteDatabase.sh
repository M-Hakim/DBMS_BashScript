#!usr/bin/bash
clear
db=`ls ./Databases | wc -l`

if ((db == 0))
then
	echo "No DataBase To Delete"
	exit
else
	ls ./Databases
	echo "Choose Database To Delete: "
	read delete
	if [ -d ./Databases ]
	then
		rm -r ./Databases/"$delete"
		clear
		echo "($delete) Deleted"
		return
	else
		echo "No DataBase with this name"
		exit
	fi

fi
