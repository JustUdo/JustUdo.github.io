<?php 
require 'db_connect.php';

// retrieve all variables
$keyword = @$_POST["keyword"];
$searchin = @$_POST["searchin"];

// execute query
$sql="select * from $tblname";
$result=mysqli_query($conn, $sql);
mysqli_close($conn);

?>

<html>
<head>
<title>Results</title>
</head>

<BODY>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<blockquote>
  <p>
  <h2>Result</h2>
   <?php
       $i =0;
    while($row = mysqli_fetch_assoc($result)) {
      $lname = $row['lname'];
        $fname = $row['fname'];
      
      if ($searchin == "both"){
        // search in last name & first name
        if ((preg_match("/$keyword/i",$fname))||(preg_match('/$keyword/',$lname))){
          echo "<ul><li><h4><a href=\"detail.php?lname=$lname&fname=$fname\">$lname, $fname</a><h4></li></ul>";
          $i++;
        }
      } else if($searchin == "fname"){
        // seach in first name
        if (preg_match("/$keyword/i",$fname)){
            echo "<ul><li><h4><a href=\"detail.php?lname=$lname&fname=$fname\">$lname, $fname</a><h4></li></ul>";
            $i++;
        }
      } else{
        // search in last name
        if (preg_match("/$keyword/i",$lname)){
            echo "<ul><li><h4><a href=\"detail.php?lname=$lname&fname=$fname\">$lname, $fname</a><h4></li></ul>";
            $i++;
        }        
      }
    }
    
    if ($i == 0)
      echo "<ul><h4>No match result.<h4></ul>";
     
  ?>
  
</blockquote>
</body>
</html>
