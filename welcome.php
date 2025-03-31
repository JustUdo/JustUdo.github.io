<?php
// Include session management
require_once('session.php');
?>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>

    <h1>Welcome, <?php echo $_SESSION['memberID']; ?>!</h1>

    <p><a href="getAccount.php">View Account</a></p>
    <p><a href="updateProfile.php">Update Profile</a></p>
    <p><a href="deleteProfile.php">Delete Profile</a></p>
    <p><a href="newProfile.php">Add Profile</a></p>
    <p><a href="logout.php">Logout</a></p>

</body>
</html>
