#!/bin/bash
cd ..
(cd baseimg && ./build.sh)
docker-compose rm -f
docker-compose up -d --build
