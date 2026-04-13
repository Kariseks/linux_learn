#!/usr/bin/env bash


start=1
stop=25
step=3

for i in $(seq $start $step $stop); do
    if (( i % 2 == 1)) ; then
        echo "I don't work for odd numbers, i:= ${i}"
        continue
    fi
    echo "i:= ${i}"

    if [[ i -gt 20 ]] ; then
        echo "Broke the loop when i:= ${i}"
        break
    fi
done

