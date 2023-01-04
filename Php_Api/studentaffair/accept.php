
<?php

include "../connection/connect.php";


$email = fun("studAff_email");
$stmt101 = $con->prepare("SELECT `studAff_id` FROM `studentaffair` WHERE studAff_email = ? "); 
$stmt101->execute(array( $email )) ;
$data101 = $stmt101->fetchColumn(); 
/////////////////////////////
$idstd = fun("std_id");
///////////////////////////////
$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 
$stmt1->execute(array( $namecourse )) ;
$idcouse1 = $stmt1->fetchColumn();
//////////////////
$state = 1;
$stmt2 = $con->prepare("UPDATE `enrollrequest` 
SET `enroll_attendanceNo`= 0,`enroll_state`=?,`studAffair_id`=? 
WHERE std_id=?
and course_id=?
 "); 
$stmt2->execute(array($state,$data101,$idstd,$idcouse1)) ;
$data = $stmt2->fetchColumn();

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 
?>