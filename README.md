
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

# 