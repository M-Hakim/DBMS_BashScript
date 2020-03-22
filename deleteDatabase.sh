#! /bin/bash
clear
db=`ls ./Databases | wc -l`

if ((db == 0))
then
	echo "No DataBase To Delete"
	return
else
	# ls ./Databases
	echo ""
	echo "Databases:"
	echo ----------
	ls ./Databases | awk '{print NR,"-", $0}'
	
	echo "Choose Database To Delete: "
	read delete
	if [ -d ./Databases/"$delete" ]
	then
		rm -r ./Databases/"$delete"
		clear
		echo "($delete) Deleted"
		return
	else
		echo "No DataBase with this name"
		return
	fi

fi
