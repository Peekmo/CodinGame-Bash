#!/bin/bash

read relief

for (( i=0; i<$((relief)); i++ )); do
    read line
done

while [ true ]; do
    read line
    data=(${line// / })
    vs=${data[3]#-}
    
    if [[ $((vs)) -lt 35 ]]; then
        echo "0 0"
    else
        echo "0 4"
    fi
done
    