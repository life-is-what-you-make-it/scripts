#!/bin/bash

states=('Texas' 'New York' 'Hawaii' 'Colorado' 'Cali')
 
for state in ${states[@]}
do
   if [ $states == 'Hawaii' ];
   then
        echo "Hawaii is the best"
   else
        echo "I'm not a fan of Hawaii"
    fi 
done 

