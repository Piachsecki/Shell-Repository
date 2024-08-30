#!/bin/bash

echo "${0}"

# echo "${1}"


echo "You used $(dirname ${0}) as the path to the $(basename ${0} script)"


#Tell the use how many arguemtns they passed in

NUMBER_OF_PARAMETERS="${#}"

echo "You supplied ${NUMBER_OF_PARAMETERS} arguments on the command line"


if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
  echo "Usage ${0} USERNAME [USERNAME]..."
  exit 1
fi


#Generate and display a password for each parameter

for USERNAME in "${@}"
do
  PASSWORD=$(date +%s%N | sha256sum | head -c48)
  echo "${USERNAME} : ${PASSWORD}"
done
