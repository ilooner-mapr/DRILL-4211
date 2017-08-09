#!/bin/bash

waitForPort() {
  portFlag="0"

  while [ $portFlag = "0" ]; do
    portFlag=`docker exec postgres netstat -tulpn | grep $1 | wc -l | tr -d ' '`
    sleep 1
  done
}

docker run -d --rm --name postgres -p 5432:5432 mapr/postgresdrill4211

# Populate postgres

waitForPort 5432
docker exec -i -t postgres psql -U postgres -c 'create table cat (categoryguid text, categoryname text);'

