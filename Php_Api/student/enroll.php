
<?php

include "../connection/connect.php";

$std_id = fun("std_id");
$course_id = fun("course_id");

$stmt = $con->prepare("INSERT INTO `enrollrequest` VALUES ('0', 0, ?, ?, NULL) ");
$stmt->execute(array($course_id,$std_id));
$data = $stmt->fetchAll();

$count = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 

?>