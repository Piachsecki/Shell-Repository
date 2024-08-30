#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
  echo "You have to enter this program with root priviliges !!" >&2
  exit 1
fi


USERNAME=${1}
#comment that will delete the argument from the list



if [[ "${#}" -lt 1 ]]
then
  echo "Usage ${0} USERNAME [COMMENT]" >&2
  exit 1
fi

shift
COMMENT=${@}


useradd -c "${COMMENT}" -m "${USERNAME}"

if [[ "${?}" -ne 0 ]]
then
  echo "User not added successfully" >&2
  exit 1
fi

PASSWORD=$(date +%s%N | sha256sum | head -c48)

echo "${PASSWORD}" > passwd --stdin ${USERNAME}

if [[ "${?}" -ne 0 ]]
then
  echo "User password not set successfully" >&2
  exit 1
fi

passwd -e ${USERNAME} &> /dev/null

echo "Your username is: ${USERNAME}"

echo "Your name is: ${COMMENT}"

echo "Your password is: ${PASSWORD}"

echo "Your HOST is: ${HOSTNAME}"
