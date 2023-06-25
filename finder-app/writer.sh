#!/bin/bash

if [[ $# -eq 0 || "$1" = "" || "$2" = "" ]]
then
    echo "You must give the script 2 arguments: filename, and string to be written into the file"
    exit 1
fi

dirnm=$(dirname $1)
if [[ $dirnm != "" ]] #if directory is to be created
then
    dirnm=$(dirname $1)
    mkdir -p $dirnm && cd $dirnm
fi

echo $2 > $(basename $1)
