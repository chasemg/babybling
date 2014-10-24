<?php
// HTTP
define('HTTP_SERVER', 'http://bling.local/admin/');
define('HTTP_CATALOG', 'http://bling.local/');

// HTTPS
define('HTTPS_SERVER', 'http://bling.local/admin/');
define('HTTPS_CATALOG', 'http://bling.local/');

// DIR
define('DOC_ROOT', $_SERVER['DOCUMENT_ROOT']);
define('DIR_APPLICATION', DOC_ROOT . '/admin/');
define('DIR_SYSTEM', DOC_ROOT . '/system/');
define('DIR_DATABASE', DOC_ROOT . '/system/database/');
define('DIR_LANGUAGE', DOC_ROOT . '/admin/language/');
define('DIR_TEMPLATE', DOC_ROOT . '/admin/view/template/');
define('DIR_CONFIG', DOC_ROOT . '/system/config/');
define('DIR_IMAGE', DOC_ROOT . '/image/');
define('DIR_CACHE', DOC_ROOT . '/system/cache/');
define('DIR_DOWNLOAD', DOC_ROOT . '/download/');
define('DIR_LOGS', DOC_ROOT . '/system/logs/');
define('DIR_CATALOG', DOC_ROOT . '/catalog/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'wh@tAm3$$');
define('DB_DATABASE', 'bling');
define('DB_PREFIX', 'oc_');
?>