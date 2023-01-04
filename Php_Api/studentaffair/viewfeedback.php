<?php

include "../connection/connect.php";


$stmt1 = $con->prepare("SELECT `fed_content`, `fed_date` FROM `feedback`"); 

$stmt1->execute() ;
$data1 = $stmt1->fetchall(PDO::FETCH_ASSOC) ; 
$count = $stmt1->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success" , "data" => $data1)) ; 

}


?>