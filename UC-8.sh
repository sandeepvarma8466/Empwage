#!/bin/bash -x

isPartTime=1
isFullTime=2
maxRateInMonth=100
empRatePerHr=20
numOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

function getWorkHrs()
{
        case $1 in
                                $isFullTime)
                                        empHrs=8
                                ;;
                                $isPartTime)
                                        empHrs=4
                                ;;
                                *)
                                        empHrs=0
        esac
}
function getEmpWage()
{
		echo $(($1*$empRatePerHr))
}

while [[ $totalEmpHr -lt $maxRateInMonth
&& $totalWorkingDays -lt $numOfWorkingDays ]]
do
        ((totalWorkingDays++))
        empCheck=$((RANDOM%3))
	getWorkHrs $empCheck
        totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs+$empRatePerHr))
done

totalSalary="$( getEmpWage $totalEmpHr )"
echo ${dailyWages[@]}
