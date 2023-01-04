
<?php

include "../connection/connect.php";

$id    = fun("inst_id");
$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 
$stmt1->execute(array( $namecourse )) ;
$data1 = $stmt1->fetchColumn(); 

$exam_link     = fun("exam_link");
$exam_name     = fun("exam_name");

$stmt2 = $con->prepare("INSERT INTO `exam`
(`inst_id`, `course_id`,`exam_link`,`exam_name`)
VALUES (?,?,?,?)");

$stmt2->execute(array($id,$data1, $exam_link,$exam_name )) ;

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 

?>