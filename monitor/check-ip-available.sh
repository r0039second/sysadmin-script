#!/bin/bash

# Author:	  Tien
# Date:		  02/12/2016
# Purpose:	Count the network devices available in the network LAN.

nmap -sP 10.10.10.0/24 | grep "Host is up" | wc -l
