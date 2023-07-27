<?php
session_start();
include('../connect.php');

$a = $_POST['fullname'];
$b = $_POST['email'];
$c = $_POST['phone'];
$d = $_POST['address'];
$e = password_hash($_POST['password'], PASSWORD_DEFAULT);


$checkEmailQuery = "SELECT COUNT(*) as count FROM users WHERE email = :email";
$checkEmailStmt = $db->prepare($checkEmailQuery);
$checkEmailStmt->execute(array(':email' => $b));
$emailResult = $checkEmailStmt->fetch(PDO::FETCH_ASSOC);


$checkPhoneQuery = "SELECT COUNT(*) as count FROM users WHERE phone = :phone";
$checkPhoneStmt = $db->prepare($checkPhoneQuery);
$checkPhoneStmt->execute(array(':phone' => $c));
$phoneResult = $checkPhoneStmt->fetch(PDO::FETCH_ASSOC);

if ($emailResult['count'] > 0) {

    echo "Error: This email is already registered.";
    exit;
}

if ($phoneResult['count'] > 0) {

    echo "Error: This phone number is already registered.";
    exit;
}


$sql = "INSERT INTO users (fullname, email, phone, address, password) VALUES (:a, :b, :c, :d, :e)";
$q = $db->prepare($sql);
$q->execute(array(':a' => $a, ':b' => $b, ':c' => $c, ':d' => $d, ':e' => $e));
header("location: users.php");
?>
