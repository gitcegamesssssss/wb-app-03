<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "wbdb";

$conn = new mysqli($host, $username, $password, $database);
mysqli_set_charset($conn, "utf8");

$loginUsr = $_POST['username'];
$loginPwd = $_POST['password'];

//echo "$loginUsr $loginPwd";

if($conn->connect_error){
    die('0');
}else {    
    $result = mysqli_query($conn, "SELECT id, hash FROM agent WHERE username = '$loginUsr'");    
    $row = mysqli_fetch_array($result);    
    if(strtoupper(hash('sha256', $loginPwd)) == $row['hash']){
        //password OK -> generate token
        $token = strtoupper(hash('sha256', $loginPwd.rand(0,99)));
        mysqli_query($conn, "UPDATE agent SET token = '$token' WHERE $row[id]");        
        die("$token $row[id]");        
    }        
    else 
        die('1');
}
