
<?php

include "../connection/connect.php";

$stmt = $con->prepare("SELECT a.ann_content , s.studAff_firstName , s.studAff_secName 
FROM announcment a, studentaffair s 
WHERE a.studAffair_id = s.studAff_id");

$stmt->execute();
$data=$stmt->fetchall(PDO::FETCH_ASSOC);
$count = $stmt->rowCount() ;

if ($count > 0) {
    echo json_encode(array("status" => "success" , "data" => $data)) ; 
}


?>