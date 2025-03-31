<html>
<body>
    <?php
    if (isset($_GET["name"]) && isset($_GET["email"])) {
        $name = htmlspecialchars($_GET["name"]);
        $email = htmlspecialchars($_GET["email"]);
        echo "Welcome, $name!<br>";
        echo "Your email address is: $email";
    } else {
        echo "No data received.";
    }
    ?>
</body>
</html>
