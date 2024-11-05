#!/bin/bash

USERID=$(id -u)
#echo "User ID is $USERID"
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privieges.."
        exit1
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...SUCCESS"
    fi
}

CHECK_ROOT

dnf list installed git


if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it..."
    dnf install git -y
    VALIDATE $? "installing Git"
else
    echo "Git is already installed, nothing to do..."

fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it..."
    dnf install mysql -y
    VALIDATE $? "installing Mysql"
else
    echo "mysql is already installed, nothing to do..."

fi