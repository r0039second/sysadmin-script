#!/bin/bash

# Author:	  Tien
# Date:		  Don't remember
# Purpose:	When the server reaches the exact point of memory, the server will be restarted.

free -m | awk '/Mem:/{print $4}'
