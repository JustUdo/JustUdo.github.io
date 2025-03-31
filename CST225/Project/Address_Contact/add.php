<?php 
require 'db_connect.php';
// retrieve all variables
$fname = @$_POST["fname"];
$lname = @$_POST["lname"];
$email = @$_POST["email"];
$homePhone = @$_POST["homePhone"];
$cellPhone = @$_POST["cellPhone"];
$officePhone = @$_POST["officePhone"];
$address = @$_POST["address"];
$comment = @$_POST["comment"];

// insert information to database
$sql="insert into $tblname values('$lname','$fname','$email','$homePhone','$cellPhone','$officePhone','$address','$comment')";
$result=mysqli_query($conn, $sql);
mysqli_close($conn);
?>
<html>
<head>
<title>Add processed</title>
<BODY>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<blockquote>
  <p>
  <h3>Your information is added to database. </h3>
  <body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
