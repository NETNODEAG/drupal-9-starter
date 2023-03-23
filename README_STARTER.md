# Run demo with builtin webserver and sqlite
```
composer create-project -s dev NETNODEAG/nn-drupal-starter nn-demo --no-interaction --no-install
cd nn-demo
task nn-demo-install
./0_netnode_start_config.sh
task nn-demo-serve

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

# Start a new docker based drupal project
## 1. Create git repo
- Create repo https://bitbucket.org/NETNODEAG/workspace/create/repository
- On your local codebase run:
- > git init
- > git remote add origin git@bitbucket.org:NETNODEAG/change-to-your-git-repo.git
- > git add .
- > git commit -am "inital commit"
- > git push -u origin master
- edit ./nn/docker-prod/settings.docker.php (set allowed trusted host "'^.+\.docker2\.netnode\.cloud$'")
## Setup prod environment on docker host
- Make sure git repo can be accessed from docker host (Example: https://bitbucket.org/NETNODEAG/example.ch.netnode.cloud/admin/access-keys/)
- Login to the project docker host 
- git clone git@bitbucket.org:NETNODEAG/change-to-your-git-repo.git
- Inside repo folder
- > cp .env.example .env
- > vi .env # edit whatever you want
- > task nn-docker-prod-deploy (it stops at drush cim which is ok, site is not yet installed, see next step)
- Site should now be accessible with your define hostname in .env
- Install site (you may need to set permissions correctly chmod -R 777 web/sites/default/files and chmod -R 777 web/sites/default/settings.php)
- Check HOSTNAME/admin/reports/status
- > chmod -R 644 web/sites/default/settings.php
## Local codebase
- Define correct prod host drush/sites/cloud.site.yml
- 

# Start coding with lando
```
composer create-project -s dev NETNODEAG/nn-drupal-starter newsite.ch --no-interaction --no-install
cd newsite.ch
task nn-lando-start
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
- Installed task (brew install go-task)
- Installed lando (brew install --cask lando)
- Installed global composer (brew install composer)
- Installed php 8.1 on you local machine (brew install php@8.1)

# Configure Cron Jobs
You can edit /nn/prod/crontab and add/edit cronjobs. The cronjobs will be configured every deployment 