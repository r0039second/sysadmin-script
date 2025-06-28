#!/bin/bash

# Author:	Tien
# Date:		15/11/2016
# Purpose:	Check the number of active MySQL connection on Linux based system
# Version:	0.1 first version

watch -n 2 'netstat -nat | grep 127.0.0.1:3307 | wc -l'

