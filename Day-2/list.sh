file="sheet.txt"

insert(){
    flag=1
    read -p "Enter roll: " roll
    lines=$(wc -l < $file)
    for((i=2; i<=lines; i++))do
        troll=$(head -n $i $file|tail -n 1| cut -d "|" -f 2)
        if [[ $troll == $roll ]]
        then
            flag=0
            break
        fi
    done
    if [[ $flag -eq 1 ]]
    then    
        read -p "Enter name: " name
        read -p "Enter marks: " marks
        echo "$name|$roll|$marks">>$file
        echo "Insert successful"
    else
        echo "Data already present"
        echo "Insert unsuccessful"
    fi
}

delete(){
    flag=1
    read -p "Enter roll to delete: " roll
    lines=$(wc -l < $file)
    for((i=2; i<=lines; i++))do
        troll=$(head -n $i $file|tail -n 1| cut -d "|" -f 2)
        if [[ $troll == $roll ]]
        then
            flag=0
            break
        fi
    done
    if [[ $flag -eq 0 ]]
    then
        grep -v "|$roll|" $file > temp.txt && mv temp.txt $file
    else
        echo "Roll no not present"
        echo "Delete unsuccessful"
    fi
}

update(){
    flag=1
    read -p "Enter roll to update: " roll
    lines=$(wc -l < $file)
    for((i=2; i<=lines; i++))do
        troll=$(head -n $i $file|tail -n 1| cut -d "|" -f 2)
        if [[ $troll == $roll ]]
        then
            flag=0
            break
        fi
    done
    if [[ $flag -eq 0 ]]
    then
        grep -v "|$roll|" $file>temp.txt 
        mv temp.txt $file 

        echo -n "Enter new name: "
        read name
        echo -n "Enter new marks: "
        read marks

        echo "$name|$roll|$marks">>$file
    else
        echo "Roll no not present"
        echo "Update unsuccessful"
    fi
}

display(){
    echo "Details: "
    cat "$file"
}

menu(){
    echo "1. Insert"
    echo "2. Delete"
    echo "3. Update"
    echo "4. Display"
    echo "5. Exit"
    echo -n "Enter your choice: "
}

if [ !-f $file ]
then
    touch $file
fi

while true
do
    menu
    read choice
    case $choice in
        1) insert ;;
        2) delete ;;
        3) update ;;
        4) display ;;
        5) exit ;;
        *) echo "Invalid choice" ;;
    esac
done