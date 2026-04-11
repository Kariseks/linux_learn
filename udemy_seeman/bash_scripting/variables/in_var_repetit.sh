#!/usr/bin/env bash

#This is a repetition script written to demonstrate getopts

verbose=false   #
p=~ #path
n="no name" #user name
while getopts ":vp:n:" arg; do
    case "${arg}" in
        v)
            verbose=true;;
        p)
            p=$OPTARG;;
        n)
            n=$OPTARG;;
        \?)
           echo "Option ${OPTARG} doesn't exist" >&2
           echo "OPTARG:= ${OPTARG}; arg:= ${arg}"
           exit 1;;
        :)
           echo "The option -${OPTARG} should have a specified value" >&2
           exit 1;;
    esac

done

shift $((${OPTIND} - 1))


echo  "${p}" "${verbose}" "${n}"

dir="$(cd  "$(dirname "${0}")" && pwd)" 
echo "${dir}"
pwd