<?php

spl_autoload_register(function ($class) {
    if (defined('__BPC__')) {
        include_silent(str_replace('\\', '/', $class) . '.php');
    } else {
        if ($class[0] == '\\') {
            $class = substr($class, 1);
        }
        if (strncmp($class, 'Workerman\\', 10) == 0) {
            $file = __DIR__ . '/../../bpc-workerman-4.1-branch/' . str_replace('\\', '/', substr($class, 10)) . '.php';
            if (file_exists($file)) {
                require $file;
            }
        } elseif (strncmp($class, 'GatewayWorker\\', 14) == 0) {
            $file = __DIR__ . '/../src/' . str_replace('\\', '/', substr($class, 14)) . '.php';
            if (file_exists($file)) {
                require $file;
            }
        }
    }
});
