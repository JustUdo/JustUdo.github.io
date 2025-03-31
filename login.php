<?php
session_start();
include('mysqli_connect.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $memberID = $_POST['memberID'];
    $password = $_POST['password'];

    $query = "SELECT password FROM Accounts WHERE memberID=?";
    $stmt = mysqli_prepare($dbc, $query);
    mysqli_stmt_bind_param($stmt, "s", $memberID);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt, $hashed_password);
    mysqli_stmt_fetch($stmt);

    if (password_verify($password, $hashed_password)) {
        $_SESSION['memberID'] = $memberID;
        header("Location: welcome.php");
    } else {
        echo "<h2>Invalid login credentials.</h2>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="login.php" method="POST">
        Member ID: <input type="text" name="memberID" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
