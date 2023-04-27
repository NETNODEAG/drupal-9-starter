# check_standard.sh

check_standard.sh is a simple bash script, that checks if a given codebase has the files we agreed on.

```
> check_standard.sh
```

# Taskfile.yaml

Taskfile.yaml is use to give developers a common "interface" to command line scripts. We assume the Taskfile.yaml helps to:

- work with infrastructure, like
    - connect to stage/prod servers
    - helper commands for logging, monitoring
    - run/restore backups
    - run deployments
- help local development
    - setup local development
    - sync db
    - run linting, phpcs, phpstan 
    - run playwrite tests
- help document, get context
    - open bitbucket, jira, architecture document

# ./nn folder

./nn folder includes several folders which represent "environments". Currently we supper:

- **demo** (Folder for super quick installation using php webserver)
- **lando** (For lando based local development)
- **docker** (For docker based local, stage, feature branch deployments)
- **docker-prod** (for docker based production deployments)
- **prod** (for vps based production deployments - legacy)
- **stage** (for vps based stage deployments - legacy)
- **any other** (any environment we need to support)

# Docker

TODO

# Optinionanted Drupal module installers

```
> 1_opinionated_modules.sh
> 2_opinionated_config.sh
```

