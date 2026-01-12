<?php
declare(strict_types=1);

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

// Project root directory
define('BASE_PATH', dirname(__DIR__));

// Load DB config
define("CONFIG", require(BASE_PATH . '/config/database.php'));

require_once __DIR__ . '/../vendor/autoload.php';

session_start();

use Poussinade\Controller\FrontController;

$frontController = new FrontController();
$frontController->handleRequest();
