#!/bin/bash

ps -ef | grep chrome | grep -v grep | awk '{print $2}' | xargs kill
