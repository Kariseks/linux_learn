#!/usr/bin/env bash

echo "OPTIND = ${OPTIND}"

while getopts ":a:b:c:f" arg ; do
    case "${arg}" in
        a) echo "a: ${OPTARG}";;
        b) echo "b: ${OPTARG}";;
        c) echo "c: ${OPTARG}";;
        f) echo "f: ${OPTARG}";;
        /?) echo "Unknown: ${OPTARG}";;
        :) echo "No value : ${OPTARG}";;
    esac
done


for i in seq 1 ${#}; do
    echo "${i}:= ${!i}"
done

echo "OPTIND = ${OPTIND}"


#url with the Romeo & Juliet book
url='https://downloads.codingcoursestv.eu/055%20-%20bash/if/romeo.txt'
file_name='romeo.txt'
if [[ ! -f "{file_name}" ]] ; then
    if ! wget -qc -o "${file_name}" "${url}" ; then
        declare -i status=$?
        echo "Couldn't download the file Rome and Juliet" >&2
        exit "${status}"
    fi
fi

line_num=1
count_lines=0
total_love=0
regex='\blove\b'
while IFS= read -r line; do
    if [[ "${line,,}" =~ $regex ]] ; then
        ((count_lines+=1))

        cnt_love=$(grep -oiw -- 'love'  <<< "${line}" | wc -l)
        total_love=$(( total_love+cnt_love))

        echo "Found a love word, ${cnt_love} times in line ${line_num}"
    fi
    ((line_num+=1))
done < "${file_name}"

echo "Found a total of ${count_lines} lines with a least one love word."
echo "Found a total of ${total_love} love words."

rm romeo.txt



