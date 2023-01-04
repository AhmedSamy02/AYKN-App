
<?php

include "../connection/connect.php";


/////////////////////////////
$idstd = fun("std_id");
///////////////////////////////
$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 
$stmt1->execute(array( $namecourse )) ;
$idcouse1 = $stmt1->fetchColumn();
//////////////////
$stmt2 = $con->prepare("DELETE FROM `enrollrequest` 
WHERE std_id=?
and course_id=?
 "); 
$stmt2->execute(array($idstd,$idcouse1)) ;
$data = $stmt2->fetchColumn();

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 
?>