
<?php

include "../connection/connect.php";

$id     = fun("inst_id");

$stmt5 = $con->prepare("SELECT `course_name`, `hall_id`FROM `course` WHERE inst_id = ? "); 
$stmt5->execute(array( $id )) ;
$data5 = $stmt5->fetchall(PDO::FETCH_ASSOC) ;
$count4 = $stmt5->rowCount() ; 
if ($count4 > 0) {
    echo json_encode(array("status" => "success" , "data" => $data5)) ; 
}
?>