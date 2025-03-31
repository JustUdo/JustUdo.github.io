<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>

        <?php
        if (isset($_POST['submit'])) {
            // Initialize an array to store missing data fields
            $data_missing = array();

            // Checking for missing member ID
            if (empty($_POST['memberID'])) {
                $data_missing[] = 'Member ID';
            } else {
                $memberID = trim($_POST['memberID']);
            }

            // Checking for missing first name
            if (empty($_POST['fName'])) {
                $data_missing[] = 'First Name';
            } else {
                $fName = trim($_POST['fName']);
            }

            // Checking for missing last name
            if (empty($_POST['lName'])) {
                $data_missing[] = 'Last Name';
            } else {
                $lName = trim($_POST['lName']);
            }

            // Checking for missing email
            if (empty($_POST['email'])) {
                $data_missing[] = 'Email';
            } else {
                $email = trim($_POST['email']);
            }

            // Checking for missing credit card number
            if (empty($_POST['creditCardNo'])) {
                $data_missing[] = 'Credit Card Number';
            } else {
                $creditCardNo = trim($_POST['creditCardNo']);
            }

            // Checking for missing password
            if (empty($_POST['password'])) {
                $data_missing[] = 'Password';
            } else {
                $password = trim($_POST['password']);
            }

            // If no missing data, proceed to insert into the database
            if (empty($data_missing)) {
                require_once('mysqli_connect.php');
                
                // Hashing the password before storing it in the database for security
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

                // Insert query
                $query = "INSERT INTO Accounts (memberID, fName, lName, email, creditCardNo, password) 
                          VALUES (?, ?, ?, ?, ?, ?)";
                $stmt = mysqli_prepare($dbc, $query);

                // Bind the parameters to the SQL query
                mysqli_stmt_bind_param($stmt, "ssssss", $memberID, $fName, $lName, $email, $creditCardNo, $hashedPassword);

                // Execute the query
                mysqli_stmt_execute($stmt);
                $affectedRows = mysqli_stmt_affected_rows($stmt);

                // Check if the insertion was successful
                if ($affectedRows == 1) {
                    echo 'Customer Entered!<br>';
                    echo 'Added a new Customer: ' . htmlspecialchars($fName) . ' ' . htmlspecialchars($lName);
                    mysqli_stmt_close($stmt);
                    mysqli_close($dbc);
                } else {
                    echo 'Error Occurred <br/>';
                    echo mysqli_error($dbc);
                    mysqli_stmt_close($stmt);
                    mysqli_close($dbc);
                }
            } else {
                // Display missing fields
                echo 'You need to enter the following data: <br />';
                foreach ($data_missing as $missing) {
                    echo "$missing<br />";
                }
            }
        }
        ?>
