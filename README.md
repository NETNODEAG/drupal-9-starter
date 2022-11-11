```
composer create-project -s dev NETNODEAG/drupal-9-starter drupal9site --no-interaction --no-install
cd drupal9site
composer install --no-interaction
```
# For fast testing/developing use php builtin webserver and sqlite
```
php web/core/scripts/drupal install standard 
cd web 
php -S 127.0.0.1:8888
```

# Lando
You may use lando. If so, go like this:
```
mkdir mynewdrupal9site
cd mynewdrupal9site
composer create-project -s dev NETNODEAG/drupal-9-starter . --no-interaction --no-install
lando init # select drupal10, set "web" as webroot
lando start
lando composer install --no-interaction
```

# Update drupal core with
```
composer update drupal/core 'drupal/core-*' --with-all-dependencies 
```

# More cool stuff here https://colorfield.be/blog/minimal-drupal-9-local-development-environment - hi christoph *wave* ;-)
```