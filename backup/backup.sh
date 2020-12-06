#!/bin/bash

# This bash script is used to backup a user's /home/.. directory 
# to /tmp/. 

user=$(whoami)

if [ -z $1 ]; then                                                                                                                                                                                                                                                             
        echo "No parameters."
        exit 1                                                                                                                                                                                                                                                         
else                                                                                                                                                                                                                                                                           
        if [ ! -d "/home/$user/$1" ]; then                                                                                                                                                                                                                                           
                echo "Requested /home/$user/$1 user home directory doesn't exist."                                                                                                                                                                                                         
                exit 1                                                                                                                                                                                                                                                         
        fi                                                                                                                                                                                                                                                                     
        user=$(whoami)                                                                                                                                                                                                                                                               
fi 

input=/home/$user/$1
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

## Reports a total number of files in directory
function total_files {
    find $1 -type f | wc -l
}

# Reports a total number of directories
function total_directories {
    find $1 -type d | wc -l
}

function total_archived_directories {
        tar -tzf $1 | grep  /$ | wc -l
}

function total_archived_files {
        tar -tzf $1 | grep -v /$ | wc -l
}



tar -czf $output $input 2> /dev/null

src_files=$( total_files $input )
src_directories=$( total_directories $input )

arch_files=$( total_archived_files $output )
arch_directories=$( total_archived_directories $output )

echo "Files to be included: $src_files"
echo "Directories to be included: $src_directories"
echo "Files archived: $arch_files"
echo "Directories archived: $arch_directories"

if [ $src_files -eq $arch_files ]; then
        echo "Backup of $input completed!"
        echo "Details about the output backup file:"
        ls -l $output
else
        echo "Backup of $input failed!"
fi
