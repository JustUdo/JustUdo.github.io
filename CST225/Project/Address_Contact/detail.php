<?php 
require 'db_connect.php';

// retrieve all variables
$fname = @$_GET["fname"];
$lname = @$_GET["lname"];

// show all contact information
$sql="select * from $tblname where fname='$fname' and lname='$lname'";
$result=mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result); 
mysqli_close($conn);
?>

<html>
<head>
<title>Detail</title>
</head>

<BODY>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<blockquote> 
    <table width="60%" border="0" cellpadding="5" cellspacing="15">
	<tr>
		<td colspan="2"><p><h2><?php echo "$lname, $fname"; ?></h2></td>
	  </tr>
    <tr>
      <td width="130">First Name :</td>
      <td><?php echo $row['fname']; ?></td>
    </tr>
    <tr>
      <td width="130">Last Name :</td>
      <td><?php echo $row['lname']; ?></td>
    </tr>
    <tr>
      <td width="130">E-mail Address :</td>
      <td><?php echo $row['email']; ?></td>
    </tr>
    <tr>
      <td width="130"><p>Home Phone :<br />
      </p>        </td>
      <td><?php echo $row['homePhone']; ?></td>
    </tr>
    <tr>
      <td width="130">Cell Phone :</td>
      <td><?php echo $row['cellPhone']; ?></td>
    </tr>
    <tr>
      <td width="130">Office Phone :</td>
      <td><?php echo $row['officePhone']; ?></td>
    </tr>
    <tr valign="top">
      <td width="130">Address :</td>
      <td><?php echo $row['address']; ?></td>
    </tr>
    <tr valign="top">
      <td width="130">Comment :</td>
      <td><?php echo $row['comment']; ?></td>
    </tr>
  </table>
   </p>
</blockquote>
</body>
</html>
