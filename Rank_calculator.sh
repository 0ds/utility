#AUTHOR ---> VISHAL_RAJ
COMPUTE_RANK(){
__FILENAME=$1
__DIVISION=$2

if [[ -z $__DIVISION ]]; then
     echo -e "Wrong input \n Try again     Syntax ------> COMPUTE_RANK <file_path> <argument>"
     exit 1;
fi

__TOTAL_LINE_COUNT=`awk 'END{print NR}' $__FILENAME`

for ((c=2;c<=$__TOTAL_LINE_COUNT;c++))
do
    __SINGLE_STUDENT_MARKS=(`awk -v x=$c 'NR == x {for (i=2;i<=NF;i++) print $i}' $__FILENAME`)
    __STUDENT_NAME=`awk -v x=$c 'NR == x { print $1}' $__FILENAME`
    __CALCULATE_AVERAGE "${__SINGLE_STUDENT_MARKS[@]}"

        if [ $__AVG -ge "80" ] && [ $__DIVISION = "DISTINCTION" ] ; then
            echo -e "$__STUDENT_NAME \t----->\t DISTINCTION"
        elif [ $__AVG -ge "60" ] && [ $__AVG -lt "80" ] && [ $__DIVISION = "FIRST" ]; then
            echo -e "$__STUDENT_NAME \t----->\t FIRST_DIVISION"
        elif [ $__AVG -ge "40" ] && [ $__AVG -lt "60" ] && [ $__DIVISION = "SECOND" ]; then
            echo -e "$__STUDENT_NAME \t----->\t SECOND_DIVISION"
        elif [ $__AVG -ge "30" ] && [ $__AVG -lt "40" ] && [ $__DIVISION = "THIRD" ]; then
            echo -e "$__STUDENT_NAME \t----->\t THIRD_DIVISION"
        elif [ $__AVG -lt "30" ] && [ $__DIVISION = "FAIL" ]; then
            echo -e "$__STUDENT_NAME \t----->\t FAIL"
        fi

done
}

__CALCULATE_AVERAGE(){
__VALUES=("$@")
__TOTAL_NUMBER=${#__VALUES[@]}

local sum=0
for i in "${__VALUES[@]}"
do
    sum=`expr $sum + $i`
done

__AVG=`echo "space=3; $sum / $__TOTAL_NUMBER" | bc`
}
