#!/bin/bash

# if [[ "${1}" = 'start' ]]
# then
#   echo 'Starting'
# elif [[ "${1}" = 'stop' ]]
# then
#   echo 'Stopping'
# elif [[ "${1}" = 'status' ]]
# then
#   echo 'Status'
# else
#   echo 'Supply a valid option!' >&2
#   exit 1
# fi

# case "${1}" in
#   start)
#     echo 'Startmg'
#     ;;
#   stop)
#     echo 'Stropping'
#     ;;
#   status|state)
#     echo 'Status:'
#     ;;
#   *)
#     echo 'Supply a valid option' >&2
#     exit 1
#     ;;
# esac



case "${1}" in
  start) echo 'Startmg' ;;
  stop) echo 'Stropping' ;;
  status|state) echo 'Status:' ;;
  *)
    echo 'Supply a valid option' >&2
    exit 1
    ;;
esac
