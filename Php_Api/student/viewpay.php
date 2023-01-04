<?php

include "../connection/connect.php";

$std_id = fun("std_id");

$stmt1 = $con->prepare("SELECT * from payment WHERE std_id = ? ");

$stmt1->execute(array($std_id)) ;
$data1 = $stmt1->fetchall(PDO::FETCH_ASSOC) ; 
$count = $stmt1->rowCount() ; 


if ($count > 0)
$data="You paid the fees";
else
$data="You didn't pay the fees";


echo json_encode(array("data" => $data)) ; 

?>