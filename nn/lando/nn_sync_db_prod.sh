#!/usr/bin/env bash

lando drush sql:sync @cloud.prod @self --structure-tables-list=cache,cache_*,search_index,watchdog -y
lando drush cr

# enable stage file proxy
lando drush en stage_file_proxy
lando drush config-set stage_file_proxy.settings origin "https://www.netnode.ch" -y

# finish
lando drush cr
lando info
