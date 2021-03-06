#! /bin/bash
clear

LANG=C

echo -e "Table Name : \c"
read tableName
export tableName

if [ -f $tableName ]
then
	echo "Table already exist, please makesure from table name"
	source ./DatabaseMenu.sh
fi

echo -e "Number of columns: \c"
read NumberOfColumns

#initialized variables
counter=1
separator="|"
dataseparator=","
rowSeparator="\n"
primaryKey=""; field="Field";type="Type";key="Key"
metaData=$field$separator$type$separator$key
tmp=""
#echo "number of columns : $NumberOfColumns"

while [ $counter -le $NumberOfColumns ]
do
	echo -e "Cloumn Name: \c"
	read columnName
	
	echo -e "Type of $columnName (integer/string): \n"
	
	integer="Integer";string="String"
	option=("$integer" "$string")
	PS3="for $columnName,choose DataType:"

	select columnType in "${option[@]}"
	do
		case $columnType in 
			$integer)
				#echo "integer"
				columnType="integer"
				break			
				;;
			$string)
				#echo "string"
				columnType="string"
				break
				;;
			*)
				echo "Wrong Choice"
				;;
		esac
	done

	#echo -e "primary key for $counter is $primaryKey \n"
	#primary key check !
	if [ $primaryKey=="" ]
	then
		echo -e "Make a primary key?"
		PS3="Your Choice?(yes/no):"
		select choice in "yes" "No"
		do
			case $choice in
				"yes")
					primaryKey="PK"
					metaData=$metaData$rowSeparator$columnName$separator$columnType$separator$primaryKey$separator
					#echo -e "yes statement gives: $metaData"
					break
					;;
				"No")
					metaData=$metaData$rowSeparator$columnName$separator$columnType$separator
					#echo -e "No statement give: $metaData"
					break
					;;
				*)
					echo  -e "Something Wrong happened"
					break
					;;
			esac
		done
	else
		metaData=$metaData$rowSeparator$columnName$separator$columnType$separator
		#echo -e "else statement give: $metaData"
	fi
	
	
	if [ $counter == $NumberOfColumns ] 
	then
		tmp=$tmp$columnName
		echo "$tmp"
	else
		tmp=$tmp$columnName$dataseparator
		echo "$tmp"
	fi

	((counter=counter+1))
	#echo -e "$counter \n"
done

touch ./Databases/"$database"/".$tableName"
echo -e $metaData >> ./Databases/"$database"/".$tableName"

touch ./Databases/"$database"/"$tableName"
echo -e $tmp >> ./Databases/"$database"/"$tableName"

if [ $? == 0 ]
then
	echo "Table Created successfully"
else
	echo "Error in creating $tableName"
fi




echo 
source ./DatabaseMenu.sh
# echo -n "To return DataBase menu click (y/n):"
# read request
# if [ $request = "y" ]
# then
# 	source ./DatabaseMenu.sh
# else

# 	source ./main.sh

# fi
