#!/bin/sh
cd ..
(cd baseimg && ./build.sh)
daemonize docker-compose up --build
