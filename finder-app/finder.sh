#!/bin/bash

if [[ $# -eq 0 || "$1" = "" || "$2" = "" ]]
then
    echo "You must give the script 2 arguments: a directory path, and string to be searched in that directory"
    exit 1
fi

if [[ ! -d $1 ]] 
then
    echo "$1 is not a directory. Exiting now"
    exit 1
fi

cd $1
echo "now searching for the patterns from $(pwd)"
X=$(grep -lr $2 * | wc -l)
Y=$(grep -or $2 * | wc -l)

echo "The number of files are $X and the number of matching lines are $Y"
