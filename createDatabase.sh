#!usr/bin/bash
clear
if ! [ -d ./Databases ]
then
	mkdir ./Databases
fi

while true
do
	echo -n "Enter Database Name: "
	read database
	if [ -d ./Databases/"$database" ]
	then
		echo "Name Already Exist,Choose another name"
	else
		mkdir ./Databases/"$database"
		break
	fi
done
. ./main.sh



