<?php


include_once 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

$email = $_POST['email'];
$password = $_POST['password'];

if (empty($email) || empty($password)) {
    $response['success'] = false;
    $response['message'] = 'email and password are required.';
    echo json_encode($response);
    exit;
}


$escapedemail = mysqli_real_escape_string($connection, $email);


$query = "SELECT * FROM users WHERE email = '$escapedemail' limit 1";



$result = mysqli_query($connection, $query);

if (mysqli_num_rows($result) == 1) {
    $user = mysqli_fetch_assoc($result);
    $hashedPassword = $user['password'];
    $token = bin2hex(random_bytes(32));
    

    $updateQuery = "UPDATE users SET token = '$token' WHERE id = {$user['id']}";
    mysqli_query($connection, $updateQuery);

   
    if (password_verify($password, $hashedPassword)) {
        $response['success'] = true;
        $response['message'] = 'Login successful.';
        $response['token'] = $token;
        echo json_encode("Success");
    } else {
        $response['success'] = false;
        $response['message'] = 'Invalid email or password.';
        echo json_encode("Error");
    }
} else {
    $response['success'] = false;
    $response['message'] = 'Invalid email or password.';
    echo json_encode($response);
}
} else {
    echo 'Authentication Failed';
}
// Close the database connection
// mysqli_close($connection);
