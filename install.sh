#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
  echo "error: run the script with root"
  exit 1
else
    echo "you are root user"
fi 

dnf install nginx -y 