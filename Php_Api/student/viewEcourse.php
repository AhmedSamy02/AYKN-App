<?php
include "../connection/connect.php";

$studentid = fun("stud_id");

$stmt = $con->prepare("SELECT c.course_name,c.course_code , e.enroll_attendanceNo,e.course_id
From course as c , enrollrequest as e, student as s
WHERE c.course_id = e.course_id AND s.stud_id=? AND e.std_id = s.stud_id AND e.enroll_state = 1");

$stmt->execute(array($studentid));
$data = $stmt->fetchall(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0)
    echo json_encode(array("status" => "success", "data" => $data));
?>