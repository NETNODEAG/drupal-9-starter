<?php

echo shell_exec('set -e');

echo title("DEPLOYMENT START");
echo "DONE.\n\n";

// make db dump
echo title("Database buckup drush sql-dump --result-file=auto --gzip");
echo shell_exec('drush sql-dump --structure-tables-list=cache,cache_*,search_index,watchdog --result-file=auto --gzip');
echo "DONE.\n\n";

// run git pull
echo title("RUNNING git pull");
echo shell_exec('git pull');
echo "DONE.\n\n";

// copy files
echo title("Copy Files");
echo shell_exec('rm docroot/sites/default/settings.php');
echo shell_exec('ln ./nn/prod/settings.prod.php docroot/sites/default/settings.php');
echo shell_exec('rm docroot/.htaccess');
echo shell_exec('ln nn/lando/.htaccess docroot/.htaccess');

// run composer
echo title("RUNNING composer install --no-dev --no-interaction");
#echo shell_exec('rm -rf vendor');
echo shell_exec('composer install --no-dev --no-interaction');
echo shell_exec('git status');
echo "DONE.\n\n";

// run db updb
echo title("RUNNING drush cr && drush updb && drush cim -y && drush cr");
echo shell_exec('drush cr');
echo shell_exec('drush updb -y');
echo shell_exec('drush cim -y');
echo shell_exec('drush cr');
echo "DONE.\n\n";

// Build theme
echo title("RUNNING npm install & npm run build");
echo shell_exec('cd ./docroot/themes/custom/godigital && npm install && npm run build');
echo "DONE.\n\n";

// File permissions
echo title("Set correct file permissions");
#echo shell_exec('chown netnode:www-data -R ./docroot');
#echo shell_exec('chown netnode:www-data -R ./docroot/sites/default/files');
#echo shell_exec("find docroot/sites/default/files -type f -exec chmod u=rw,g=rw,o= '{}' \;");
#echo shell_exec("find docroot/sites/default/files -type d -exec chmod u=rwx,g=rwx,o= '{}' \;");
echo shell_exec('chmod 775 docroot/sites/default/files');

#echo shell_exec('chmod 644 docroot/sites/default/settings.local.php');
echo shell_exec('chmod 755 docroot/sites/default');
echo shell_exec('chmod +w docroot/sites/default');
echo shell_exec('find docroot/sites/default -name "*settings.php" -exec chmod 644 {} \;');
echo shell_exec('find docroot/sites/default -name "*services.yml" -exec chmod 644 {} \;');

echo title("DEPLOYMENT FINISHED");

function title($string) {
  return "\033[0;32m############### $string ###############033[0m\n";
}
