#!/bin/bash


#Hello from main OS

echo 'Hello'

WORD='script'

echo "$WORD"

echo '$WORD'

echo "This is a shell $WORD"

 echo "This is a second method of defining ${WORD}"


echo "${WORD}ing is fun"


echo "$WORDing is fun"


ENDING='ed'


echo "This is ${WORD}${ENDING}"


echo "Your UID is ${UID}"


USERNAME=$(id -nu)

echo "Your username is $USERNAME"


if [[ "${UID}" -eq 0 ]]
then
  echo "You are root"
else
  echo "You are not a root"
fi
