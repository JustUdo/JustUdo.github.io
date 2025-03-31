<html>
<body>
    <?php
    require 'myconnect.php';

    // Sanitize user input to prevent SQL injection
    $name = mysqli_real_escape_string($DBConnect, $_POST['name']);
    $email = mysqli_real_escape_string($DBConnect, $_POST['email']);

    // Insert information into the database
    $sql = "INSERT INTO mycontact (name, email) VALUES ('$name', '$email')";

    if (!mysqli_query($DBConnect, $sql)) {
        die("<p>Error: " . mysqli_error($DBConnect) . "</p>");
    }

    echo "<p>Your information has been added to the database.</p>";

    // Close database connection
    mysqli_close($DBConnect);
    ?>
</body>
</html>
