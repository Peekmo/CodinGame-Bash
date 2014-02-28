# To finish

read r
read l

line=$r
for((i=1 ; i<$((l)) ; i++)); do
    numbers=(${line// / })
    line=""
    declare -a nums
    last=${numbers[0]}; nbre=1
    for i in ${numbers[@]}; do
        if [[ $((i)) -eq ${#numbers[*]} ]]; then
            nums[${#nums[*]}]=$nbre; 
            nums[${#nums[*]}]=$last; 
        elif [[ $i -eq $last ]]; then nbre+=1
        else 
            nums[${#nums[*]}]=$nbre; 
            nums[${#nums[*]}]=$last; 
            last=$i; 
            nbre=1
        fi
    done
    echo $line
    line=$(IFS=" "; echo ${nums[@]})
done
echo $line
