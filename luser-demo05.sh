#!/bin/bash


echo "Your random number is: ${RANDOM}"

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"


echo "${PASSWORD}"


#Use the current date as the basis for the PASSWORD

PASSWORD=$(date +%s)

echo "${PASSWORD}"


PASSWORD=$(date +%s%N)

echo "${PASSWORD}"


PASSWORD=$(date +%s%N | sha256sum | head -c32)

echo "${PASSWORD}"

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c63)

echo "${PASSWORD}"


SPECIAL_CHARACTER=$( echo "!@#%^&*()_+" | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
