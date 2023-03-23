<?php

#use Symfony\Component\Dotenv\Dotenv;
#(new Dotenv())->usePutenv()->bootEnv(DRUPAL_ROOT . '/../.env', 'dev', ['test'], true);

# Info:
# This settings file is linked to /nn/prod/settings.prod.php and is part of the git repo

// Trusted Host
$settings['trusted_host_patterns'] = array(
  '^.+\.docker1\.netnode\.cloud$',
  '^.+\.docker2\.netnode\.cloud$',
  '^.+\.docker3\.netnode\.cloud$',
  '^.+\.docker4\.netnode\.cloud$',
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
);

#$settings['redis.connection']['host'] = '127.0.0.1';
#$settings['redis.connection']['interface'] = 'Predis';
#$settings['redis.connection']['port'] = '6379';
#$settings['cache']['default'] = 'cache.backend.redis';
#$settings['container_yamls'][] = 'sites/default/redis.services.yml';

// Salt
$settings['hash_salt'] = '912ec803912ec803b2ce49e4a541068d495ab5803b2ce49e4a541068d495ab57049e4a541068d495ab570';

// Environment indicator settings
$config['environment_indicator.indicator']['bg_color'] = '#2f85be';
$config['environment_indicator.indicator']['fg_color'] = '#FFFFFF';
$config['environment_indicator.indicator']['name'] = 'DXP [prod]';

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
