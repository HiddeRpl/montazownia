#!/bin/sh
img=$( docker image ls | grep "siteupdate_app" )
if [ ! -z "$img" ]; then
  docker rmi --force siteupdate_app
fi
