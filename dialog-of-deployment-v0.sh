#!/bin/bash

read -p "Hello sysadmin, Plz choose the environment for deploying:" i
if [[ $i = core ]]
then
	echo `sh /home/tien/Script/run2deploy/core.sh`
elif [[ $i = cms ]]
then
	echo "cms"
elif [[ $i = ops ]]
then
	echo "ops"
else
	echo "Fuck! What help, guys?"
fi
