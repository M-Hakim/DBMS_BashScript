#!usr/bin/bash
clear


while $flag
do
    echo "Enter Primary Key Value To Delete: "
    if ! read -r pKey
    then
         ./main.sh
    fi
    if [[ "$pKey" = "" || "$pKey" = "." || "$pKey" = ".."  ]];then
        continue
    fi
    if [[ ! $pKey =~ ^[1-9][0-9]*$ ]]; then
    	continue
    fi
    if awk -F"," '{ print $1 }' ./Databases/$database/$tableName | grep -q $pKey
	then
    	sed --in-place "/$pKey/d" ./Databases/$database/$tableName
    	clear
        flag=false
    	echo "Row Deleted \n"
    	read
        ./main.sh
    	else
    	echo "Primary Key Not Found"
        read
    fi
done
