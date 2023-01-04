<?php

include "../connection/connect.php";


//////////////////////////// 
////////////////////////////
$stmt2 = $con->prepare("SELECT `stud_id`, `std_username`, `std_password`, `std_firstName`, `std_secName`, `std_email`, `dep_id` 
FROM `student` 
"); 
$stmt2->execute() ; ;

$data2 = $stmt2->fetchall(PDO::FETCH_ASSOC) ; 

$count = $stmt2->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success" , "data" => $data2)) ; 

}


?>