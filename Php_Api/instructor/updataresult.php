
<?php

include "../connection/connect.php";

$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 
$stmt1->execute(array( $namecourse )) ;
$data1 = $stmt1->fetchColumn(); 
////////////////////////////
//$date     = fun("exam_date");
$stmt5 = $con->prepare("SELECT `exam_name`,exam_id FROM `exam` WHERE course_id = ? "); 
$stmt5->execute(array( $data1 )) ;
$examid = $stmt5->fetchall(PDO::FETCH_ASSOC);
$count = $stmt5->rowCount() ; 
if ($count > 0) {
    echo json_encode(array("status" => "success" , "data" => $examid)) ; 
}
?>