#! /bin/bash
clear
. ./listTables.sh
echo "Choose table to delete: "
read table

if [[ -f ./Databases/"$database"/"$table" ]]
then
	rm ./Databases/"$database"/"$table"
	rm ./Databases/"$database"/".$table"
else
	clear
	echo "No such Table \n"
fi

