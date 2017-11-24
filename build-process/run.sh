#!/bin/bash
cd ..
(cd baseimg && ./build.sh)
daemonize -E BUILD_ID=dontKillMe /usr/local/bin/docker-compose up --build
