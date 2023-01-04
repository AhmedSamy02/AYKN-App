<?php
include "../connection/connect.php";

$course_id = fun("course_id");
$std_id = fun("std_id");

$stmt = $con->prepare("SELECT r.res_grade , e.exam_name,r.res_date, e.exam_link
From result r , exam e
WHERE r.std_id=? AND r.exam_id in 
(SELECT exam_id 
FROM exam
Where course_id = ?) AND r.exam_id = e.exam_id "); //GET EXAM ONLY IF HE HAS GRADE

// $stmt = $con->prepare("SELECT e.exam_name, e.exam_date, e.exam_link, r.res_grade
// FROM exam e LEFT JOIN result r ON e.exam_id = r.exam_id
// WHERE r.std_id =? AND e.exam_id in 
//  (SELECT exam_id 
//  FROM exam
// Where course_id = ? )
// ");

// $stmt = $con->prepare("SELECT e.exam_name, e.exam_date, e.exam_link
// FROM exam e
// WHERE e.exam_id in 
// (SELECT exam_id 
// FROM exam
// Where course_id = ? )
// ");

$stmt->execute(array($std_id,$course_id));
$data = $stmt->fetchall(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0)
    echo json_encode(array("status" => "success", "data" => $data));

?>