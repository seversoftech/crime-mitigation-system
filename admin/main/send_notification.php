<?php
session_start();
include('../connect.php');

$userEmail = $_POST['email'];
$userId = $_POST['id'];
$title = $_POST['title'];
$message = $_POST['message'];

$sql = "INSERT INTO notifications (user_email, user_id, title, message) VALUES (:userEmail, :userId, :title, :message)";

$stmt = $db->prepare($sql);

$stmt->bindParam(':userEmail', $userEmail);
$stmt->bindParam(':userId', $userId);
$stmt->bindParam(':title', $title);
$stmt->bindParam(':message', $message);

if ($stmt->execute()) {
    echo "Notification sent successfully.";
} else {
    echo "Error: " . $stmt->errorInfo()[2];
}

$stmt->closeCursor();
?>
