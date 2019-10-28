<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "wbdb";

$conn = new mysqli($host, $username, $password, $database);
mysqli_set_charset($conn, "utf8");

$loginUsername = $_POST['username'];
$loginToken = $_POST['token'];

if($conn->connect_error){
    die('0');
}else {    
    $result = mysqli_query($conn, "SELECT id, token FROM agent WHERE username = '$loginUsername'");    
    $row = mysqli_fetch_array($result);    
    if($row['token'] == $loginToken){
        //token correct
        die('1');      
    }        
    else 
        //token failed 
        die('0');
}
