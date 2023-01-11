#!/usr/bin/env bash

set -e

echo "DEPLOYMENT START" | toilet --meta --filter border -t

# make db dump
echo "RUN: Backup Database" | toilet -f term -F border --meta
drush sql-dump --structure-tables-list=cache,cache_*,search_index,watchdog --result-file=auto --gzip
echo "Backup Database -> DONE" | toilet -f term -F border --meta

# run git pull
echo "RUN: git pull" | toilet -f term -F border --meta
#rm ./web/themes/custom/godigital/yarn.lock || true
git pull -v
echo "RUNNING git pull -> DONE" | toilet -f term -F border --meta

# copy files
echo "RUN: Backup Database" | toilet -f term -F border --meta
rm ./web/sites/default/settings.php || true
ln ./nn/prod/settings.prod.php ./web/sites/default/settings.php
rm ./web/.htaccess || true
ln nn/prod/.htaccess_prod ./web/.htaccess

# run composer
echo "RUN: composer install" |toilet -f term -F border --meta
#rm -rf vendor
composer install --no-dev --no-interaction
git status
echo "composer install -> DONE" | toilet -f term -F border --meta

# run db updb
echo "RUN: drush updb|cim" | toilet -f term -F border --meta
drush cr
drush updb -y
drush cim -y
drush cr
echo "RUNNING drush updb|cim –> DONE" | toilet -f term -F border --meta

# Build theme
echo "RUN: Build Drupal theme" | toilet -f term -F border --meta
cd ./web/themes/custom/godigital && npm install && npm run build
echo "Build Drupal theme –> DONE" | toilet -f term -F border --meta

# File permissions
#echo "Set correct file permissions" | toilet -f term -F border --meta
#chown netnode:www-data -R ./docroot
#chown netnode:www-data -R ./docroot/sites/default/files
#find docroot/sites/default/files -type f -exec chmod u=rw,g=rw,o= '{}' \;
#find docroot/sites/default/files -type d -exec chmod u=rwx,g=rwx,o= '{}' \;
#chmod 775 ./docroot/sites/default/files

#chmod 644 docroot/sites/default/settings.local.php');
#chmod 755 ./docroot/sites/default
#chmod +w ./docroot/sites/default
#find ./docroot/sites/default -name "*settings.php" -exec chmod 644 {} \;
#find ./docroot/sites/default -name "*services.yml" -exec chmod 644 {} \;

# Install cron jobs
echo "RUN: Install crontab" | toilet -f term -F border --meta
crontab nn/prod/crontab
echo "Install crontab –> DONE" | toilet -f term -F border --meta

echo "DEPLOYMENT FINISHED" | toilet --meta --filter border -t


