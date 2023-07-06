<?php
require_once 'session.php';

$incident = $_POST['incident'];
$date = $_POST['date'];
$severity = $_POST['severity'];
$location = $_POST['location'];
$description = $_POST['description'];
$image = $_POST['image'];
$user_email = $_POST['user_email'];


if (empty($incident) || empty($date)|| empty($severity)|| empty($location)|| empty($description)|| empty($image)|| empty($user_email)) {
    $response['success'] = false;
    $response['message'] = 'All fields are required.';
    echo json_encode($response);
    exit;
}


$sql = "INSERT INTO reports (incident, date, severity, location, description, image,user_email)
        VALUES ('$incident', '$date', '$severity', '$location', '$description', '$image','$user_email')";

 

if ($connection->query($sql) === TRUE) {
    echo json_encode("Success") ;
} else {
    echo 'Error saving fields: ' . $connection->error;
}

// Close the database connection
$connection->close();
return;
?>
