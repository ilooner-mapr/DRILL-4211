# Info

This repo has the files needed to reproduce this issue:

https://issues.apache.org/jira/browse/DRILL-4211

# Usage

## Build Test Postgres Image

  1 Install docker
  1 Run ./build.sh

## Run Image

```
./start.sh
```

## Stop Image

```
./stop.sh
```

## Configure Storage Plugin

Create a plugin called postgres:

```
{
  "type": "jdbc",
  "driver": "org.postgresql.Driver",
  "url": "jdbc:postgresql://localhost:5432",
  "username": "postgres",
  "enabled": true
}
```

## The Problem Query

The qeury in postgres

```
select trx.categoryguid, cat.categoryname, w1.categoryname as parentcat from trx join categories cat on (cat.categoryguid = trx.categoryguid) join categories w1 on (cat.categoryguid = w1.categoryguid) where w1.categoryguid IS NOT NULL;
```

The query in drill

```
select trx.categoryguid, cat.categoryname, w1.categoryname as parentcat from postgres.public.trx trx join postgres.public.categories cat on (cat.categoryguid = trx.categoryguid) join postgres.public.categories w1 on (cat.categoryguid = w1.categoryguid) where w1.categoryguid IS NOT NULL;
```


