#!/bin/bash
# echo -e "\e[32m\e[4mTables:\e[0m"
echo Tables:
echo -------
# table_list=$(ls -1)
# echo $table_list
# ls | cat -n
ls | awk '{print NR, $0}'
# ls -1