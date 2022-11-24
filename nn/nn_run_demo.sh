#!/usr/bin/env bash

# Run a demo/test installation for (automated) testing of drupal starter template


composer install --no-interaction
cd web 
php core/scripts/drupal install standard 
php -S 127.0.0.1:8888