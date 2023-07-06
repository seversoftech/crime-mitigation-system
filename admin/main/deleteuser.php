<?php
	include('../connect.php');
	$id=$_GET['id'];
	$result = $db->prepare("DELETE FROM  users WHERE id= :memid");
	$result->bindParam(':memid', $id);
	$result->execute();
	
	header ("location: users.php");
?>