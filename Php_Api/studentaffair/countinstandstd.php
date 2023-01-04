<?php

include "../connection/connect.php";

$stmt2 = $con->prepare("SELECT
(SELECT COUNT(*) FROM instructor) as instCount,
(SELECT COUNT(*) FROM student ) as stdCount"); 
$stmt2->execute() ; 
$data1= $stmt2->fetchall(PDO::FETCH_ASSOC) ; 
$count = $stmt2->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success","data" => $data1)) ; 
}
?>