# Run demo with builtin webserver and sqlite
```
composer create-project -s dev NETNODEAG/drupal-9-starter drupal9site --no-interaction --no-install
cd drupal9site
composer nn-demo-install
./0_netnode_start_config.sh
composer nn-demo-serve

# Optional modules and config
./1_opinionated_modules.sh
./2_opinionated_config.sh

# finally run demo
cd web
composer nn-demo-serve

# You may want to flush the site after testing.
sudo rm -rf drupal9site
```

# Create a new custom theme based on starterkit
```
cd web
php core/scripts/drupal generate-theme custom
```

# Start with lando
```
composer create-project -s dev NETNODEAG/drupal-9-starter drupal9site --no-interaction --no-install
cd drupal9site
composer nn-lando-init
lando drush si standard -y --account-name=admin --account-pass=test --account-mail=tech@netnode.ch 
```

This only works it you have the following setup on your local machinge:
- You need "brew" on your machine (Install instruction https://brew.sh/)
- Installed lando (brew install --cask lando) Info:
- Installed global composer (brew install composer)
- Installed php 8.1 on you local machine (brew install php@8.1)
