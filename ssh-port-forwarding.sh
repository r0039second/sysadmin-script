#!/bin/bash

# Author:	  Tien
# Date:		  30/11/2016
# Purpose:	Forwarding port on dev01 to s01. So Hieu need to port forwarding to test/ dev the Bank features.
#		192.168.200.156 is Bank's IP
#		SSH to s01 with moca user, not long, also not root

autossh -L \*:8888:172.18.1.107:80 s01
