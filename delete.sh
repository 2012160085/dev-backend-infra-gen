#!/bin/bash

source ./config


docker stop $PROJECT_NAME-postgres
docker rm $PROJECT_NAME-postgres
docker stop $PROJECT_NAME-redis
docker rm $PROJECT_NAME-redis
docker network rm $NETWORK_NAME

rm -rf $TARGET_DIR/$PROJECT_NAME

