<?php
session_start();
if (!isset($_SESSION['memberID'])) {
    header("Location: login.php");
    exit();
}
?>
