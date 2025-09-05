#!/usr/bin/env bash


read -p 'Enter your age in years: ' age

if [[ age -gt 27 ]] ; then
	echo  'You'\''re older than me, you oldee.'
else
	echo 'Wanna learn something from old Goose like me ?'
fi

