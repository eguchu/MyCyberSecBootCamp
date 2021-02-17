#!/bin/bash
echo "Hey Ya'all this is my Script and Well its ROCKIN !!!!"
echo -e "\nToday's date is $(date)\n"
echo "This machine's name is $HOSTNAME and I am $MACHTYPE"
echo -e "\nThe Uname info for this machine is: $(uname -a)\n"
echo -e "\nMy IP address is: $(ip addr | head -9 | tail -1)\n"
echo "Here is some more information:\n"
echo "DNS Servers: " && cat /etc/resolv.conf
echo -e "\nMemory Information: " && free
echo -e  "\nCPU Information: " && lscpu | grep CPU
echo -e "\nDisk Usage: " && df -H | head -2
echo -e "\nPeople logged in:\n $(who -a)\n"


# PUT THE PATHS OF THE SHADOW AND PASSWD FILES IN A LIST

file_list=('/etc/shadow', '/etc/passwd')

 
# CREATE A FOR LOOP TO PRINT PERMISSIONS OF EACH FILE IN THE FILE LIST

for file in ${file_list[@]};
do
		ls -l $file >> ~/file_permissions.txt
done

#....................BONUS 1..................................................

#create a for loop to check sudo abilities of each user that has a home folder

for user in $(ls /home);
do
		sudo -lU $user
done

#....................BONUS 2..................................................

# create a list that contains the commands date, uname -a, and hostname -s

cmds_list=('date' 'uname' 'hostname')

# create a for loop that prints out "The Results of the________ command are:"
for command in ${cmds_list[@]};
do
		echo -e "\nThe Results of the $command command are:\n"      $($command)
done
