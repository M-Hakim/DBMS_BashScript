#!usr/bin/bash
clear
if ! [ -d ~/Databases ]
then
	mkdir ~/Databases
fi

while true
do
	echo -n "Enter Database Name: "
	read database
	if [ -d ~/Databases/"$database" ]
	then
		echo "Name Already Exist,Choose another name \n"
	else
		break
	fi
done
dir=~/Databases/"$database"
echo "Enter number of tables: \n"
read num

i=1
while [ $i -le $num ]
do
	. ./createTable.sh
	clear
	let i=i+1
done


