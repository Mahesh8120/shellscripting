#!/bin/bash

userid=$(id -u)
r='\e[31m'
g='\e[32m'
y='\e[33m'
n='\e[0m'
log_folder="var/log/shell-script"
script_name=$( echo $0 | cut -d "." -f1 )
log_file="$log_folder/$script_name.log"

if [ $userid -ne 0 ]; then
  echo -e $r"error: run with root access"$n
  exit 1
else 
    echo -e $g"running as root"$n
fi
echo "script started executing at: $(date)"

 mkdir -p $log_folder
 validate() {
   if [ $1 -ne 0 ]; then
     echo -e $r"$2 install failed"$n
     exit 1
   else 
     echo -e $g"$2 installed"$n
   fi 
 }
dnf list installed nginx 
if [ $? -ne 0 ]; then 
   dnf install nginx -y &>> $log_file
   validate $? nginx
else 
   echo -e $y"nginx already installed"$n
fi

dnf list installed mysql
if [ $? -ne 0 ]; then 
  dnf install mysql -y &>> $log_file
  validate $? mysql
else 
   echo -e $y"nginx already installed"$n
fi