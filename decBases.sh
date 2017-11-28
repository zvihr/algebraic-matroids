#!/bin/bash

# run this with the list of projection vectors as standard input

#exec > >(tee mylog) 
echo "Decorated Bases" > decBases
echo >> decBases

while read line; do
	# append the current vector to the output file
	echo $line >> decBases
	# overwrite the projection file with the current vector
	echo $line > projection
	# run the program and append its output to the file
    ./bertini input < dimension | grep "Fiber" | tail -n 1 | sed "s/       Fiber:/Degree:/g" >> decBases
    # find the degree of the base in the bertini syntax
    echo >> decBases
done
