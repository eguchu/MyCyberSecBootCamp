#!/bin/bash

# PUT THE PATHS OF THE SHADOW AND PASSWD FILES IN A LIST

file_list=('/etc/shadow' '/etc/passwd')

# CREATE A FOR LOOP TO PRINT PERMISSIONS OF EACH FILE IN THE FILE LIST

for file in ${file_list[@]}
do
		ls -l $file >> ~/file_permissions.txt
done
