<?php 
// Database connection credentials
$servername = "localhost"; // Change from "root" to "localhost"
$username = "root"; // Default XAMPP MySQL username
$password = ""; // Default XAMPP MySQL password (empty)
$dbname = "okeke_conf"; // Ensure this matches your database name
$tblname = "contacts"; // Table name

// Connect to MySQL and select the database
$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
} else {
    // echo "Successfully Connected";
}
?>
