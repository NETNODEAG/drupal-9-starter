<?php

// settings.demo.php

$databases = [];

$settings['hash_salt'] = 'll0BgAjnZehU07D_HHnY-BDkhQMYPNco1YVtm64V3cGyu5S4RE7l6H-0j9HwXDWsE8UkcAU6hQ';

$settings['update_free_access'] = FALSE;

$settings['container_yamls'][] = $app_root . '/' . $site_path . '/services.yml';

$settings['file_scan_ignore_directories'] = [
  'node_modules',
  'bower_components',
];

$settings['entity_update_batch_size'] = 50;

$settings['entity_update_backup'] = TRUE;

$settings['migrate_node_migrate_type_classic'] = FALSE;

$databases['default']['default'] = array (
  'database' => 'sites/example.com/files/.ht.sqlite',
  'prefix' => '',
  'namespace' => 'Drupal\\sqlite\\Driver\\Database\\sqlite',
  'driver' => 'sqlite',
  'autoload' => 'core/modules/sqlite/src/Driver/Database/sqlite/',
);
$settings['config_sync_directory'] = '../config/sync';
