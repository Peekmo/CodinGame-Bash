
#!/bin/bash
# Read inputs from Standard Input.
# Write outputs to Standard Output.

read n
read q
declare -A mimes

for((i=0 ; i<n ; i++)); do
    read mime
    mi=(${mime// / })
    mimes[${mi[0],,}]=${mi[1]}
done

for ((i=0; i<q; i++)); do
    read file
    if [[ ${file: -1} != "."  ]]; then
        parts=(${file//./ })
        if [ ${mimes[${parts[$((${#parts[*]}))-1],,}]} ] && [[ ${#parts[*]} -gt 1 || ${file:0:1} == "." ]]; then
            echo ${mimes[${parts[$((${#parts[*]}))-1],,}]}
        else echo UNKNOWN; fi
    else echo UNKNOWN; fi
done