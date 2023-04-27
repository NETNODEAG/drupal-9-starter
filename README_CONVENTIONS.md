# Conventions / Best practices

[TOC]
## check_standard.sh

####Context:
check_standard.sh is a simple bash script, that checks if a given codebase has the files we agreed on.

#### Convention:
- Run the check standard command, when standardizing projects

```
> check_standard.sh
```


## Taskfile.yaml

#### Context:
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


####Convention:
- Configure Taskfile.yaml!
- Make sure it's up to date.
- You can make up your own task commands

## ./nn folder

#### Context:
./nn folder includes several folders which represent "environments". Currently we supper:

- **demo** (Folder for super quick installation using php webserver)
- **lando** (For lando based local development)
- **docker** (For docker based local, stage, feature branch deployments)
- **docker-prod** (for docker based production deployments)
- **prod** (for vps based production deployments - legacy)
- **stage** (for vps based stage deployments - legacy)
- **any other** (any environment we need to support)


#### Convention:
- Delete folders which are not in use (e.g. delete prod folder if no vps setup)
- Inside a environment you are free to change and add files according to project needs

## Docker

#### Context:
TODO

## Optinionanted Drupal module installers

#### Context:

The idea here is to provide opinionated one time installer scripts. The scripts basically install the modules and config. As said, it's a one time installer, which means you run it ideally just after barebone drupal installation. After that, it's part of the drupal code base config.

```
> ./1_opinionated_modules.sh
> ./2_opinionated_config.sh
```

#### Convention:
- "0_netnode_start_config.sh" includes our minimal standard for new projects
- Add your own "xyz_opinionated_modules.sh" so we can build feature rich "one time installers"

