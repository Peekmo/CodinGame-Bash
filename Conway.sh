# To finish

read r
read l

line=$r
for((i=1 ; i<l ; i++)); do
    numbers=(${line// / })
    line=""
    declare -a nums
    last=${numbers[0]}; nbre=0
    for i in ${numbers[@]}; do
        if [[ $i -eq $last ]]; then nbre+=1
        else
            nums[${#nums[*]}]=$nbre; 
            nums[${#nums[*]}]=$last; 
            last=$i; 
            nbre=1
        fi
    done 
    line=$(IFS=" "; echo ${nums[@]})
done
echo $line