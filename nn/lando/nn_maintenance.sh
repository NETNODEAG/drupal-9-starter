#!/usr/bin/env bash

lando drush cex -y
composer update --with-dependencies
lando drush updb -y
lando drush cr
lando info
open http://nn-drupal-starter.ch.lndo.site/
