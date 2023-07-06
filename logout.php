<?php

require_once 'session.php';  


$token = $_POST['token'];


$updateQuery = "UPDATE users SET token = NULL WHERE token = '$token'";
mysqli_query($connection, $updateQuery);

$response["success"] = true;
$response["message"] = "Logout successful.";


echo json_encode($response);
?>
