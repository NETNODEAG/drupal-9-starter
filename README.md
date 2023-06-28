Check ./README_STARTER.md


# example.ch

## Install for local development

```bash
git clone git@bitbucket.org:NETNODEAG/example.ch.git
cp .env.lando .env
lando start
lando composer install
task nn-lando-sync-db-prod
```
