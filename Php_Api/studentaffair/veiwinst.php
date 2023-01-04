
<?php

include "../connection/connect.php";

$stmt5 = $con->prepare("SELECT `inst_id`, `inst_fisrtName`, `inst_secName`, `inst_userName`, `inst_email`, `inst_password`, `inst_salary` FROM `instructor`"); 
$stmt5->execute() ;
$data5 = $stmt5->fetchall(PDO::FETCH_ASSOC) ;
$count4 = $stmt5->rowCount() ; 
if ($count4 > 0) {
    echo json_encode(array("status" => "success" , "data" => $data5)) ; 
}
?>