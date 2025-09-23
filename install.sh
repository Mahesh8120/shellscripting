#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
  echo "error: run the script with root"
    exit 1
else
    echo "you are root user"
fi 

validate () {
if [ $1 -ne 0 ]; then
  echo "installing $2 failed"
  exit 1
else
    echo "installing $2 success"
fi
}

dnf install nginx -y 
validate $? nginx

dnf install mysql -y 
validate $? nginx