
<?php

include "../connection/connect.php";

//////////////////////////////

$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 
$stmt1->execute(array( $namecourse )) ;
$data1 = $stmt1->fetchColumn();
$lec_name = fun("lec_name");
$lec_count     = fun("lec_count");
$lec_link     = fun("lec_link");

$stmt2 = $con->prepare("INSERT INTO `lecture`
(`lec_name`,`lec_count`, `lec_link`,`course_id`)
VALUES (?,?,?,?) ");

$stmt2->execute(array($lec_name,$lec_count,$lec_link, $data1 )) ;

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
}

?>