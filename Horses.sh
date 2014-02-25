# is not working on big set of data
read n
declare -a horses

for((i=0 ; i<n ; i++)); do
    read horses[i]
done
sorted=$(for i in ${horses[@]}; do echo $i; done | sort -n)

lower=10000000; last=-1
for i in ${sorted[@]}; do
    if [[ $last -ne -1 && $(($i-$last)) -lt $lower ]]; then 
        lower=$(($i-$last)); fi
    last=$i
done
echo $lower