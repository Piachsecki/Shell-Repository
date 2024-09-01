1. Exercise 1: 
Creating a Backup Script
Write a shell script that creates a backup of the /home directory
and stores it in /backup/home_backup.tar.gz. 
The script should be executable and should log the
time and date of the backup in a file named /backup/backup.log.

```shell
#!/bin/bash

ls /backup/home_backup.tar.gz &> /dev/null

if [[ "$?" -ne 0 ]]
then
        sudo mkdir -p /backup/
fi

tar zcvf /backup/home_backup.tar.gz /home/

echo "Date of backup: $(date)" >> /backup/backup.log

```

Exercise 2: User Creation Script
Write a shell script that takes a list of usernames as input and creates a user for each name in the list. The script should also set a default password for each user and force them to change it upon first login.

```shell

#!/bin/bash

while [[ "${#}" -gt 0 ]]
do
        sudo useradd "${1}"
        sudo passwd -e "${1}"
        shift
done

```

Exercise 3: Disk Space Monitoring
Write a shell script that checks the disk space usage on the system. If any partition is more than 80% full, the script should send an alert via email to the system administrator.
```shell
#!/bin/bash

IS_OVERUSED=$(df | awk 'NR > 1 { print $5 }' | grep -E '^[8-9][0-9]%$' | wc -l)

if [[ "${IS_OVERUSED}" -gt 0 ]]
then
  #...
else
  exit 
fi

```



Exercise 4: Automated System Update
Create a shell script that automatically updates the system by running 
the appropriate package manager commands (e.g., apt, yum, dnf) depending 
on the Linux distribution.
The script should log the output of the update process to a file.

```shell
#!/bin/bash

sudo apt update | sudo tee randomFile.txt

```

Exercise 5: Service Status Check
Write a script that checks if a specific service 
(e.g., httpd or nginx) is running. 
If the service is not running, the script should
start the service and log the action to a file.

```shell
#!/bin/bash

if [[ "${#}" -lt 0 ]]
then
  echo 'You have to provide a service u want to check! '
  exit 1
fi
SERVICE_NAME="${1}"

IS_ACTIVE="$(sudo systemctl is-active "${SERVICE_NAME}")"

if [[ "${IS_ACTIVE}" != 'active' ]]
then
  sudo systemctl start "${SERVICE_NAME}"
else
  exit 0
fi

```

Exercise 6: Log File Rotation
Create a shell script that rotates the logs in
/var/log. The script should compress the current logs,
archive them with a timestamp,
and then create new empty log files.

```shell
#!/bin/bash

sudo tar zcvf /var/log/myOldLogs"$(date +%d-%m-%Y)".tar.gz /var/log/ 

```


Exercise 7: File Permission Management
Write a shell script that scans a specified 
directory and changes the permissions of all
files and directories within it to a secure setting: 
directories to 755 and files to 644.

```shell

if [[ "${#}" -ne 1 ]]
then
  echo 'You have to provide a directory u want to change permissions of file for! '
  exit 1
fi

DIR_PATH="${1}"

    sudo find "${DIR_PATH}" -type f -exec sudo chmod -R 644 {} \;
    sudo find "${DIR_PATH}" -type d -exec sudo chmod -R 755 {} \;


```

Exercise 8: Network Connectivity Check
Write a shell script that checks the connectivity
to a list of IP addresses or domain names provided in
a file. The script should log the status of each
connection attempt (successful or failed) to a log file.

Exercise 9: Cron Job Automation
Write a script that schedules a cron job
to run a specific task (e.g., clean temporary files) 
every day at midnight. The script should verify if the cron
job is already scheduled before adding it.
```shell
#!/bin/bash

# Define the cron job entry
CRON_JOB="0 0 * * * root /usr/bin/find /var/log/ -type f -name '*.log' -delete"

# Check if the cron job already exists
if sudo grep -Fxq "${CRON_JOB}" /etc/crontab
then
    echo "Cron job already exists."
else
    # Add the cron job to /etc/crontab
    echo "$CRON_JOB" | sudo tee -a /etc/crontab > /dev/null
    echo "Cron job added."
fi
```

Exercise 10: Process Monitoring Script
Create a shell script that monitors the CPU 
usage of a specific process (given as an argument) 
every minute. If the CPU usage exceeds 80%, the script
should send an alert via email and log the event.