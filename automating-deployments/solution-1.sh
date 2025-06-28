#!/bin/bash

read -p "Hello sysadmin. This is Develop Environment, press ENTER to continue:"
echo "----------------------------------------"
clear
printf "envir mc\t 1\nenvir cms\t 2\nenvir ops\t 3\nenvir core\t 4\n"
read -p "You did chosse:"   i
if [[ $i = 1 ]]
then
	echo `sh /home/tien/Script/cookie-fclientserver_d01/runs/mc.sh`
elif [[ $i = 2 ]]
then
	echo `sh /home/tien/Script/cookie-fclientserver_d01/runs/cms.sh`
elif [[ $i = 3 ]]
then
	echo `sh /home/tien/Script/cookie-fclientserver_d01/runs/ops.sh`
elif [[ $i = 4 ]]
then
	echo `sh /home/tien/Script/cookie-fclientserver_d01/runs/core.sh`
else
	echo "Fuck! What the help guys?"
fi
