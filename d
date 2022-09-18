<?php
// require_once "./db.php";
// if(isset($_POST['id'])){
//     $id=$_POST['id'];
// }
// else return ;

// $query="DELETE FROM `users` Where `uid`=`$id`";

// $exe=mysqli_query($conn,$query);
// $arr=[];
// if($exe){
//     $arr["success"]="true";
// }else{
//     $arr["success"]="false";
// }

// print(json_encode($arr));

// ?>

<?php
require_once "./db.php";
if(isset($_POST['name'])){

    $name=$_POST['name'];
}
else return ;

if(isset($_POST['email'])){

    $email=$_POST['email'];
}
else return ;

if(isset($_POST['password'])){

    $password=$_POST['password'];
}
else return ;

$query="UPDATE `users` SET `uname`='$name',`upassword`='$password' WHERE `uemail`='$email'";

$exe=mysqli_query($conn,$query);
$arr=[];

if($exe){
    $arr["success"]="true";
}else{
    $arr["success"]="false";
}
print(json_encode($arr));

?>
