#!/usr/bin/env bash

# php and composer
php ./nn/lando/check_requirements.php
composer selfupdate --2

# create .env file
cp .env.example .env

# setup drupal secific files
rm web/sites/default/settings.php
ln ./nn/lando/settings.lando.php web/sites/default/settings.php

rm web/sites/development.services.yml
ln ./nn/lando/development.services.yml web/sites/development.services.yml

rm web/.htaccess
ln ./nn/lando/.htaccess web/.htaccess

# run composer
composer install

# lando + db sync
# lando destroy -y
lando start
#. ./nn/lando/nn_sync_db_prod.sh
#. ./nn/lando/nn_build_frontend.sh

# finish
lando drush cr
open http://example.ch.lndo.site/
