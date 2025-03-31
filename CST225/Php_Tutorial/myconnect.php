<?php
// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "php_database"; // Database name

// Create connection
$DBConnect = mysqli_connect($servername, $username, $password);

// Check connection
if (!$DBConnect) {
    die("<p>Connection failed: " . mysqli_connect_error() . "</p>");
}
echo "<p>Successfully connected to the database server.</p>";

// Select database
if (!mysqli_select_db($DBConnect, $dbname)) {
    die("<p>Database selection failed: " . mysqli_error($DBConnect) . "</p>");
}
echo "<p>Successfully opened the database.</p>";

// Close connection
mysqli_close($DBConnect);
?>
