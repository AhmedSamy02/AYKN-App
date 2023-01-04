<?php

include "../connection/connect.php";

$stmt2 = $con->prepare("SELECT COUNT(*),course_id as p ,(SELECT course_name FROM course WHERE course_id=p )FROM exam GROUP BY course_id;
"); 
$stmt2->execute() ; 
$data1= $stmt2->fetchall(PDO::FETCH_ASSOC) ; 
$count = $stmt2->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success","data" => $data1)) ; 
}
?>