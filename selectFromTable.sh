#!/bin/bash
echo -n "Table name is: "
read tableName
# set -x
if [[ -f "$tableName" ]]; then
	line=$(head -n 1 $tableName)
	PK=$(echo $line | cut -d, -f1)
	selectAll="SELECT * FROM $tableName"
	selectByPk="SELECT * FROM $tableName WHERE $PK = ?"
	exit="EXIT"
	options=("$selectAll" "$selectByPk" "$exit")
	COLUMNS=12
	select choice in "${options[@]}"
	do
	case "$choice" in 
		$selectAll)
			source ./displayRecords.sh $tableName
			;;
					
		$selectByPk)
			echo -n "SELECT * FROM $tableName WHERE $PK = "
			read inputPK
			source ./displayRecords.sh $tableName $inputPK
			;;
		$exit)
			exit
			;;
		*)
			echo "Wrong Choice"
	esac
	done
fi



# sed 's/\,/\,\|\,/g' table2
# echo $line



# header=$(awk -F, '{ for (i=1;i<=NF;i++) {
#     l=length($i) ;
#     if ( l > linesize[i] ) linesize[i]=l ;
#   }
# }
# END {
#     for (l in linesize){
#     	if(l%2!=0){
#     		for(j=1;j<=linesize[l];j++) printf "-"
#     	}
#     	else{
#     		printf ",+,";
#     	}
#     }
#     print ""
# }' table1)
# awk -v var=$header 'NR==1{print; print var} NR!=1' table1 | column -s, -t 2>>/dev/null

