<?php 
require 'db_connect.php'; 

// delete record
$delete = @$_POST["delete"];
if ($delete == "Delete"){
  $dfname = @$_POST["dfname"];
  $dlname = @$_POST["dlname"];
  $checkbox = @$_POST["checkbox"];
  // delete record
  foreach ($checkbox as $index){
    $sql = "delete from $tblname where fname='$dfname[$index]' and lname='$dlname[$index]'";
    $result=mysqli_query($conn, $sql);
  }

}
// show all contact information
$sql="select * from $tblname order by lname";
$result=mysqli_query($conn, $sql);
mysqli_close($conn);
?>

<html
<head>
<title>Delete</title>
</head>

<BODY>
<SCRIPT language=JavaScript type=text/javascript>

  <!-- function to check whether checkbox is selected -->
  function checkboxchecked(){
    element = document.getElementsByName("checkbox[]")
    
  for (var index=0; index< element.length; index++){
      if (element[index].checked == true)
        return true;
    }
  alert("Please select name to be deleted");
    return false;
  }
  
</SCRIPT>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<blockquote>
  <p>
  <h2>Delete Contact Information</h2>
  
   <form name="myform" method="post" action="delete.php" onSubmit="return checkboxchecked()">
     <table width="40%" border="0">
     <?php
      $index=0;
      while($row = mysqli_fetch_assoc($result)) {
        $lname = $row['lname'];
          $fname = $row['fname'];
        echo "<tr><td width=\"25\" valign=\"top\"><input type=\"checkbox\" name=\"checkbox[]\" value=\"$index\" />";
        echo "</td><td valign=\"bottom\"><h4><a href=\"detail.php?lname=$lname&fname=$fname\">$lname, $fname</a><h4></td></tr>";
        echo "<input type=\"hidden\" name=\"dfname[]\" value=\"$fname\" />";
        echo "<input type=\"hidden\" name=\"dlname[]\" value=\"$lname\" />";
        $index++;
      }
      
      echo "<tr><td width=\"25\" valign=\"top\">&nbsp;</td><td valign=\"bottom\"><input type=\"submit\" name=\"delete\"";
      echo "value=\"Delete\" />&nbsp;&nbsp;&nbsp;<input type=\"reset\" name=\"Submit2\" value=\"Clear\" /></td></tr>";
      
    ?>
  </table>  
   </form>
  
  <?php
    if (mysqli_num_rows($result)==0)
        echo "<h4>No data<h4>";
  ?>
  </p>
 
</blockquote>
</body>
</html>
