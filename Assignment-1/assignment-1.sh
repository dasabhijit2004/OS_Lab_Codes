len=`wc -l<temp.txt`
for(( j=1; j<=len; j++ ))
do
  file=`head -n $j temp.txt | tail -n 1`
l=`wc -l<test_case.txt`
# echo $l
count=0
for(( i=1; i<=l; i++ ))
do
  x=`head -n $i test_case.txt | tail -n 1 | cut -d " " -f 1`
  y=`head -n $i test_case.txt | tail -n 1 | cut -d " " -f 2`
  z=`head -n $i test_case.txt | tail -n 1 | cut -d " " -f 3`

  res=`sh GCD/$file $x $y`
  if [ $res == $z ]
  then
    continue
  else
    flag=1
    count=$(( count + 1 ))
  fi
done
if [[ $flag -eq 1 ]]
then 
  echo "$file failed for $count test case(s)"
else
  echo "$file passed for all case(s)"
fi
done
