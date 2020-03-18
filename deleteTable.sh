#!usr/bin/bash
clear
. ./list_tables.sh
echo "Choose table to delete: "
read table

if [ -f $dir/$table ]
then
	rm $dir/$table
else
	clear
	echo "No such Table \n"
fi

