#!/bin/bash

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

userid=$(id -u)

if [ $userid -ne 0 ]; then
  echo "$r error: run the script with root $n "
    exit 1
else
    echo " $g you are root user $n"
fi 

validate () {
if [ $1 -ne 0 ]; then
  echo " $r installing $2 failed $n"
  exit 1
else
    echo " $g installing $2 success $n"
fi
}

dnf install nginx -y 
validate $? nginx

dnf install mysql -y 
validate $? nginx