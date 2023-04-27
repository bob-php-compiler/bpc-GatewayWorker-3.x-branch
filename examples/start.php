<?php
/**
 * run with command
 * php start.php start
 */

ini_set('display_errors', 'on');
use Workerman\Worker;

// 标记是全局启动
define('GLOBAL_START', 1);

require_once __DIR__ . '/autoload.inc';

// 加载所有Applications/*/start.php，以便启动所有服务
require_once __DIR__ . '/Applications/YourApp/start_register.php';
require_once __DIR__ . '/Applications/YourApp/start_gateway.php';
require_once __DIR__ . '/Applications/YourApp/start_businessworker.php';

// 运行所有服务
Worker::runAll();
