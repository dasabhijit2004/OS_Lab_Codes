leapYear(){
  yr=$1
  if [[ $((yr % 4)) -eq 0 ]]; then
    if [[ $((yr % 100)) -eq 0 ]] && [[ $((yr % 400)) -ne 0 ]]; then
      echo 0
    else
      echo 1
    fi
  else 
    echo 0
  fi
}

read -p "Enter date : " date1

IFS="/"
set $date1

dd=$1
mm=$2
yyyy=$3

# to remove the leading 0 of the month
mm=$(echo $mm | sed 's/^0*//')

if [[ $mm -le 12 ]]
then
    if [[ $(leapYear $yyyy) -eq 1 && $mm -eq 2 ]]
    then
        if [[ $dd -le 29 ]]
        then
            echo "Valid"
        else
            echo "Invalid"
        fi
    elif [[ $(leapYear $yyyy) -eq 0 && $mm -eq 2 ]]
    then
        if [[ $dd -le 28 ]]
        then
            echo "Valid"
        else
            echo "Invalid"
        fi
    else
        if [[ $mm -eq 1 || $mm -eq 3 || $mm -eq 5 || $mm -eq 7 || $mm -eq 8 || $mm -eq 10 || $mm -eq 12 ]]
        then
            if [[ $dd -le 31 ]]
            then
                echo "Valid"
            else
                echo "Invalid"
            fi
        else
            if [[ $dd -le 30 ]]
            then
                echo "Valid"
            else
                echo "Invalid"
            fi
        fi
    fi
    else
        echo "Invalid"
fi
