#!/usr/bin/env bash

# php and composer
brew unlink php@7.4
brew unlink php@8.0
brew link php@8.1
composer selfupdate --2

# setup drupal secific files
rm docroot/sites/default/settings.php
ln docroot/sites/default/settings.lando.php docroot/sites/default/settings.php
rm docroot/sites/default/.htaccess
ln docroot/.htaccess_local docroot/.htaccess

# run composer
composer install

# lando + db sync
lando destroy -y
lando start
lando drush sql:sync @cloud.prod @self -y
lando drush cr

# enable stage file proxy
lando drush config-set stage_file_proxy.settings origin "https://www.netnode.ch" -y

# finish
lando drush cr
lando info
