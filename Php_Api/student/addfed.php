
<?php

include "../connection/connect.php";

$std_id = fun("std_id");
$cont = fun("fed_content");

$stmt2 = $con->prepare("INSERT INTO feedback (fed_content, std_id ) VALUES (?,?)");

$stmt2->execute(array($cont,$std_id ));

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 

?>