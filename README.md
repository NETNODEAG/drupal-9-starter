# Developer documentation for netnode.ch

[![NETNODE LOGO](http://netnode.ch/themes/custom/godigital/logo.svg)]()

## Table of contents

[TOC]

---

## General info

- Drupal 9
- PHP version: 8.1
- Deployment with Pipelines!
- Playwright installed
- Site is using redis as a Drupal Caching backend (to disable it, comment the redic cache backend config in nn/prod/settings.prod.php)

## Development instructions.

### Setup Local Environment for Development.

```
git clone git@bitbucket.org:NETNODEAG/digitalforward.netnode.ch.git
cd digitalforward.netnode.ch
composer nn-lando-init
composer nn-lando-build-frontend

# start frontend dev
cd docroot/themes/custom/godigital && npm run dev
```

### Run Maintenance using Lando.

```
git clone git@bitbucket.org:NETNODEAG/digitalforward.netnode.ch.git
cd digitalforward.netnode.ch
composer nn-lando-init
lando drush cex
composer nn-lando-maintenance
```

---
### Start frontend development

```
cd docroot/themes/custom/godigital
nvm use 14
npm install
npm run dev

# frontend production build
npm run build
```

### Custom Modules

- modules
  - contrib
  - custom
    - custom_xyz

### Testing Playwright

Use the VSCode plugin to run the tests or:

```
cd playwright
npm install
npx playwright test
# or
$ npx playwright test --headed
```


### Linting

```
./vendor/bin/phpstan  --memory-limit=1G
./vendor/bin/phpcs -v docroot/modules/custom
```

### Servers

- Local environment: lando
- https://service.netnode.ch/node/243254


```bash
ssh -p22 netnode@srv.prod.digitalforward.netnode.ch.netnode.cloud
ssh -p22 root@srv.prod.digitalforward.netnode.ch.netnode.cloud
```
