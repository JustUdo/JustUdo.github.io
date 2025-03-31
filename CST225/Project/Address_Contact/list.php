<?php 
require 'db_connect.php';
// show all contact information
$sql="select * from $tblname order by lname";
$result=mysqli_query($conn, $sql);
mysqli_close($conn);
?>

<html>
<head>
<title>List</title>
</head>

<BODY>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<blockquote>
  <p>
  <h2>All  Contact Information</h2>
   <?php
       if (mysqli_num_rows($result)==0){
      echo "<h4>No data<h4>"; 
    } else {
         while($row = mysqli_fetch_assoc($result)) {
        $lname = $row['lname'];
          $fname = $row['fname'];
        echo "<ul><li><h4><a href=\"detail.php?lname=$lname&fname=$fname\">$lname, $fname</a><h4></li></ul>";
      }
    }
     
  ?>
  
</blockquote>
</body>
</html>
