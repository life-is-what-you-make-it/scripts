#!/bin/bash


if [ $UID -eq 0 ]
then
   echo "please dont run this script with sudo"
   exit
fi





# var to hold output 
output=$HOME/resarchoutput/sys_info.sh

# creat 
#mkdir ~/researchoutput 2> /dev/null

#create
if [ ! -d $HOME/researchoutput ]
then 
mkdir $HOME/researchoutput
fi

if [ ! -f $HOME/researchoutput/sys_info.sh ]
then 
rm $HOME/researchoutput/sys_info.sh
fi 


echo "quick funny jokes" >> $output
echo "-----------------" >> $output
date >> $output
echo "maschine type info" >> $output
echo $MACHTYPE  >> $output 
echo -e "uname info: $(uname -a) \n" >> $output

echo -e "IP info: $(ip addr | head -9 | tail -1) \n" >> $output
ip=$(ip addr | head -9  | tail -1)
echo -e "IP Info:$ip \n" >> $output

echo -e "hostname: $(hostname -s) " >> $output
echo "DNS servers: " >> $output
echo "=================================" >> $output
cat /etc/resolv.conf >> $output
echo "Memory Info" >> $output
free  >> $output
echo "==================================" >> $output

echo -e "\nExec Files:" >> $output
executables=$(find /home -type F -perm 777) 
echo $executables >> $output

echo -e "\nTop 10  Processes" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11}' |head >> $output

