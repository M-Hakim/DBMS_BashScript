#! /bin/bash
clear
echo -e "=====Database Engine MainMenu=====\n"
PS3="DBMS=# "
createDB="CREATE DATABASE"; listDB="LIST DATABASES"; connetToDB="CONNECT TO DATABASE"; dropDB="DROP DATABASE"; exit="EXIT"
options=("$createDB" "$listDB" "$connetToDB" "$dropDB" "$exit")
COLUMNS=12
select choice in "${options[@]}"
do
case "$choice" in 
	$createDB)
		source ./createDatabase.sh
		;;
				
	$listDB)
		source ./listDatabases.sh
		;;
	$connetToDB)
		source ./selectedDatabase.sh
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
