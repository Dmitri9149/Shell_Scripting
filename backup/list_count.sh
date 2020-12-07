##  print list of files in home user directory and count the 
## chars in files / directories names

user=$(whoami)
input=/home/$user

for i in $(ls /home/$user); do 
    echo -n ${i}"  "  ; echo $i | wc -c
done