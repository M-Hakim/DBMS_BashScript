#!/usr/bin/bash
clear
echo -e "=====Database Engine MainMenu=====\n"
PS3="Choose an option: "
while true
do
		select choice in CreateDatabase ListDatabases ConnectToDatabase DropDatabase Exit
		do
		case "$choice" in 
			CreateDatabase)
				. ./createDatabase.sh
				break
				;;
				
			ListDatabases)
				break
				;;
			ConnectToDatabase)
				break
				;;
			DropDatabase)
				. ./deleteDatabase.sh
				break
				;;
			Exit)
				exit
				;;
			*)
				echo -e "Wrong Choice\n"
		esac
		done
		done
done
