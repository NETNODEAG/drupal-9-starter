<?php

use Symfony\Component\Dotenv\Dotenv;
(new Dotenv())->usePutenv()->bootEnv(DRUPAL_ROOT . '/../.env', 'dev', ['test'], true);

# Info:
# This settings file is linked to /nn/prod/settings.prod.php and is part of the git repo

// Trusted Host
$settings['trusted_host_patterns'] = array(
  '^www\.example\.ch$',
  '^example\.ch$',
);

// Config dir
$config_directories['sync'] = '../config/sync';
$settings['config_sync_directory'] = '../config/sync';

$databases['default']['default'] = array (
  'database' => $_ENV['DB_DATABASE'],
  'username' => $_ENV['DB_USERNAME'],
  'password' => $_ENV['DB_PASSWORD'],
  'prefix' => '',
  'host' => $_ENV['DB_HOST'],
  'port' => $_ENV['DB_PORT'],
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
  'init_commands' => [
    'isolation_level' => 'SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED',
  ],
);

// Salt
$settings['hash_salt'] = 'SET_HASH_PLEASE';

/**
 * Reroute email settings
 */
$config['reroute_email.settings']['enable'] = 0;
$config['reroute_email.settings']['address'] = '';

$settings['file_scan_ignore_directories'] = [
  'node_modules',
  'bower_components',
];

$settings['container_yamls'][] = $app_root . '/' . $site_path . '/services.yml';
$settings['update_free_access'] = FALSE;

$settings['entity_update_batch_size'] = 50;
$settings['entity_update_backup'] = TRUE;
$settings['migrate_node_migrate_type_classic'] = FALSE;
