#!/bin/bash

# create a list that contains the commands date, uname -a, and hostname -s

cmds_list=('date' 'uname -a' 'hostname -s')

# create a for loop that prints out "The Results of the________ command are:"
for command in ${cmds_list[@]};
do
		echo -e "\nThe Results of the $command command are:\n" $($command)
done
