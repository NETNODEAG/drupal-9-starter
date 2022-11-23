# Modules for development
# ------------------------------------------------------

composer require drupal/reroute_email --no-interaction 
vendor/drush/drush/vendor/drush/drush/drush en reroute_email -y

composer require drupal/shield --no-interaction 
vendor/drush/drush/vendor/drush/drush/drush en shield -y

composer require drupal/devel
vendor/drush/drush/drush en devel -y

composer require drupal/config_ignore
vendor/drush/drush/drush en config_ignore -y


# Login and Logout
# ------------------------------------------------------

composer require drupal/login_destination
vendor/drush/drush/drush en login_destination -y

composer require drupal/gin_login
vendor/drush/drush/drush en gin_login -y


# SEO
# ------------------------------------------------------
composer require drupal/google_analytics
vendor/drush/drush/drush en google_analytics -y

composer require drupal/google_tag
vendor/drush/drush/drush en google_tag -y

composer require drupal/simple_sitemap
vendor/drush/drush/drush en simple_sitemap -y

composer require drupal/metatag
vendor/drush/drush/drush en metatag -y

composer require drupal/responsive_favicons
vendor/drush/drush/drush en responsive_favicons -y

# Improvements of Drupal UX
# ------------------------------------------------------

composer require drupal/admin_toolbar
vendor/drush/drush/drush en admin_toolbar -y

composer require drupal/permissions_filter
vendor/drush/drush/drush en permissions_filter -y

composer require drupal/views_bulk_operations
vendor/drush/drush/drush en views_bulk_operations -y

composer require drupal/geysir
vendor/drush/drush/drush en geysir -y

composer require drupal/coffee
vendor/drush/drush/drush en coffee -y

composer require drupal/gin
vendor/drush/drush/drush en gin -y

composer require drupal/gin_toolbar
vendor/drush/drush/drush en gin_toolbar -y

# Related to Drupal Maintenance
# ------------------------------------------------------

composer require drupal/drupalmonitor
vendor/drush/drush/drush en drupalmonitor -y


# Twig Improvements
# ------------------------------------------------------

composer require drupal/twig_tweak
vendor/drush/drush/drush en twig_tweak -y


# Content Control
# ------------------------------------------------------

composer require drupal/rabbit_hole
vendor/drush/drush/drush en rabbit_hole -y


# Content Management and Organisation
# ------------------------------------------------------

composer require drupal/content_planner
vendor/drush/drush/drush en content_planner -y


# Layout Builder
# ------------------------------------------------------

# Layout Builder is part of Drupal Core already.
vendor/drush/drush/drush en layout_builder -y

composer require drupal/layout_builder_modal
vendor/drush/drush/drush en layout_builder_modal -y


# Content Selection
# ------------------------------------------------------

composer require drupal/entity_browser
vendor/drush/drush/drush en entity_browser -y

composer require drupal/entity_browser_block
vendor/drush/drush/drush en entity_browser_block -y


# Security related Modules
# ------------------------------------------------------
composer require drupal/honeypot
vendor/drush/drush/drush en honeypot -y

# See https://www.ostraining.com/blog/drupal/control-spam-in-drupal-with-honeypot-and-or-antibot
composer require drupal/antibot
vendor/drush/drush/drush en antibot -y

# Optional: https://www.drupal.org/project/email_tfa
composer require drupal/email_tfa
vendor/drush/drush/drush en email_tfa -y

composer require drupal/remove_http_headers
vendor/drush/drush/drush en remove_http_headers -y


# Improvements to Menus
# ------------------------------------------------------

composer require drupal/menu_link_attributes
vendor/drush/drush/drush en menu_link_attributes -y


# Modules related to Search
# ------------------------------------------------------

composer require drupal/search_api
vendor/drush/drush/drush en search_api -y


# Modules we typically use
# ------------------------------------------------------
composer require drupal/nocurrent_pass
vendor/drush/drush/drush en nocurrent_pass -y

composer require drupal/token
vendor/drush/drush/drush en token -y

composer require drupal/redirect
vendor/drush/drush/drush en redirect -y

composer require drupal/paragraphs_ee 
vendor/drush/drush/drush en paragraphs_ee -y

composer require drupal/webform
vendor/drush/drush/drush en webform -y
vendor/drush/drush/drush en webform_ui -y

composer require drupal/redirect_404
vendor/drush/drush/drush en redirect_404 -y

composer require drupal/quicklink
vendor/drush/drush/drush en quicklink -y

composer require drupal/views_ajax_history
vendor/drush/drush/drush en views_ajax_history -y

composer require 'drupal/webp:^1.0@beta'
vendor/drush/drush/drush en webp -y