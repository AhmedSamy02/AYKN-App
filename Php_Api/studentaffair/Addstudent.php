
<?php

include "../connection/connect.php";

$username = fun("std_username");
$pass = fun("std_password");
$namefirst = fun("std_firstName");
$namesec = fun("std_secName");
$email = fun("std_email");
$name = fun("dep_name");
///////////////
$stmt6 = $con->prepare("SELECT `dep_id` FROM `department` WHERE dep_name = ? "); 
$stmt6->execute(array( $name )) ;
$dep_id = $stmt6->fetchColumn(); 

/////////////
$stmt2 = $con->prepare("INSERT INTO `student`(`std_username`, `std_password`, `std_firstName`, `std_secName`, `std_email`, `dep_id`) 
VALUES  (?,?,?,?,?,?)");


$stmt2->execute(array($username,$pass,$namefirst,$namesec,$email,$dep_id ));

$count = $stmt2->rowCount() ;
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} 

?>