#!/bin/bash
rm -fr times.txt
clear
CPU=$(cat /proc/cpuinfo  | grep "name"| uniq)
CPU="${CPU:13}"
echo "$CPU" >> times.txt
for (( i=1; i<=5; i++))
do

	times=()
	for (( k=1; k<=16; k++))
	do
		times=("${times[@]}" "$(python3 PDP11.py $k),")
		echo "En la $i interación de 5 con $k núcleos tardó: ${times[-1]::-1} nanosegundos."
	done


	len="$(expr ${#times[@]} - 1)"


	times=("${times[@]::$len}" "${times[-1]::-1}")
	echo "${times[@]}" >> times.txt

done
