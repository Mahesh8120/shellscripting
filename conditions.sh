#!/bin/bash

number=$1

if [ $number -lt 15 ]; then
  echo "number is less than  15"
elif [ $number -eq 15 ]; then
  echo "number is equal to 15"
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

if [ ($number % 2) ]; then
  echo "number is even"
else
  echo "number is odd"
fi
