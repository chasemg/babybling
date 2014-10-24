<?php
// HTTP
define('HTTP_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/');

// HTTPS
define('HTTPS_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/');

// DIR
define('DOC_ROOT', $_SERVER['DOCUMENT_ROOT']);
define('DIR_APPLICATION',DOC_ROOT . '/catalog/');
define('DIR_SYSTEM',DOC_ROOT . '/system/');
define('DIR_DATABASE',DOC_ROOT . '/system/database/');
define('DIR_LANGUAGE',DOC_ROOT . '/catalog/language/');
define('DIR_TEMPLATE',DOC_ROOT . '/catalog/view/theme/');
define('DIR_CONFIG',DOC_ROOT . '/system/config/');
define('DIR_IMAGE',DOC_ROOT . '/image/');
define('DIR_CACHE',DOC_ROOT . '/system/cache/');
define('DIR_DOWNLOAD',DOC_ROOT . '/download/');
define('DIR_LOGS',DOC_ROOT . '/system/logs/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'wh@tAm3$$');
define('DB_DATABASE', 'bling');
define('DB_PREFIX', 'oc_');
?>