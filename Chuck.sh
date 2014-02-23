#!/bin/bash

read msg
IFS=''

last=-1
final=""
for ((i=0; i<${#msg}; i++)); do
    asc=$(printf "%d" \'${msg:$((i)):1})
    
    s=""
    for ((y=6; y>-1; y--)); do
        # multiplied by 100 to get floats...
        if [ $(($asc*100/2**$y)) -gt 100 ] || [ $(($asc*100/2**$y)) -eq 100 ]; then 
            s+='1'; asc=$(($asc-(2**$y)));
        else s+='0'
        fi
    done
    for ((y=0; y<${#s}; y++)); do
        if [ $((last)) -eq -1 ] || [ $((last)) -ne $((${s:$y:1})) ]; then
            if [ $((last)) -ne -1 ]; then final+=" "; fi
            if [ $((${s:$y:1})) -eq 1 ]; then final+="0 0"; last=1
            else final+="00 0"; last=0
            fi
        else final+="0"
        fi
    done
done

echo $final