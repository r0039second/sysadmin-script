#!/bin/bash

# Author:	  Tien
# Date:		  15/11/2016
# Purpose:	See the number of currently open connections at MySQL
# Version:	0.1 first version
# Note:		See the number of connection attempts to the MySQL server includes both failed and successful connection attempts
#		mysql> show status like 'Conn%';	

mysql -h 127.0.0.1 -P 3307 -uroot -p -e "show status like '%onn%'"
