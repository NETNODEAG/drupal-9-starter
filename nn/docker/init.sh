#!/usr/bin/env bash

echo "DEPLOYMENT START" | toilet --meta --filter border -t

set -e

echo $PATH

cp .env-example .env

mkdir -p volumes
mkdir -p volumes/mariadb
mkdir -p volumes/solr

# start container
docker compose up -d --build

# run composer
docker compose exec drupal sh -c 'composer install --no-dev --no-interaction'

rm ./web/sites/default/settings.php || true
ln ./nn/docker/settings.docker.php ./web/sites/default/settings.php
ln -f ./nn/docker/.htaccess ./web/.htaccess

docker compose exec drupal sh -c 'drush cr'
echo "DEPLOYMENT FINISHED" | toilet --meta --filter border -t


