#!/bin/bash

find /home/banks/*.dat -mtime +1 -exec rm {} \;
