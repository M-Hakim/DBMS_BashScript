#! /bin/bash
clear


# echo "$database"

echo -e "Table Name : \c"
read tablename



if ! [ -f ./Databases/"$database"/"$tablename" ]
then 
	echo "there is no table with this name !"
	source ./DatabaseMenu.sh
fi


columnNumber=`awk 'END{print NR}' ./Databases/"$database"/".$tablename"`

echo $columnNumber

dataseparator=","
rowseparator="\n"
row=""


for(( i=2; i<=$columnNumber; i++ ))
do
	
	colName=`awk -F "|" 'NR=='$i'{print $1}' ./Databases/"$database"/".$tablename"`
	colType=`awk -F "|" 'NR=='$i'{print $2}' ./Databases/"$database"/".$tablename"`
	colKey=`awk -F "|"  'NR=='$i'{print $3}' ./Databases/"$database"/".$tablename"`	
	
	#echo $colName
	#echo $colType
	#echo $colKey
	#echo
	
	echo -e "$colName($colType,$colKey): \c"
	read data

	#echo $columnNumber
	#echo $i

	if [ $i == $columnNumber ]
	then
		row=$row$data$rowseparator
		#echo $row
	else
		row=$row$data$dataseparator
		#echo $row
	fi

done


echo -e $row >> ./Databases/"$database"/"$tablename"

if [ $? == 0 ]
then
	echo "Your Data is added successfully"
else
	echo "Error Took Place, please try again"
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
