#!/usr/bin/env bash

# Run a demo/test installation for (automated) testing of drupal starter template


composer install --no-interaction
cp nn/demo/settings.demo.php web/sites/default/settings.php
cd web 
#php core/scripts/drupal install minimal 
../vendor/drush/drush/drush sql-drop -y
../vendor/drush/drush/drush si standard -y --db-url=sqlite://sites/example.com/files/.ht.sqlite --account-name=admin --account-mail=demo@netnode.ch --account-pass=test
