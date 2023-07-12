<?php
session_start();
include('../connect.php');

$userEmail = $_POST['email'];

$title = $_POST['title'];
$message = $_POST['message'];


$userId = $_SESSION['userId'];

$sql = "INSERT INTO notifications (user_email,title, message) VALUES (:userEmail,:title, :message)";

$stmt = $db->prepare($sql);

$stmt->bindParam(':userEmail', $userEmail);
$stmt->bindParam(':title', $title);
$stmt->bindParam(':message', $message);

if ($stmt->execute()) {
    echo "Notification sent successfully.";
} else {
    echo "Error: " . $stmt->errorInfo()[2];
}

$stmt->closeCursor();
?>
