<?php

	require('config.php');

	

	$fullname = $_POST['fullname'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$address = $_POST['address'];
    $password = $_POST['password'];


    
if (empty($fullname) || empty($email)|| empty($phone)|| empty($address)|| empty($password)) {
    $response['success'] = false;
    $response['message'] = 'All fields are required.';
    echo json_encode($response);
    exit;
}

$escapedFullname = mysqli_real_escape_string($connection, $fullname);
$escapedEmail = mysqli_real_escape_string($connection, $email);
$escapedPhone = mysqli_real_escape_string($connection, $phone);
$escapedAddress = mysqli_real_escape_string($connection, $address);
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);


// $query = "SELECT * FROM users WHERE email = '$email'";
$query = "SELECT * FROM users WHERE email = '$email' || phone = '$phone'";
$result = mysqli_query($connection, $query);

$count = mysqli_num_rows($result);

    if ($count > 0){
        echo json_encode("Error");
    } else {
         $insert = $connection->query("INSERT INTO users (fullname,email,phone,address,password)VALUES('$escapedFullname','$escapedEmail','$escapedPhone','$escapedAddress','$hashedPassword')");
	if ($insert){
		echo json_encode("Success") ;
	}
}


	$connection->close();
	return;
?> 