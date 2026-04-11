#!/usr/bin/env bash
#================================================
#===== Solution to Bulk image download exercise =
#================================================

set -ue -o pipefail

url='https://downloads.codingcoursestv.eu/055%20-%20bash/while/images/image-'

declare -i fail_counter=0
declare -i fail_max=10
while getopts "c:" arg; do
    case "${arg}" in
        c)
            fail_max=${OPTARG} ;;
        ?)
            echo "Invalid argument" >&2
            exit 1 ;;
        
    esac
done

declare -i counter=1
script_path="$(cd "$(dirname "$0")" && pwd )"

if ! mkdir "${script_path}/images" ; then
    rm -R "${script_path}/images"
    mkdir "${script_path}/images"
fi

while [[ ${fail_counter} -lt ${fail_max} ]] ; do
    file_path="${script_path}/images/image-${counter}.jpg"
    if  ! wget -q "${url}${counter}.jpg" -O "${file_path}" ; then
        ((fail_counter += 1))
        rm "${file_path}"
        echo "Increasing fail_counter to:= ${fail_counter}"
    else
        fail_counter=0
    fi
    (( counter += 1))

done
