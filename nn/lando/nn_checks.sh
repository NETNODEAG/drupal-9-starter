#!/usr/bin/env bash

./vendor/squizlabs/php_codesniffer/bin/phpcs --standard=DrupalPractice,Drupal --extensions=php,module,inc,install,test,profile,theme,css,info,txt,md,yml ./web/modules/custom

./vendor/bin/phpstan.phar --memory-limit=-1
