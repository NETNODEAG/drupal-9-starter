#!/bin/bash

source .infrastructure

# this command logs into remote docker host and then
# goes into the docker container using docker compose and then
# runs drush to dump mysql database, database will be pipe out to local file

ssh -t $DOCKER_PROD_USER@$DOCKER_PROD_HOST "cd $DOCKER_PROD_DOCKER_PATH; exec docker compose exec -T drupal sh -c 'drush sql-dump --structure-tables-list=cache,cache_*,search_index,watchdog'" > dump.sql
lando db-import dump.sql
rm dump.sql
