#!/bin/bash

greeting = "Welcome"
user = $(whoami)
day = $(date +A%)
folder = $(pwd)

echo "$greeting back $user! Today is $day and you are working in $folder ."
echo "Your bash version is $BASH_VERSION and not all is still lost."