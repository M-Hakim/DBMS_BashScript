#!/usr/bin/bash
clear
echo -e "=====Database Engine MainMenu=====\n"
PS3="DBMS# Choose an option: "
createDB="CreateDatabase";listDB="ListDatabases";connetToDB="ConnectToDatabase";dropDB="DropDatabase";exit="Exit"
options=("$createDB" "$listDB" "$connetToDB" "$dropDB" "$exit")
COLUMNS=12
select choice in "${options[@]}"
do
case "$choice" in 
	$createDB)
		source ./createDatabase.sh
		;;
				
	$listDB)
		source ./listDatabases
		;;
	$connetToDB)
		source ./selectedDatabase
		;;
	$dropDB)
		source ./deleteDatabase.sh
		;;
	$exit)
		exit
		;;
	*)
		echo -e "Wrong Choice\n"
esac
done
