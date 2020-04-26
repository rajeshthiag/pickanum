#!/bin/sh

# This script pulls the "latest" pickanum image from the docker hub and restarts the running "pickanum" container

# list running docker containers
echo "---- listing running docker containers ----"
docker ps

# pull newest pickanum image
echo "---- pulling newest image 'poinz' ----"
docker pull rajeshinf/pickanum:latest

# stop running
echo "---- stopping running docker container 'pickanum' ----"
docker stop pickanum

# remove "poinz" container
echo "---- deleting docker container 'poinz' ----"
docker rm pickanum

# start new "pickanum" container (will automatically pull from repo)
echo "---- starting new container ----"
docker run --name pickanum --link redis:db -p 8080:3000 -d rajeshinf/pickanum:latest

