#!/usr/bin/env bash

#simple tests with [[ ]] for file existing


if [[ -d '../' ]]; then
	echo "${PWD} has a parent" 
else
	echo  "${PWD} doesn't have a parent"
fi

echo '-----------------------'

if [[ -f 'test_file.txt' ]]  ; then
	echo "The test_file.txt exist, its contents is: "
	cat 'test_file.txt'
else
	echo "A file test_file.txt dosen't exists, and will be created."
fi
	
echo $(date) >> 'test_file.txt'

echo '-----------------------'


