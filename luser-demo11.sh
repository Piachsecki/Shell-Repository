#!/bin/bash


#Script generates random password, user can set the password length with -l and a special character with -#!/bin/sh
#Verbose mode can be anabled with -v

usage() {
  echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
  echo "Generate a random password."
  echo '-l LENGTH Specify the password length.'
  echo '-s Append a special character to the password.'
  echo '-v increase verbosity'
  exit 1
}


log() {
  local MESSAGE="${@}"
if [[ "${VERBOSE}" = 'true' ]]
then
  echo "${MESSAGE}"
fi
}

LENGTH=48

while getopts vl:s OPTION
do
  case ${OPTION} in
    v)
      VERBOSE='true'
      log 'Verbose mode on'
      ;;
    l)
      LENGTH="${OPTARG}"
      ;;
    s)
      USE_SPECIAL_CHARACTER='true'
      ;;
    ?)
      usage
      ;;
  esac
done

# echo "Number of args: ${#}"
# echo "Number of args: ${#}"
# echo "Number of args: ${#}"
# echo "Number of args: ${#}"
# echo "Number of args: ${#}"


echo "OPTIND: ${OPTIND}"


#
#
# log 'Generating a password!'
#
#
# PASSWORD=$(date +%s%N${RANDOM}$RANDOM | sha256sum | head -c${LENGTH})
#
# if [[ "${USE_SPECIAL_CHARACTER}" = 'true' ]]
# then
#   log 'Selecting a random special character.'
#   USE_SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+' | fold -w1 | shuf | head -c1)
#   PASSWORD=${PASSWORD}${USE_SPECIAL_CHARACTER}
# fi
#
# log 'Done'
# log 'Here is the password: '
#
# echo "${PASSWORD}"
