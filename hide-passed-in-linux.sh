#!/bin/bash

# Author:	  Tien
# Date:		  15/11/2016
# Purpose:	I want to take input of password in a shell script. I must want to not want to show any character on-screen entered by the user. Use '-s for silent mode. Using '-s' input characters are not echoed.

read -p "Enter Password: " passwd
echo "Your Password Is: " $passwd
