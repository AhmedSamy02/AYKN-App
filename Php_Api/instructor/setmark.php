
<?php

include "../connection/connect.php";

////////////////////////////
$selid = fun("exam_id");
$name = fun("std_username");
$res = fun("res_grade");
//////////////////////////////
$stmt1 = $con->prepare("SELECT `stud_id` FROM `student` WHERE std_username = ? "); 
$stmt1->execute(array( $name )) ;
$idstd = $stmt1->fetchColumn(); 

/////////////////////////////
$stmt4 = $con->prepare(
"INSERT INTO `result`(`res_grade`, `exam_id`, `std_id`) 
VALUES (?,?,?)
"); 
$stmt4->execute(array($res,$selid,$idstd)) ;
$count4 = $stmt4->rowCount() ; 

if ($count4 > 0) {

    echo json_encode(array("status" => "success")) ; 

}else {

    echo json_encode(array("status" => "fail")) ; 
}
?>