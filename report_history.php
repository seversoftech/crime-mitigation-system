<?php
require_once 'config.php';

if (isset($_GET['user_email'])) {
    $user_email = $_GET['user_email'];

    $query = "SELECT incident, description, date, location,severity FROM reports WHERE user_email = '$user_email'";

    $result = mysqli_query($connection, $query);

    if ($result) {
        $reportData = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $reportData[] = $row;
            }
            mysqli_free_result($result);
            mysqli_close($connection);

            echo json_encode($reportData);
        } else {
            echo "No reports found for the provided user email.";
        }
    } else {
        echo "Error executing query: " . mysqli_error($connection);
    }
} else {
    echo "No 'user_email' parameter provided in the URL.";
}
