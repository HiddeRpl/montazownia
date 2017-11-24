#!/bin/sh
pids=$( docker ps -q )
if [ ! -z "$pids" ]; then
  docker kill ${pids}
fi

