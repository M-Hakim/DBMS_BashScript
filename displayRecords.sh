#!/bin/bash
function generateHeaderSeparator () {
	local inputFile=$1
	local headerSeparator=""
	headerSeparator=$(
	sed 's/\,/\,\|\,/g' $inputFile | awk -F, '{ for (i=1;i<=NF;i++) {
	    l=length($i) ;
	    if ( l > linesize[i] ) linesize[i]=l ;
	  }
	}
	END {
	    for (l in linesize){
	    	if(l%2!=0){
	    		for(j=1;j<=linesize[l];j++) printf "-"
	    	}
	    	else{
	    		printf ",+,";
	    	}
	    }
	    print ""
	}')
	echo $headerSeparator
}


_tableName=$1
_inputPK=$2
# set -x
if [[ ! -z "$_inputPK" ]]; then
	# set -x
	head -n 1 $_tableName > resultTableFile
	awk -v var=$_inputPK -F, '{if($1 == var) print $0}' $_tableName >> resultTableFile
	headerSeparator=$(generateHeaderSeparator resultTableFile)

	# clear
	echo ""
	sed 's/\,/\,\|\,/g' resultTableFile |awk -v var=$headerSeparator 'NR==1{print; print var} NR!=1' | column -s, -t 2>/dev/null
	echo ""

else
	headerSeparator=$(generateHeaderSeparator $_tableName)
	
	# clear
	echo ""
	sed 's/\,/\,\|\,/g' $_tableName |awk -v var=$headerSeparator 'NR==1{print; print var} NR!=1' | column -s, -t 2>/dev/null
	echo ""

fi
