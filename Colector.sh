#!/bin/bash

for (( i=1; i<=5; i++))
do

times=()
for (( k=1; k<=200; k++))
do
	times=("${times[@]}" "$(python3 PDP11.py $k),")
done


len="$(expr ${#times[@]} - 1)"


times=("${times[@]::$len}" "${times[-1]::-1}")


echo "${times[@]}" >> times.txt


