#!/usr/bin/env bash

cd docroot/themes/custom/nn-drupal-starter # adapt path to your needs
nvm use
npm install && npm run build
cd ../../../..

lando drush cr
