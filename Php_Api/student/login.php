<?php
include "../connection/connect.php";
$email = fun("std_email");
$password = fun("std_password");
$stmt = $con->prepare("SELECT * FROM student WHERE `std_password` = ? AND std_email = ? ");
$stmt->execute(array($password, $email));
$data = $stmt->fetch(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {

    echo json_encode(array("status" => "success", "data" => $data));
} else {

    echo json_encode(array("status" => "fail"));

}
?>