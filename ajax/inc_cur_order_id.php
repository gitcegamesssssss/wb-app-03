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

if($conn->connect_error){
    die('0');
}else{
    if(!mysqli_query($conn, 'UPDATE status cur_order_id = '.($_GET['cur'] + 1) ) ){
        die('1');
    }else{
        die('2');
    }    
}
