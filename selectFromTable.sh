#! /bin/bash
# cd ./Databases/"$database"
echo -n "Table name is: "
read tableNameBase
tableName=./Databases/"$database"/"$tableNameBase"
# set -x
if [[ -f "$tableName" ]]; then
	line=$(head -n 1 $tableName)
	PK=$(echo $line | cut -d, -f1)
	selectAll="SELECT * FROM $tableNameBase"
	selectByPk="SELECT * FROM $tableNameBase WHERE $PK = ?"
	exit="Back to database menu"
	options=("$selectAll" "$selectByPk" "$exit")
	PS3="SELECT=# "
	COLUMNS=12
	select choice in "${options[@]}"
	do
	case "$choice" in 
		$selectAll)
			source ./displayRecords.sh $tableName
			;;
					
		$selectByPk)
			echo -n "SELECT * FROM $tableNameBase WHERE $PK = "
			read inputPK
			source ./displayRecords.sh $tableName $inputPK
			;;
		$exit)
			# clear
			source ./DatabaseMenu.sh
			;;
		*)
			echo "Wrong Choice"
	esac
	done
else
	echo "This table doesn't exist!"
fi
