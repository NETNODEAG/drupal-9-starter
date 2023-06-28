<?php
use Symfony\Component\Dotenv\Dotenv;
(new Dotenv())->usePutenv()->bootEnv(DRUPAL_ROOT . '/../.env', 'dev', ['test'], true);


$settings['container_yamls'][] = DRUPAL_ROOT . '/sites/development.services.yml';

/**
 * Include the common settings.
 */
if (file_exists(__DIR__ . '/settings.common.php')) {
  include __DIR__ . '/settings.common.php';
}


$settings['hash_salt'] = "Change_it";
/**
 * Disable Drupal cache for development.
 */
$config['system.performance']['css']['preprocess'] = FALSE;
$config['system.performance']['js']['preprocess'] = FALSE;
$config['system.performance']['css']['gzip'] = FALSE;
$config['system.performance']['js']['gzip'] = FALSE;
$config['system.performance']['response']['gzip'] = FALSE;
$config['system.performance']['cache']['page']['max_age'] = 0;
$config['system.file']['path']['temporary'] = '/tmp';
$config['system.cron']['threshold']['autorun'] = 0;

$settings['cache']['bins']['render'] = 'cache.backend.null';
$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';
$settings['cache']['bins']['page'] = 'cache.backend.null';

$settings['container_yamls'][] = __DIR__ . '/local.services.yml';

/**
 * Show all error messages, with backtrace information.
 *
 * In case the error level could not be fetched from the database, as for
 * example the database connection failed, we rely only on this value.
 */
error_reporting(E_ALL);
ini_set('display_errors', 'On');
$config['system.logging']['error_level'] = 'verbose';

/**
 * Database settings
 */
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
  'autoload' => 'core/modules/mysql/src/Driver/Database/mysql/',
);


/**
 * Reroute email settings
 */
$config['reroute_email.settings']['enable'] = 1;
$config['reroute_email.settings']['address'] = '';

if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {
  include $app_root . '/' . $site_path . '/settings.local.php';
}
