#!/bin/bash

today=$(date '+%d.%m.%Y-%H.%M')
folder=$(mkdir /tmp/$today)
cp -R /tmp/* /tmp/$folder
