#!/bin/bash

# This bash script is used to backup a user's /home/idrisdirectory 
# to /tmp/.  (if the user has the idris directory, of course)
# later we will change to more general functionality

user=$(whoami)
input=/home/$user/idris/
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

## Reports a total number of files in directory
function total_files {
    find $1 -type f | wc -l
}

# Reports a total number of directories
function total_directories {
    find $1 -type d | wc -l
}

echo -n "Files to be included: "
total_files $input
echo -n "directories to be included: "
total_directories $input

tar -czf $output $input 2> /dev/null

echo "Backup of $input completed! Details about the output backup file:"
ls -l $output