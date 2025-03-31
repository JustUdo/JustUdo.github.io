<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Customer</title>
    </head>
    <body>                    
        <p><a href="index.php">Home</a></p>
        <br />
        <form action="accountAdded.php" method="POST">
            <b>Add a New Customer</b>
            <p>Member ID: <input type="text" name="memberID" size="10" /></p>
            <p>Customer First Name: <input type="text" name="fName" size="20" /></p>
            <p>Customer Last Name: <input type="text" name="lName" size="20" /></p>
            <p>Email Address: <input type="email" name="email" size="25" /></p>
            <p>Credit Card No: <input type="text" name="creditCardNo" size="20" /></p>
            <p>Password: <input type="password" name="password" size="20" /></p>
            <p><input type="submit" name="submit" value="Send" /></p>
        </form>
    </body>
</html>
