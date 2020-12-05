#!/bin/bash

# This bash script is used to backup a user's /home/idrisdirectory 
# to /tmp/.  (if the user has the idris directory, of course)
# later we will change to more general functionality

user=$(whoami)
date=/home/${user}/idris
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

tar -czf ${output} ${input}

echo "Backup of $input completed! Details about the output backup file:"
ls -l $output