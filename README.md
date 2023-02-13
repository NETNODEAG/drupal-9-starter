# Run demo with builtin webserver and sqlite
```
composer create-project -s dev NETNODEAG/nn-drupal-starter nn-demo --no-interaction --no-install
cd nn-demo
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
sudo rm -rf nn-demo
```

# Create a new custom theme based on starterkit
```
cd web
php core/scripts/drupal generate-theme custom
```

# Start with lando
```
composer create-project -s dev NETNODEAG/nn-drupal-starter newsite.ch --no-interaction --no-install
cd newsite.ch
composer nn-lando-init
lando drush si standard -y --account-name=admin --account-pass=test --account-mail=tech@netnode.ch 
```

# Init a brand new site with docker compose
```
composer create-project -s dev NETNODEAG/nn-drupal-starter example.ch --no-interaction --no-install
cd example.ch
./nn/docker/init.sh

# you may want to adapt .env-example and .env to your specifications
cp .env-example .env 

## Use while coding:

## Use for local or feature branch deployments
./nn/docker/deploy.sh

# other useful commands
composer nn-docker-bash # access the drupal containtern, then
composer install
drush si --account-mail=tech@netnode.ch --account-name=admin --account-pass=test --site-name=example.ch -y

## you may want to use the following commands any time during development

## sync db with prod
composer nn-lando-sync-db-prod

## open the lando dev site
composer nn-open

# Access drupal docker container
nn-docker-bash
```

# Start with lando
```
git clone git@bitbucket.org:NETNODEAG/example.ch.git
composer nn-lando-init

# you may want to use the following commands any time during development

# sync db with prod
composer nn-lando-sync-db-prod

# open the lando dev site
composer nn-open

# install dependencies
composer required drupal/xxxx

# Run maintenance script with lando
composer nn-lando-maintenance

# Login into prod server
composer nn-ssh-prod
```

This only works it you have the following setup on your local machinge:
- You need "brew" on your machine (Install instruction https://brew.sh/)
- Installed lando (brew install --cask lando) Info:
- Installed global composer (brew install composer)
- Installed php 8.1 on you local machine (brew install php@8.1)

# Configure Cron Jobs
You can edit /nn/prod/crontab and add/edit cronjobs. The cronjobs will be configured every deployment 