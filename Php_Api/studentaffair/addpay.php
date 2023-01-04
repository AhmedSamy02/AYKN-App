<?php
include "../connection/connect.php";

$std_username = fun("std_username");

$stmt = $con->prepare("INSERT INTO `payment` (`std_id`,`pay_amount`) SELECT s.stud_id,sum(c.course_price) 
FROM course as c, student as s ,enrollrequest as e
WHERE s.std_username =? AND s.stud_id = e.std_id and e.course_id=c.course_id");


$stmt->execute(array($std_username));
$data = $stmt->fetchall(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0)
    echo json_encode(array("status" => "success"));

?>