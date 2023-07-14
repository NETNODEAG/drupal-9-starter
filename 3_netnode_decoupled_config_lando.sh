# Core nodehive default settings
# ------------------------------------------------------
lando drush config-set system.site page.front /admin/content -y

# Set Default Theme to Gin
# ------------------------------------------------------

lando composer require drupal/gin
lando drush theme:enable gin -y
lando drush config-set system.theme admin gin -y
lando drush config-set system.theme default gin -y
lando drush config-set gin.settings classic_toolbar horizontal -y
lando drush config-set user.settings register admin_only -y
lando drush en gin_toolbar -y

# Create NodeHive Menu
# ------------------------------------------------------

lando drush eval "\Drupal::configFactory()->getEditable('system.menu.nodehive-admin')->set('id', 'nodehive-admin')->save();"
lando drush config-set system.menu.nodehive-admin langcode en -y
lando drush config-set system.menu.nodehive-admin status true -y
lando drush config-set system.menu.nodehive-admin id nodehive-admin -y
lando drush config-set system.menu.nodehive-admin label 'NodeHive' -y
lando drush config-set system.menu.nodehive-admin description 'NodeHive Admin Menu' -y
lando drush config-set system.menu.nodehive-admin locked false -y

# Basic
# ------------------------------------------------------

lando composer require drush/drush
lando composer require cweagans/composer-patches

# UI Modules
# ------------------------------------------------------

# Gin Login
lando composer require drupal/gin_login
lando drush en gin_login -y

# Admin toolbar - improve the admin ui
lando composer require drupal/admin_toolbar
lando drush en admin_toolbar -y

# Coffee - navigate faster
lando composer require drupal/coffee
lando drush en coffee -y

# Permissions filter - add a filter
lando composer require drupal/permissions_filter
lando drush en permissions_filter -y

# Login destination - customize the destination that a user is redirected to
lando composer require drupal/login_destination
lando drush en login_destination -y

# Redirect 403 to User Login
lando composer require drupal/r4032login
lando drush en r4032login -y


# Paragraphs
# ------------------------------------------------------

# Paragraphs - content creation
lando composer require drupal/paragraphs
lando drush en paragraphs -y

# Paragraphs Editor Enhancements - facilitate the editorial workflow
lando composer require paragraphs_ee
lando drush en paragraphs_ee -y

# Paragraphs Edit - adds contextual links to paragraphs (edit, delete and clone)
lando composer require drupal/paragraphs_edit
lando drush en en paragraphs_edit -y

# Views
# ------------------------------------------------------

# Views Bulk Operations - perform bulk operations on views
lando composer require drupal/views_bulk_operations
lando drush en drupal/views_bulk_operations -y

# Search
# ------------------------------------------------------

# Search API - search api
lando composer require drupal/search_api
lando drush en search_api -y

# Decoupled Modules
# ------------------------------------------------------

# JSON:API - drupal json api
lando drush en jsonapi -y

# Next - decouple your drupal sites with next.js
lando composer require drupal/next
lando drush en next -y
lando drush en next_jsonapi -y

# JSON:API Include - merge include and relationship data of json api
lando composer require drupal/jsonapi_include
lando drush en jsonapi_include -y

# JSON:API Menu Items - adds a json api resource for menu items
lando composer require drupal/jsonapi_menu_items
lando drush en jsonapi_menu_items -y

# JSON:API Image Styles - exposes image style urls to jsonapi export 
lando composer require drupal/jsonapi_image_styles
lando drush en jsonapi_image_styles -y

# REST UI - user interface for configuring REST module
lando composer require drupal/restui
lando drush en restui -y

# Other Modules
# ------------------------------------------------------

# Pathauto - automatically generates url aliases
lando composer require drupal/pathauto
lando drush en pathauto -y

# Redirect - create manual redirects
lando composer require drupal/redirect
lando drush en redirect -y

# Symfony mailer - send mails
lando composer require drupal/symfony_mailer
lando drush en symfony_mailer -y

# Reroute Email
lando composer require drupal/reroute_email --no-interaction
lando drush en reroute_email -y

# Config ignore - ignore config
lando composer require drupal/config_ignore
lando drush en config_ignore -y

# Remove HTTP headers - remove http headers
lando composer require drupal/remove_http_headers
lando drush en remove_http_headers -y

# No current pass - makes the current password field optional
lando composer require drupal/nocurrent_pass
lando drush en nocurrent_pass -y

# Shield - protect your site with basic auth
lando composer require drupal/shield --no-interaction
lando drush drush en shield -y

# Devel - development module
lando composer require drupal/devel
lando drush en devel -y
