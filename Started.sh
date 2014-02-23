#!/bin/bash
# Read inputs from Standard Input.
# Write outputs to Standard Output.

read stringIntegers
IFS=' ' && integers=($stringIntegers)

read line

read stringWords
IFS=' ' && words=($stringWords)

if [ ${#line} -eq $((integers[0] + integers[1])) ]; then
    echo ${words[0]}
else
    echo ${words[1]}
fi