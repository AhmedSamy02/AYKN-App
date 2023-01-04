<?php
function fun($req)
{
    return htmlspecialchars(strip_tags($_POST[$req]));
}
?>