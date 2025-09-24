#!/bin/bash

r="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


userid=$(id -u)

LOGS_FOLDER="var/log/shellscript"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
LOG_FILE=${LOGS_FOLDER}/${SCRIPT_NAME}.log
DATE=$(date)

mkdir -p $LOGS_FOLDER
echo -e " $Y script started at : $DATE $N"

if [ $userid -ne 0 ]; then
  echo -e "$R error: run the script with root $N "
    exit 1
else
    echo -e " $G you are root user $N"
fi 

validate () {
if [ $1 -ne 0 ]; then
  echo -e " $R installing $2 failed $N" &>> $LOG_FILE
  exit 1
else
    echo -e " $G installing $2 success $N"
fi
}

dnf list installed nginx
  if [ $? -ne 0 ]; then
    dnf install nginx -y 
    validate $? nginx
else
    echo -e " $Y nginx installed, Skipping $N"
fi

dnf list installed mysql
  if [ $? -ne 0 ]; then
   dnf install mysql -y 
   validate $? mysql 
else
    echo -e " $Y mysql installed, Skipping $N"
fi

