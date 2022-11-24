#!/usr/bin/env bash

cd docroot/themes/custom/godigital
nvm use
npm install && npm run build
cd ../../../..

lando drush cr
