#!/bin/bash
clear

echo -e "##########Connecting to $database##########"
#cd ./Databases/"$database"

PS3="$database=# "

createTable="CREATE TABLE"; listTables="LIST TABLES"; dropTable="DROP TABLE"; insertInTable="INSERT INTO TABLE"
selectFromTable="SELECT FROM TABLE"; deleteFromTable="DELETE FROM TABLE"; back="Back to main menu"

options=("$createTable"  "$listTables" "$dropTable" "$insertInTable" "$selectFromTable" "$deleteFromTable" "$back")

COLUMNS=12
select choice in "${options[@]}"
do
        case $choice in
                $createTable)
                        source ./createTable.sh
                        clear
                        ;;
                $listTables)
                        source ./listTables.sh
                        ;;
                $dropTable)
                        source ./deleteTable.sh
                        ;;
                $insertInTable)
			source ./insertInTable.sh
                        ;;
                $selectFromTable)
                        source ./selectFromTable.sh
                        ;;
                $deleteFromTable)
                        source ./deleteRecord.sh
                        ;;
                $back)
                        return
                        ;;
                *)
                        echo "wrong choice"
                        ;;
        esac
done
