
<?php

include "../connection/connect.php";

$stmt5 = $con->prepare("SELECT `course_id` as c, `std_id`,
(SELECT `course_name` FROM `course` WHERE c = `course_id`) 
FROM `enrollrequest` where `enroll_state`=0;
"); 
$stmt5->execute() ;
$data5 = $stmt5->fetchall(PDO::FETCH_ASSOC) ;
$count4 = $stmt5->rowCount() ; 
if ($count4 > 0) {
    echo json_encode(array("status" => "success" , "data" => $data5)) ; 
}
?>