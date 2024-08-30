#!/bin/bash
echo "1.Hello uid - ${UID}"



#Only display if the UID does not match 1000
UID_TO_TEST_FOR='1000'

if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
  echo "2.Hello uid - ${UID}"
  exit 1
fi


# display username of the useer

USERNAME1=$(whoami)
USERNAME2=$(id -un)


# Test if the command succeed
if [[ "${?}" -ne 0 ]]
then
  echo "The id command did not execute successfully"
  exit 1
fi

echo "3. ${USERNAME1}"
echo "4. ${USERNAME2}"


#String test conditional
USERNAME_TO_TEST_FOR='vagrant'
if [[ "${USERNAME1}" = "${USERNAME_TO_TEST_FOR}" ]]
then
  echo "Your username matches: ${USERNAME_TO_TEST_FOR}"
fi


if [[ "${USERNAME1}" != "${USERNAME_TO_TEST_FOR}" ]]
then
  echo "Your username does not matche: ${USERNAME_TO_TEST_FOR}"
  exit 1
fi

exit 0
