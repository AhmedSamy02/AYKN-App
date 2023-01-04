
<?php

include "../connection/connect.php";

$email = fun("studAff_email");

$stmt101 = $con->prepare("SELECT `studAff_id` FROM `studentaffair` WHERE studAff_email = ? "); 
$stmt101->execute(array( $email )) ;
$data101 = $stmt101->fetchColumn(); 


$cont = fun("ann_content");

$stmt2 = $con->prepare("INSERT INTO `announcment`(`ann_content`, `studAffair_id`) VALUES (?,?)");


$stmt2->execute(array($cont,$data101 ));

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 

?>