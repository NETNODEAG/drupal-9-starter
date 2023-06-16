# Core nodehive default settings
lando drush config-set system.site page.front /admin/content -y

# Set Default Theme to Gin
lando composer require drupal/gin
lando drush theme:enable gin
lando drush config-set system.theme admin gin -y
lando drush config-set system.theme default gin -y
lando drush config-set gin.settings classic_toolbar horizontal -y
lando drush config-set user.settings register admin_only -y

# Create NodeHive Menu
lando drush eval "\Drupal::configFactory()->getEditable('system.menu.nodehive-admin')->set('id', 'nodehive-admin')->save();"
lando drush config-set system.menu.nodehive-admin langcode en -y
lando drush config-set system.menu.nodehive-admin status true -y
lando drush config-set system.menu.nodehive-admin id nodehive-admin -y
lando drush config-set system.menu.nodehive-admin label 'NodeHive' -y
lando drush config-set system.menu.nodehive-admin description 'NodeHive Admin Menu' -y
lando drush config-set system.menu.nodehive-admin locked false -y


# Basic
lando composer require drush/drush
lando composer require cweagans/composer-patches

# Admin optimisation
lando composer require drupal/coffee
lando drush en coffee -y

lando composer require drupal/admin_toolbar
lando drush en admin_toolbar -y

lando composer require drupal/gin_toolbar
lando drush en gin_toolbar -y

lando composer require drupal/gin_login
lando drush en gin_login -y

# Other
lando composer require drupal/login_destination
lando drush en login_destination -y

lando composer require 'drupal/r4032login:^2.2'
lando drush en r4032login -y



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


# decoupled tools
lando composer require drupal/next
lando drush en next -y
lando composer require drupal/jsonapi_menu_items
lando drush en jsonapi_menu_items -y
lando composer require drupal/jsonapi_include
lando drush en jsonapi_include -y
lando composer require drupal/jsonapi_image_styles
lando drush en jsonapi_image_styles -y
lando composer require drupal/restui
lando drush en restui -y
lando composer require drupal/decoupled_router
lando drush en decoupled_router -y
lando composer require drupal/pathauto
lando drush en pathauto -y
