#!/bin/bash

read width
read height
read line
line=${line//[^a-zA-Z]/@}

IFS=''
declare -a letters

for ((i=0; i<$height; i++)); do
    read -r letters[i]
done

for ((h=0; h<$(($height)); h++)); do
    show=""
    for ((i=0; i<${#line}; i++)); do
        show+=${letters[h]:($( printf "%d" \'$(echo ${line:$((i)):1} | tr '[:lower:]' '[:upper:]')) - 65) * $(($width)):$(($width))}
    done
    echo $show
done