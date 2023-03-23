#!/usr/bin/env bash

if [ -f .env ]; then
  source .env
else
  echo ".env file not found"
  exit 1
fi

docker compose up -d --build
docker compose exec drupal sh -c 'composer install --no-dev --no-interaction'

rm ./web/sites/default/settings.php || true
ln ./nn/docker-prod/settings.docker.php ./web/sites/default/settings.php

chmod 777 ./web/sites/default/settings.php

mkdir -p ./web/sites/default/files
chmod -R 777 ./web/sites/default/files

docker compose exec drupal sh -c 'drush si standard --site-name=$HOSTNAME --uri=$HOSTNAME --account-name=nadmin'

echo "Visit $HOSTNAME"
echo "Infos:"
echo "- you may need to wait 15 seconds for traefik to setup https"
echo "- you may want to change nadmin password and save to 1password"