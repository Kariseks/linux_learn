#!/usr/bin/env bash


fileName=romeoErr.txt

if [[ ! -f ${fileName} ]] ; then
	echo 'Downloading the book Romeo and Juliet ...'
	curl 'https://www.gutenberg.org/cache/epub/1513/pg1513.txt' 2>/dev/null > ${fileName} 

	if [[ ! $? -eq 0 ]] ; then
		rm ${fileName}
		echo "Download has failed" >&2
		exit 1
	fi
	
	echo "Download completed successfully, the book save as file: ${fileName}" 
else
	echo "The file ${fileName} already exists, skipping the download"
fi


count=$(grep -i 'love' ${fileName} | wc -l)

echo "The Romeo and Juliet book contains ${count} lines with the word love" 


if [[ $fileName == 'romeoErr.txt' ]] ; then
	rm 'romeoErr.txt'
fi
