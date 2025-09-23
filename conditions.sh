#!/bin/bash

number=$1

if [ $number -lt 15 ]; then
  echo "number is less than or equal to 15"
else
  echo "number is greater than 15"
fi

userid=$(id -u)  

if [ $userid -ne 0 ]; then 
  echo "error: run the script with root"
  exit 1
else
  echo "you are root user"
fi
