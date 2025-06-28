#!/bin/bash

docker pull rocketchat/rocket.chat

#Rocket.Chat Docker Deployment
#Setup
#Pull down all of the files from this gist.
#Update <<YOUR_URL_HERE>> in docker-compose.yml and <<YOUR_PROJECT_NAME_HERE>> in update.sh.
#Run ./update.sh.
#From this point onward, you just run ./update.sh whenever you want to update your docker image. Alternatively, you can put the update script in a cron job, and update it however often you want.
#docker-compose.yml
#rocketchat:
#  image: rocketchat/rocket.chat
#  environment:
#    - MONGO_URL=mongodb://mongodb/rocketchat
#    - ROOT_URL=http://<<YOUR_URL_HERE>>
#  links:
#    - mongodb
#  ports:
#    - 8888:80
#
#mongodb:
#   image: mongo
#   ports:
#     - 27017

#update.sh
#docker pull rocketchat/rocket.chat
#docker-compose -p <<YOUR_PROJECT_NAME_HERE>> up -d
