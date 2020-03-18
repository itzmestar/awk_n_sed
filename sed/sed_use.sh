#!/bin/bash

# check if file exists
if [ ! -f $1 ]
then
	echo "File doesn't exist! Exiting..."
	exit 1
fi

# take care of operators
./operators.sed < $1 > ${1}__op

# take care of conditional ()
./conditions.sed < ${1}__op > ${1}__co

# take care of spaces & comments
./spaces.sed < ${1}__co

#delete all the temp files generated
rm -f ${1}__op ${1}__co
