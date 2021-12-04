#!/bin/bash -x

ispresent=1
randomCheck=$((RANDOM%2))

if [ $ispresent -eq $randomCheck ]
then
	empRatePerHr=20;
	empHrs=8;
	salary=$(($empRatePerHr*$empHrs));
else
	salary=0;
fi
