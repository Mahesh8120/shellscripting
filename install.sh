#!/bin/bash

r="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


userid=$(id -u)

if [ $userid -ne 0 ]; then
  echo -e "$R error: run the script with root $N "
    exit 1
else
    echo -e " $G you are root user $N"
fi 

validate () {
if [ $1 -ne 0 ]; then
  echo -e " $R installing $2 failed $N"
  exit 1
else
    echo -e " $G installing $2 success $N"
fi
}

dnf install nginx -y 
validate $? nginx

dnf install mysql -y 
validate $? nginx