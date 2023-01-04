
<?php

include "../connection/connect.php";

$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 
$stmt1->execute(array( $namecourse )) ;
$data1 = $stmt1->fetchColumn(); 

$idstd = fun("std_id");

$stmt4 = $con->prepare("UPDATE `enrollrequest` SET `enroll_attendanceNo`=`enroll_attendanceNo` + 1 WHERE `course_id`= ? and `std_id`= ?"); 

$stmt4->execute(array( $data1,$idstd)) ;

$count4 = $stmt4->rowCount() ; 

if ($count4 > 0) {

    echo json_encode(array("status" => "success")) ; 

}
?>