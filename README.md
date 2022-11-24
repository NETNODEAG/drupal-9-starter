Run demo with builtin webserver and sqlite
```
composer create-project -s dev NETNODEAG/drupal-9-starter drupal9site --no-interaction --no-install
cd drupal9site
composer nn-run-demo

# Optional
./1_opinionated_modules.sh
./2_opinionated_config.sh

# finally run demo
php -S 127.0.0.1:8888
```

# Login with user 1
```
../vendor/drush/drush/drush uli && php -S 127.0.0.1:8888
```

You may want to flush the site after testing.
```
sudo rm -rf drupal9site
```

# Update drupal core with
```
composer update drupal/core 'drupal/core-*' --with-all-dependencies 
```

# More cool stuff
https://colorfield.be/blog/minimal-drupal-9-local-development-environment - hi christoph *wave* ;-)
