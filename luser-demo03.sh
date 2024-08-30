#!/bin/bash


#Ask for a username
read -p "Enter the name for the username: " USERNAME
#Ask for the real name
read -p "Enter the name: " COMMENT
#Ask for the password
read -p "Enter the password: " PASSWORD
#cREATE THE user
useradd -c "${COMMENT}" -m ${USERNAME}

#sET THE PASSWORD for the user
echo "${PASSWORD}" | passwd --stdin ${USERNAME}

#force password change
passwd -e "${USERNAME}"
