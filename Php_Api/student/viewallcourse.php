<?php

include "../connection/connect.php";

$std_id = fun("std_id");
$std_id2 = fun("std_id2");

$stmt1 = $con->prepare("SELECT c.course_id as course_id ,c.course_name as course_name,c.course_code as course_code, d.course_name as pre_name FROM student as s ,course as c LEFT JOIN course as d ON c.prerequisite_id = d.course_id WHERE s.stud_id = ? AND c.dep_id = s.dep_id AND c.course_id NOT IN(SELECT e.course_id From course as c , enrollrequest as e, student as s WHERE c.course_id = e.course_id AND s.stud_id=? AND e.std_id = s.stud_id);
");

$stmt1->execute(array($std_id,$std_id2)) ;
$data1 = $stmt1->fetchall(PDO::FETCH_ASSOC) ; 
$count = $stmt1->rowCount() ; 


if ($count > 0) {

    echo json_encode(array("status" => "success" , "data" => $data1)) ; 

}




?>