#!/bin/bash

dmidecode | grep -A3 '^System Information'
dmidecode -s system-serial-number
