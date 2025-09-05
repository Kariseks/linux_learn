#!/usr/bin/env bash


if [[ -z nonExisting ]] ; then
	echo "non existing variable length is 0"
else
	echo "non existing variable length "



read -p  'Enter your name: ' name

if [[ ${name} == 'Karol' ]] ; then
	echo 'Hello again my dear Karol'
elif [[ ${name} == 'Iza' ]] ; then
	echo 'Hello Iza, it is always a pleasure to see you'
else
	echo "Nice to meet you ${name}"
fi
