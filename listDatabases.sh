#! /bin/bash
# clear

db=`ls ./Databases | wc -l`

if ((db == 0))
then
	echo "No DataBase exist"
	# source ./main.sh
else
	# clear
	echo ""
	echo "Databases:"
	echo ----------
	# echo -e "########DBMS########"
	ls ./Databases | awk '{print NR,"-", $0}'
	# ls -1 ./Databases
fi

# echo 
# echo -n "To return main menu click (y/n):"
# read request
# if [ $request = "y" ]
# then
# 	source ./main.sh

# fi
