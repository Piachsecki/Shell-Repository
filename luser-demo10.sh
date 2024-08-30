#!/bin/bash

#
#
# log1() {
#   local VERBOSE="${1}"
#   shift
#   local MESSAGE="${@}"
#
#   if [[ "${VERBOSE}" = 'true' ]]
#   then
#     echo "${MESSAGE}"
#   fi
#
# }
# log1 "${VERBOSITY}" 'Hello!'
# log1 "${VERBOSITY}" 'This is fun'
# function log2 {
#   echo 'You called the log function'
# }

log1() {
  #This message send a message to syslog and stdout if verbose is true

  local MESSAGE="${@}"

  if [[ "${VERBOSE}" = 'true' ]]
  then
    echo "${MESSAGE}"
  fi
  logger -t luser-demo10.sh "$MESSAGE"
}

backup_file() {
  #This function create a backup of a file. Returrns non-zero status on an error
  local FILE="${1}"

  #Make sure file exists
  if [[ -f "${FILE}" ]]
  then
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
    log1 "Backing up ${FILE} to ${BACKUP_FILE}"


    cp -p ${FILE} ${BACKUP_FILE}

  else
    return 1
  fi
}




readonly VERBOSE='true'

log1  'Hello!'
log1 'This is fun'

backup_file '/etc/passwd'

#Make a decision based on the exit status of the function

if [[ "${?}" -eq '0' ]]
then
  log1 'File backup succeedded'
else
  log1 'File backup failed'
  exit 1
fi
