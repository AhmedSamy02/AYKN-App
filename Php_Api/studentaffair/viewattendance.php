<?php

include "../connection/connect.php";

$stmt2 = $con->prepare("SELECT stud_id,std_firstName,std_secName ,enroll_attendanceNo,course_name
FROM `student` , `enrollrequest` ,`course`
WHERE `enrollrequest`.`std_id` = `student`.`stud_id` 
AND  `course`.`course_id`=`enrollrequest`.`course_id`
"); 
$stmt2->execute() ; ;

$data2 = $stmt2->fetchall(PDO::FETCH_ASSOC) ; 

$count = $stmt2->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success" , "data" => $data2)) ; 

}


?>