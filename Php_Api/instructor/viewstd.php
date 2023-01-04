<?php

include "../connection/connect.php";

$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 

$stmt1->execute(array( $namecourse )) ;
$data1 = $stmt1->fetchColumn(); 
//////////////////////////// 
////////////////////////////
$stmt2 = $con->prepare("SELECT stud_id,std_firstName,std_secName 
FROM `student` , `enrollrequest` 
WHERE `enrollrequest`.`std_id` = `student`.`stud_id` 
AND `enrollrequest`.`course_id`=?
"); 
$stmt2->execute(array( $data1)) ; ;

$data2 = $stmt2->fetchall(PDO::FETCH_ASSOC) ; 

$count = $stmt2->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success" , "data" => $data2)) ; 

}


?>