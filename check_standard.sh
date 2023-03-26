#!/usr/bin/env bash

echo "Checks NETNODE project standards"

# Define the colors for the filename
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Define the array of files and folders to check
FILES=("./nn" "./bitbucket-pipelines.yml" "./docker-compose.yml" "./Dockerfile" 
"./Taskfile.yaml" "./phpstan.neon" "./README.md" "./drush/sites/cloud.site.yml"
"./.env.example" "./.gitignore" "./.lando.yml" "./composer.json")

# Loop over the array and check each file/folder
for f in "${FILES[@]}"; do
    if [ -e "$f" ]; then
        echo -e "${GREEN}[✓] $f${NC} exists"
    else
        echo -e "${RED}[ ] $f${NC} does not exist"
        echo -e "    -> Solution: Copy $f from starter template"
    fi
done

FILES_TO_BE_DELETED=("./0_netnode_start_config.sh" "./1_opinionated_modules.sh"
"./2_opinionated_config.sh" "./README_STARTER.md")

# Loop over the array and check each file/folder
for f in "${FILES_TO_BE_DELETED[@]}"; do
    if [ -e "$f" ]; then
        echo -e "${RED}[ ] $f${NC} should be deleted!"
        echo -e "    -> Solution: Delete $f"
    fi
done