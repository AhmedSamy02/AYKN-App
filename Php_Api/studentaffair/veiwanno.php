
<?php

include "../connection/connect.php";

$email = fun("studAff_email");

$stmt101 = $con->prepare("SELECT `studAff_id` FROM `studentaffair` WHERE studAff_email = ? "); 
$stmt101->execute(array( $email )) ;
$data101 = $stmt101->fetchColumn(); 


$stmt2 = $con->prepare("SELECT `ann_content`, `ann_date` FROM `announcment` WHERE studAffair_id = ? ");

$stmt2->execute(array($data101));
$data2 = $stmt2->fetchall(PDO::FETCH_ASSOC) ; 

$count = $stmt2->rowCount() ;

if ($count > 0) {
    echo json_encode(array("status" => "success" , "data" => $data2)) ; 
}


?>