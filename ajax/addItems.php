<?php
/*
    error code response : 
        0 = mysqli connection failed.        
        1 = SQL execution failed.
        2 = everything fine.
*/
error_reporting(0);//turn off error reporting text

$host = "localhost";
$username = "root";
$password = "";
$database = "wbdb";

$conn = new mysqli($host, $username, $password, $database);
mysqli_set_charset($conn, "utf8");

$addPoint = "UPDATE customers SET point = point + $_GET[point] WHERE id = $_GET[cusId]";

if($conn->connect_error){
    die('0');
}else{
    if(!mysqli_query($conn, $_GET['sql']) || 
    !mysqli_query($conn, "UPDATE status SET cur_order_id = ".($_GET['cur_order_id']))
    ){
        die('1');
    }else{
        if($_GET['cusId'] != 1)
            mysqli_query($conn, $addPoint);
        die('2');
    }    
}
