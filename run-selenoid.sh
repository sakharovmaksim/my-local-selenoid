#!/bin/bash

pwd=`pwd`
echo "Current dir is ${pwd}"

# Stop all for preparing to run
"${pwd}/stop-selenoid.sh"

# Download needed browsers
"${pwd}/download-browsers.sh"

# Run Selenoid service
docker run -d --name selenoid -p 4444:4444 -v /var/run/docker.sock:/var/run/docker.sock \
       -v "$pwd"/config/:/etc/selenoid/:ro aerokube/selenoid:latest-release

# Run Selenoid UI
docker run -d --name selenoid-ui --link selenoid -p 8080:8080 aerokube/selenoid-ui --selenoid-uri=http://selenoid:4444

# Show running docker containers
docker ps -a