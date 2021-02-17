#!/bin/bash

#LIST VARIABLES

days=(
        "Monday"
        "Tuesday"
        "Wednesday"
        "Thursday"
        "Friday"
        "Saturday"
        "Sunday"
                )

#PRINT DAY OF THE WEEK

for day in ${days[@]}
do      
        if [ $day = "Saturday" ] || [ $day = "Sunday" ]		   
        then
                echo "A DAY FOR CHILLAXIN MY GUY"
        else
                echo "GET ON YOUR GRIND BUDDY !!!!"
        fi
done
