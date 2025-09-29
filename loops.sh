#!/bin/bash
userid=$(id -u)
r='\e[31m'
g='\e[32m'
y='\e[33m'
n='\e[0m'
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER

if [ $userid -ne 0 ]; then
  echo -e $r"error: run with root access"$n
  exit 1
else 
    echo -e $g"running as root"$n
fi
echo "script started executing at: $(date)" | tee -a $LOG_FILE

 validate() {
   if [ $1 -ne 0 ]; then
     echo -e $r"$2 install failed"$n
     exit 1
   else 
     echo -e $g"$2 installed"$n
   fi 
 }

for $package in $@
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]; then 
     dnf install $package -y &>>$LOG_FILE
     validate $? $package
  else 
     echo -e $y"$package already installed"$n | tee -a $LOG_FILE
  fi  
done