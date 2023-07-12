<?php

include('../connect.php');

$id = $_POST['id'];
$a = $_POST['fullname'];
$b = $_POST['email'];
$c = $_POST['phone'];
$d = $_POST['address'];


$a = filter_var($a, FILTER_SANITIZE_STRING);
$b = filter_var($b, FILTER_VALIDATE_EMAIL);
$c = filter_var($c, FILTER_SANITIZE_STRING);
$d = filter_var($d, FILTER_SANITIZE_STRING);

// Check if email is valid
if ($b === false) {

    header("Location: edit_user.php?id=$id&error=invalid_email");
    exit;
}


$sql = "UPDATE users 
        SET fullname=?, email=?, phone=?, address=? 
        WHERE id=?";
$q = $db->prepare($sql);


$q->bindValue(1, $a, PDO::PARAM_STR);
$q->bindValue(2, $b, PDO::PARAM_STR);
$q->bindValue(3, $c, PDO::PARAM_STR);
$q->bindValue(4, $d, PDO::PARAM_STR);
$q->bindValue(5, $id, PDO::PARAM_INT);

$result = $q->execute();

if ($result) {
    
    header("Location: users.php");
    exit;
} else {
    
    header("Location: edit_user.php?id=$id&error=update_failed");
    exit;
}

