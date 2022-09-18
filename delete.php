
<?php
include "db.php";

 $id=$_POST['id'];

$conn->query("DELETE FROM users  where uid='".$id."'  ");