
<?php

include "../connection/connect.php";

//////////////////////////////

$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `course_id` FROM `course` WHERE course_name = ? "); 
$stmt1->execute(array( $namecourse )) ;
$data1 = $stmt1->fetchColumn(); 

$textBook_name     = fun("textBook_name");
$textBook_link     = fun("textBook_link");
$textBook_puplishYear     = fun("textBook_puplishYear");

$stmt2 = $con->prepare("INSERT INTO `textbook`(`textBook_name`, `textBook_puplishYear`, `textBook_link`, `course_id`)
VALUES (?,?,?,?)");

$stmt2->execute(array($textBook_name,$textBook_puplishYear, $textBook_link,$data1 )) ;

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
}

?>