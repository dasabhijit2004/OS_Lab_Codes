echo "Enter the number of elements in the array: "
read n

for(( i=0; i<n; i++ ))
do
    echo "Enter array element $i: "
    read arr[i]
done

echo "Printing array: "
echo ${arr[@]}

for(( i=0; i<n-1; i++ ))
do
    for(( j=0; j<n-i-1; j++ ))
    do
        if [[ ${arr[j]} -gt ${arr[$((j + 1))]} ]]
        then
            temp=${arr[j]}
            arr[j]=${arr[$((j + 1))]}
            arr[$((j + 1))]=$temp
        fi
    done
done

echo "Sorted array: "
echo ${arr[@]}
