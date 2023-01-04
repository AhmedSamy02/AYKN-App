<?php

include "../connection/connect.php";

$id = fun("course_id");
$stmt2 = $con->prepare("DELETE FROM `course` WHERE `course_id`= ? "); 
$stmt2->execute(array($id)) ; ;

$count = $stmt2->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success")) ; 
}
?>