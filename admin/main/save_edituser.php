<?php
// configuration
include('../connect.php');



$id = $_POST['id'];
$a = $_POST['fullname'];
$b = $_POST['email'];
$c = $_POST['phone'];
$d = $_POST['address'];


$sql = "UPDATE users 
        SET fullname=?, email=?, phone=?, address=? 
        WHERE id=?";
$q = $db->prepare($sql);
$q->execute(array($a, $b, $c, $d, $id)); // Fix: Add $id to the array of values
header("location: users.php");
