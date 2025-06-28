#!/bin/bash

# Author:	  Tien
# Date:		  15/11/2016
# Purpose:	To find out whether the MySQL server is up and running

mysqladmin -uroot -p -h 127.0.0.1 -P 3307 ping

