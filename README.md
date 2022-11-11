```
composer create-project -s dev NETNODEAG/drupal-9-starter . --no-interaction --no-install
composer install --no-interaction

# start testing with
php web/core/scripts/drupal install standard 
cd web 
php -S 127.0.0.1:8888

# update drupal core with
composer update drupal/core 'drupal/core-*' --with-all-dependencies 

# More cool stuff here https://colorfield.be/blog/minimal-drupal-9-local-development-environment - hi christoph *wave* ;-)
```