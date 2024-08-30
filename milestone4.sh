#!/bin/sh


if [[ "${UID}" -ne 0 ]]
then
  echo "You have to enter this script with root privligies! "
  exit 1
fi
USERNAME=${1}

PASSWORD=$(date +%s%N | sha256sum | head -c48)


shift
COMMENT="${@}"


useradd -c ${COMMENT} -m "${USERNAME}"

echo "${PASSWORD}" | passwd --stdin ${USERNAME}


passwd -e ${USERNAME}

echo "username:"
echo "${1}"


echo "password you use:"
echo "${PASSWORD}"


echo "host:"
echo "${HOSTNAME}"
