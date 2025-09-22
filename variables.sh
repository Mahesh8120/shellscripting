#!/bin/bash

DATE=$(date)
number1=3
number2=5
sum=$((number1+number2))

 echo please enter your password:
read -s password
echo $password and $DATE ans $sum

echo all variables passed: $@
echo script name : $0