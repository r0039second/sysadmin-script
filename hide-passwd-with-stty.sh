#!/bin/bash

# Author:	  Tien
# Date:		  15/11/2016
# Purpose:	We can use 'stty' to hide the password entry in UNIX/LINUX command prompt, which is like entering a password when you log in to the UNIX/LINUX

echo "Please enter the pwd:"
stty -echo
read pwd
stty echo
if [ "$pwd" = "secret" ]; then
	echo "u have access"
else
	echo "access denied"
fi
