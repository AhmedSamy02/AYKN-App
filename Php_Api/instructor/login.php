<?php

include "../connection/connect.php";

$email     = fun("inst_email");

$password  = fun("inst_password");

$stmt = $con->prepare("SELECT * FROM instructor WHERE `inst_password` = ? AND inst_email = ? "); 

$stmt->execute(array( $password , $email )) ;
$data = $stmt->fetch(PDO::FETCH_ASSOC) ; 

$count = $stmt->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success" , "data" => $data)) ; 

}else {

    echo json_encode(array("status" => "fail")) ; 

}


?>