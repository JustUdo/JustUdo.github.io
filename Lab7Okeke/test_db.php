<?php
include('mysqli_connect.php');

if ($dbc) {
    echo "Database connected successfully!";
} else {
    echo "Database connection failed: " . mysqli_connect_error();
}
?>
