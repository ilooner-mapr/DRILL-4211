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

```
{
  "type": "jdbc",
  "driver": "org.postgresql.Driver",
  "url": "jdbc:postgresql://localhost:5432",
  "username": "postgres",
  "enabled": true
}
```
