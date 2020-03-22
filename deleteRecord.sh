#! /bin/bash
clear
echo -n "Enter Table Name: "
read tableName
if [[ -f ./Databases/"$database"/"$tableName" ]]; then
    while $flag
    do
        echo "Enter Primary Key Value To Delete: "
        if ! read -r pKey
        then
             . ./DatabaseMenu.sh
        fi
        if [[ "$pKey" = "" || "$pKey" = "." || "$pKey" = ".."  ]];then
            continue
        fi
        if [[ ! $pKey =~ ^[1-9][0-9]*$ ]]; then
        	continue
        fi
        if awk -F"," '{ print $1 }' ./Databases/"$database"/"$tableName" | grep -q $pKey
    	then
        	sed --in-place "/$pKey/d" ./Databases/"$database"/"$tableName"
        	clear
            flag=false
        	echo "Row Deleted"
        	# read
         #    ./main.sh
            break
        	else
        	echo "Primary Key Not Found"
            # read
            break
        fi
    done
else
    echo "No such table exists!"
fi

. ./DatabaseMenu.sh
