#!/bin/bash

# run this with the list of projection vectors as standard input

#exec > >(tee mylog) 
echo "Decorated Circuits" > decCircs
echo >> decCircs

while read line;
do
	# append the current vector to the output file
	echo $line >> decCircs
	# overwrite the projection file with the current vector
	echo $line > projection
	# run the program and append its output to the file
    ./bertini input < dimension | grep "Projection" | tail -n 1 | sed "s/  Projection:/Degree:/g" >> decCircs
    # find the degree of the circuit in the bertini syntax
    echo >> decCircs
done