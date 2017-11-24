#!/bin/sh
cd ..
(cd baseimg && ./build.sh)
nohup docker-compose up --build &
