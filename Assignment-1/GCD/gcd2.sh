gcd(){
  x=$1
  y=$2
  if [[ $x =~ ^-?[0-9]+$ ]] && [[ $y =~ ^-?[0-9]+$ ]]
  then
    if [ $x -eq 0 ]
    then
      echo 0
    elif [ $x -eq 0 ]
    then
      echo 0
    else
      gcd `expr $y % $x` $x
    fi
  else
    echo "Not_Possible"
  fi
}
x=$1
y=$2
gcd $x $y