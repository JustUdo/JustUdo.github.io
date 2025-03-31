<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

DEFINE('DB_USER', 'root');
DEFINE('DB_PASSWORD', '');  // Leave empty default
DEFINE('DB_HOST', 'localhost');
DEFINE('DB_NAME', 'lab4');

$dbc = @mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)  
    or die('Could not connect to MySQL: ' . mysqli_connect_error());
?>
;[]