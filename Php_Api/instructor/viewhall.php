<?php

include "../connection/connect.php";

$id     = fun("inst_id");
$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `hall_id` FROM `course` WHERE course_name = ? "); 

$stmt1->execute(array( $namecourse )) ;
$data1 = $stmt1->fetchColumn(); 
$count = $stmt1->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success" , "hall_id" => $data1)) ; 

}else {

    echo json_encode(array("status" => "fail")) ; 

}


?>