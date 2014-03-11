read r
read l

line=$r
for((i=1 ; i<$((l)) ; i++)); do
    numbers=(${line// / })
    line=""
    declare -a nums
    last=${numbers[0]}; nbre=1
    for ((x=0; x<${#numbers[*]}; x++)); do
        if [[ $((x)) -eq $((${#numbers[*]}-1)) ]]; then
            nums[${#nums[*]}]=$nbre; 
            nums[${#nums[*]}]=$last; 
        elif [[ ${numbers[$((x+1))]} -eq $last ]]; then nbre=$((nbre+1))
        else 
            nums[${#nums[*]}]=$nbre; 
            nums[${#nums[*]}]=$last; 
            last=${numbers[$((x+1))]}; 
            nbre=1
        fi
    done
    line=$(IFS=" "; echo ${nums[@]})
    unset nums
done
echo $line

