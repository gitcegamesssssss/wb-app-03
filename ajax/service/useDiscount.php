<?php
/* use for set discount parameter in database */ 
/* URL parameter required(2) : customerId, orderId */
error_reporting(0);
if (isset($_GET["customerId"]) && isset($_GET["orderId"])) {    
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "wbdb";

    $conn = new mysqli($host, $username, $password, $database);
    mysqli_set_charset($conn, "utf8");

    $res = mysqli_query(
        $conn,
        "UPDATE customers SET point = point - 10, discount = CONCAT('$_GET[orderId],', discount) WHERE id = $_GET[customerId]"
    );
} else {
    echo ("invalid param.");
}
