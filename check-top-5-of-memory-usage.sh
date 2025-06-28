#!/bin/bash

# Author:	  Tien
# Date:		  22/11/2016
# Purpose:	This will give the top 5 processes by memory usage

ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -5
