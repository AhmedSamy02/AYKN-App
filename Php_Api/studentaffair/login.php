<?php

include "../connection/connect.php";

$email     = fun("studAff_email");

$password  = fun("studAff_password");

$stmt = $con->prepare("SELECT * FROM studentaffair WHERE `studAff_password` = ? AND studAff_email = ? "); 

$stmt->execute(array( $password , $email )) ;
$data = $stmt->fetch(PDO::FETCH_ASSOC) ; 

$count = $stmt->rowCount() ; 

if ($count > 0) {

    echo json_encode(array("status" => "success" , "data" => $data)) ; 

}

?>