
<?php

include "../connection/connect.php";

$username = fun("inst_userName");
$pass = fun("inst_password");
$namefirst = fun("inst_fisrtName");
$namesec = fun("inst_secName");
$email = fun("inst_email");
$salary = fun("inst_salary");

$stmt2 = $con->prepare("INSERT INTO
`instructor`(`inst_fisrtName`, `inst_secName`, `inst_userName`, `inst_email`, `inst_password`, `inst_salary`) 
VALUES  (?,?,?,?,?,?)");


$stmt2->execute(array($namefirst,$namesec,$username,$email,$pass,$salary ));

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 

?>