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

## Create cat table

docker exec -i -t postgres psql -U postgres -c 'create table cat (categoryguid text, categoryname text);'
docker exec -i -t postgres psql -U postgres -c "insert into cat (categoryguid , categoryname) values ('id1', 'restaurants');"
docker exec -i -t postgres psql -U postgres -c "insert into cat (categoryguid , categoryname) values ('id2', 'Coffee Shops');"

## Create trx table

docker exec -i -t postgres psql -U postgres -c 'create table trx (categoryguid text, trxid text);'
docker exec -i -t postgres psql -U postgres -c "insert into trx (categoryguid , trxid) values ('id1', 'tid1');"
docker exec -i -t postgres psql -U postgres -c "insert into trx (categoryguid , trxid) values ('id1', 'tid2');"
docker exec -i -t postgres psql -U postgres -c "insert into trx (categoryguid , trxid) values ('id2', 'tid3');"
docker exec -i -t postgres psql -U postgres -c "insert into trx (categoryguid , trxid) values ('id2', 'tid4');"

## Create w1 table

docker exec -i -t postgres psql -U postgres -c 'create table w1 (categoryparentguid text, categoryname text);'
docker exec -i -t postgres psql -U postgres -c "insert into w1 (categoryparentguid , categoryname) values ('id1', 'food&Dining');"
docker exec -i -t postgres psql -U postgres -c "insert into w1 (categoryparentguid , categoryname) values ('id2', 'food&Dining');"

