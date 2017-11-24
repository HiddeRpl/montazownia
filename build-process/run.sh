#!/bin/bash
cd ..
(cd baseimg && ./build.sh)
docker-compose up -d --build
