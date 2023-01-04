
<?php

include "../connection/connect.php";

$idstd = fun("std_id");
///////////////////////////////
$namecourse     = fun("course_name");
$stmt1 = $con->prepare("SELECT `prerequisite_id` FROM `course` WHERE course_name = ? "); 
$stmt1->execute(array( $namecourse )) ;
$idcouse1 = $stmt1->fetchColumn();

if($idcouse1==0||$idcouse1==null)
{
    echo json_encode(array("status" => "success")) ;
} else
///////////////////////////////
{

    $stmt8 = $con->prepare("SELECT `enroll_state` FROM `enrollrequest` WHERE course_id = ?");
    $stmt8->execute(array($idcouse1));
    $state = $stmt8->fetchColumn();
    if ($state == 1) 
    {
        ////////////////
        $stmt2 = $con->prepare("SELECT avg(r.res_grade)
    From result r , exam e WHERE r.std_id=? AND r.exam_id 
    in (SELECT exam_id FROM exam Where course_id = ?) AND r.exam_id = e.exam_id;");

        $stmt2->execute(array($idstd, $idcouse1));
        $avg = $stmt2->fetchColumn();

        if ($avg > 50) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "fail"));
        }
    }
    else  echo json_encode(array("status" => "fail"));
}
?>