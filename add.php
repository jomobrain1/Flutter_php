<?php
require_once "./db.php";
if(isset($_POST['name'])){

    $name=$_POST['name'];
}
// else return ;

if(isset($_POST['email'])){

    $email=$_POST['email'];
}
// else return ;

if(isset($_POST['password'])){

    $password=$_POST['password'];
}
// else return ;

$query=mysqli_query($conn, "insert into users(uname,uemail, upassword) value('$name','$email', '$password' )");
$exe=mysqli_query($conn,$query);

$arr=[];
if($exe){
    $arr["success"]="true";
}else{
    $arr["success"]="false";
}
print(json_encode($arr));
?>
