#!/bin/bash

source ./config

mkdir $TARGET_DIR/$PROJECT_NAME
cp -r ./db $TARGET_DIR/$PROJECT_NAME/db
cp -r ./pubsub $TARGET_DIR/$PROJECT_NAME/pubsub

DB_COMPOSEFILE="$TARGET_DIR/$PROJECT_NAME/db/docker-compose.yml"
PUBSUB_COMPOSEFILE="$TARGET_DIR/$PROJECT_NAME/pubsub/docker-compose.yml"


sed -i "s/==PROJECT_NAME==/$PROJECT_NAME/" $DB_COMPOSEFILE
sed -i "s/==NETWORK_NAME==/$NETWORK_NAME/" $DB_COMPOSEFILE
sed -i "s/==DB_NAME==/$DB_NAME/" $DB_COMPOSEFILE
sed -i "s/==DB_PORT==/$DB_PORT/" $DB_COMPOSEFILE
sed -i "s/==DB_USER==/$DB_USER/" $DB_COMPOSEFILE
sed -i "s/==DB_PASSWORD==/$DB_PASSWORD/" $DB_COMPOSEFILE

sed -i "s/==PROJECT_NAME==/$PROJECT_NAME/" $PUBSUB_COMPOSEFILE
sed -i "s/==NETWORK_NAME==/$NETWORK_NAME/" $PUBSUB_COMPOSEFILE
sed -i "s/==PUBSUB_PASSWORD==/$PUBSUB_PASSWORD/" $PUBSUB_COMPOSEFILE
sed -i "s/==PUBSUB_PORT==/$PUBSUB_PORT/" $PUBSUB_COMPOSEFILE

docker network create $NETWORK_NAME

cd $TARGET_DIR/$PROJECT_NAME/db && docker-compose up docker-compose.yml -d
cd $TARGET_DIR/$PROJECT_NAME/pubsub && docker-compose up docker-compose.yml -d





