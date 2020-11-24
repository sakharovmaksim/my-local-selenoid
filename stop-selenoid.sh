#!/bin/bash

docker stop selenoid &>/dev/null
docker rm selenoid &>/dev/null

docker stop selenoid-ui &>/dev/null
docker rm selenoid-ui &>/dev/null