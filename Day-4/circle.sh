clear
echo "Enter radius: "
read r

for(( i=1; i<=360; i=i+5 ))
do
    th1=`echo "scale=4; 3.14/180 * $i" | bc | awk '{print cos($1)}'`
    th2=`echo "scale=4; 3.14/180 * $i" | bc | awk '{print sin($1)}'`
    x=`echo "scale=4; $r * $th1" | bc | awk '{print int($1)}'`
    y=`echo "scale=4; $r * $th2" | bc | awk '{print int($1)}'`
    
    x=$((x+40))
    y=$((12-y))
    tput cup $x $y
    printf "*"
    echo
done
tput cup $(tput lines) 0