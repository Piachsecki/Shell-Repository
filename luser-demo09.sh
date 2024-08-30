#!/bin/bash

FILE="/tmp/data"

# head -n1 /etc/passwd > ${FILE}
#
# read LINE < ${FILE}
#
# echo "LINE contains: ${LINE}"
#
#
# head -n3 /etc/passwd >"${FILE}"
# echo
#
# echo "Contents of FILE: ${FILE}"
# cat ${FILE}
#
#
# echo "${RANDOM} ${RANDOM}" >> ${FILE}
# echo "${RANDOM} ${RANDOM}" >> ${FILE}
#
# echo "Contents of FILE: ${FILE}"
# cat ${FILE}



#file descriptors

# read LINE 0< ${FILE}
#
# echo
#
# echo "LINE contains: ${LINE}"
#
# head -n3 /etc/passwd 1> ${FILE}
# echo
#
# echo "Contens of ${FILE}: "
# cat ${FILE}


#redirect stderr
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}

#redirect stderr and stdout to file
BOTH_FILE="/tmp/data.both"

head -n3 /etc/passwd /etc/passwd /fakefile &> ${BOTH_FILE}


head -n3 /etc/passwd /etc/passwd /fakefile >> ${BOTH_FILE} 2>&1



#redirect stderr and stdout through a pipe

head -n3 /etc/passwd /fakefile |& cat -n



echo "Discarding STDOUT"
head -n3 /etc/passwd /fakefile > /dev/null

echo
echo "Discarding STDERR"

head -n3 /etc/passwd /fakefile 2> /dev/null



echo
echo "Discarding BOTH"
head -n3 /etc/passwd /fakefile &> /dev/null

#Clean up

rm ${FILE} ${ERR_FILE} &> /dev/null
