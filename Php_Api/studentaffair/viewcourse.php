
<?php

include "../connection/connect.php";

$stmt5 = $con->prepare("SELECT `course_id`, `course_price`,`course_code`, `course_name`,d.dep_name,c.hall_id,i.inst_fisrtName,i.inst_secName,i.inst_username, `prerequisite_id` as p ,
(SELECT `course_name` FROM `course` WHERE p = `course_id`)
 FROM course c ,instructor i,department d
 WHERE i.inst_id=c.inst_id
 and c.dep_id=d.dep_id;"); 
$stmt5->execute() ;
$data5 = $stmt5->fetchall(PDO::FETCH_ASSOC) ;
$count4 = $stmt5->rowCount() ; 
if ($count4 > 0) {
    echo json_encode(array("status" => "success" , "data" => $data5)) ; 
}

?>