#!/bin/bash

source conf/env.sh
mvn dependency:get -Dartifact=postgresql:postgresql:9.1-901-1.jdbc4
cp ~/.m2/repository/postgresql/postgresql/9.1-901-1.jdbc4/postgresql-9.1-901-1.jdbc4.jar "$DRILL_HOME"/jars/3rdparty/
echo 'drill.exec.sys.store.provider.local.path = "postgresql-9.1-901-1.jdbc4.jar"' >> $DRILL_HOME/conf/drill-override.conf

