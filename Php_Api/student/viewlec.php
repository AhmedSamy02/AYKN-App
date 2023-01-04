<?php
include "../connection/connect.php";

$course_id = fun("course_id");

$stmt = $con->prepare("SELECT lec_name , lec_count , lec_date
From lecture 
WHERE course_id = ? ");

$stmt->execute(array($course_id));
$data = $stmt->fetchall(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0)
    echo json_encode(array("status" => "success", "data" => $data));

?>