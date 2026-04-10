#!/usr/bin/env bash

set -oue >> /dev/null

#script for "love" statistic in Rome & Juliet
fileName="romeo.txt"
url='https://downloads.codingcoursestv.eu/055%20-%20bash/if/romeo.txt'

if [[ ! -f "${fileName}"  ]] ; then
   if ! wget -cq "${url}" ; then
       echo "Couldn't download the file" >&2
       exit 1
   fi
fi

grep -Eiw 'love' "${fileName}" | wc -l 

rm "${fileName}"

exit 0