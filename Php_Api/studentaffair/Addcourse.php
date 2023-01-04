
<?php

include "../connection/connect.php";

$id = fun("course_code");
$name = fun("course_name");
$price = fun("course_price");
$instname = fun("inst_username");
$hall = fun("hall_id");
$depname = fun("dep_name");
//////////////////////////
$namepre = fun("name");
if($namepre!="--")
{$stmt8 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 
$stmt8->execute(array( $namepre )) ;
$pre_id = $stmt8->fetchColumn(); 
}
///////////////////////////////////
$stmt7 = $con->prepare("SELECT `inst_id` FROM `instructor` WHERE inst_username = ? "); 
$stmt7->execute(array( $instname )) ;
$inst_id = $stmt7->fetchColumn(); 
//////////////////////////////////
$stmt6 = $con->prepare("SELECT `dep_id` FROM `department` WHERE dep_name = ? "); 
$stmt6->execute(array( $depname )) ;
$dep_id = $stmt6->fetchColumn(); 
//////////////////////////////////
$stmt2 = $con->prepare("INSERT INTO `course`(`course_price`, `course_code`, `course_name`, `inst_id`, `hall_id`, `dep_id`, `prerequisite_id`)
VALUES(?,?,?,?,?,?,?)");

$stmt2->execute(array($price,$id,$name,$inst_id,$hall,$dep_id,$pre_id));
$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 
?>