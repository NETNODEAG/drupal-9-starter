

lando composer require drupal/gin

lando drush theme:enable gin
lando drush config-set system.theme admin gin -y
lando drush config-set gin.settings classic_toolbar horizontal -y
lando drush config-set user.settings register admin_only -y

lando composer require drupal/gin_toolbar
lando drush en gin_toolbar -y

lando composer require drupal/gin_login
lando drush en gin_login -y


lando composer require drupal/login_destination
lando drush en login_destination -y

lando composer require 'drupal/r4032login:^2.2'
lando drush en r4032login -y

lando composer require drupal/admin_toolbar
lando drush en admin_toolbar -y

lando composer require drupal/permissions_filter
lando drush en permissions_filter -y

lando composer require drupal/views_bulk_operations
lando drush en views_bulk_operations -y

lando composer require 'drupal/paragraphs_edit'
lando drush en paragraphs_edit -y

lando composer require drupal/nocurrent_pass
lando drush en nocurrent_pass -y

lando composer require drupal/reroute_email --no-interaction 
lando drush en reroute_email -y

lando composer require drupal/shield --no-interaction 
lando drush drush en shield -y

lando composer require drupal/devel
lando drush en devel -y

lando composer require drupal/config_ignore
lando drush en config_ignore -y

lando composer require drupal/symfony_mailer
lando drush en symfony_mailer -y