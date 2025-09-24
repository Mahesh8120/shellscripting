#!/bin/bash

DATE=$(date)
USERID=$(id-u)

echo script started at :$DATE
mkdir -p /var/log/shellscript

if [ $USERID -ne 0]; then
  echo error: run this script with root access
  exit 1
else 
   echo you are root user
fi

validate()
if [ $1 -ne 0 ]; then
  echo $2 installation failed
  exit 1
else 
  echo nginx installation success
fi  

dnf list installed nginx
if [ $? -ne 0 ]; then
  dnf install nginx -y
  validate $? nginx
else
  echo nginx installed.. skipping
fi