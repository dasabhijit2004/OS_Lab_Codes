echo "Enter your dob: "
read dob

IFS="/"
set $dob

dd=$1
mm=$2
yyyy=$3

d1=$(date +%d)
m1=$(date +%m)
y1=$(date +%Y)

day=`expr $d1 - $dd`
month=`expr $m1 - $mm`
year=`expr $y1 - $yyyy`

if [[ $day -lt 0 ]]
then
    day=$((day + 30))
    month=$((month - 1))
fi

if [[ $month -lt 0 ]]
then
    month=$((month + 12))
    year=$((year - 1))
fi

echo "Age: $year year(s) $month month(s) $day day(s)"
