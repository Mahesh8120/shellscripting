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
echo current working Directory: $PWD
echo user: $user
echo home directory: $HOME
echo last command exit status: $?
echo process id of current script: $$
echo number of arguments passed: $#