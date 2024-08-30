#!/bin/bash

ROOT_PRIVILIGE=0

if [[ "${UID}" -ne ${ROOT_PRIVILIGE} ]]
then
  echo 'Enter the script with root privilige!'
  exit 1
fi

read -p "Enter the username to create: " USERNAME
read -p "Enter the name of the user that will be using this account: " NAME
read -p "Enter the password to use for the account: " PASSWORD

useradd -m ${USERNAME}

echo "${USERNAME}" | passwd --stdin "${USERNAME}"

passwd -e "${USERNAME}"
