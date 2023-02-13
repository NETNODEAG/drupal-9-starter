#!/usr/bin/env bash

# Replace . with -
CLEANSLUG="${BITBUCKET_REPO_SLUG//./-}"
echo $CLEANSLUG
CLEANBRANCHNAME=$(echo "${BITBUCKET_BRANCH}" | sed 's:/:-:g')
echo $CLEANBRANCHNAME
FOLDER="$CLEANSLUG-$CLEANBRANCHNAME"

mkdir -p $FOLDER
git -C "$FOLDER" pull || git clone "$BITBUCKET_GIT_SSH_ORIGIN" "$FOLDER"
cd $FOLDER

git checkout $BITBUCKET_BRANCH

# create .env file on the fly
cat << EOF > .env
APP_ENV=docker
APP_NAME=$FOLDER
HOSTNAME=$FOLDER.docker.netnode.cloud
# Database credentials
DB_DATABASE=drupal
DB_USERNAME=drupal
DB_PASSWORD=drupal
DB_HOST=$FOLDER-database
DB_PORT=3306
EOF

docker compose up --build -d
# deploy the site
./nn/docker/deploy.sh


