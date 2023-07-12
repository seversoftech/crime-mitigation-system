<?php
    include('../connect.php');
    $id = $_GET['id'];


    if (!is_numeric($id)) {
        echo "Invalid ID parameter.";
        exit;
    }


    $statement = $db->prepare("DELETE FROM reports WHERE id = :memid");
    $statement->bindParam(':memid', $id, PDO::PARAM_INT);

  
    if ($statement->execute()) {
        header("location: users.php");
        exit;
    } else {
        echo "Error deleting the report.";
        exit;
    }
?>
