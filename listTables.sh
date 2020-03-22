#! /bin/bash
# echo -e "\e[32m\e[4mTables:\e[0m"
echo ""
echo Tables:
echo -------
# table_list=$(ls -1)
# echo $table_list
# ls | cat -n
ls ./Databases/"$database"| awk '{print NR,"-", $0}'
# ls -1 ./Databases/"$database"
echo ""