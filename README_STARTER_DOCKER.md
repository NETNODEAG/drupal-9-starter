# Start a new docker based drupal project

The following steps explain how you can create a new drupal codebase using nn-drupal-starter template and deploy to a docker host.

## 1. Create local code base
> composer create-project -s dev NETNODEAG/nn-drupal-starter example.ch --no-interaction --no-install

## 2. Create git repo & push code
- Create repo https://bitbucket.org/NETNODEAG/workspace/create/repository
- On your local codebase run:
> git init
> git remote add origin git@bitbucket.org:NETNODEAG/change-to-your-git-repo.git
> git add .
- edit ./nn/docker-prod/settings.docker.php (set allowed trusted host "'^.+\.docker2\.netnode\.cloud$'")
> git commit -am "inital commit"
> git push -u origin master


## 3. Setup prod environment on docker host
- Make sure git repo can be accessed from docker host (Example: https://bitbucket.org/NETNODEAG/example.ch.netnode.cloud/admin/access-keys/)
- Login to the project docker host 
- git clone git@bitbucket.org:NETNODEAG/change-to-your-git-repo.git
- Inside repo folder
- > cp .env.example .env
- > vi .env # edit whatever you want
- > task nn-docker-prod-first-install 
- Login to the site and check /admin/reports/status

## 4. Setup drush aliases and .infrastructure
- edit drush/sites/cloud.site.yml
- edit .infrastructure
- Start lando (no DB synced yet)
> lando start
- Sync DB from docker host
> task nn-lando-sync-db-prod
- edit bitbucket-pipelines.yml (adapt path & host ip)
- Allow the the git repo to access the docker host
- Adapt Taskfile.yaml (remove commands we dont need)