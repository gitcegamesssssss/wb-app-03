<?php 
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "wbdb";

    $conn = new mysqli($host, $username, $password, $database);
    mysqli_set_charset($conn, "utf8");       
    
    $sql_point = 
    "SELECT SUM(proc_trans.unit) as point, proc_trans.cus_id, items.item_type 
    FROM proc_trans JOIN items ON proc_trans.item_id = items.id 
    WHERE proc_trans.order_id = $_GET[orderId]";

    $res_sql_point = mysqli_query($conn, $sql_point);
    $row_sql_point = mysqli_fetch_array($res_sql_point);
    $sql = "UPDATE customers SET point = point - $row_sql_point[point] WHERE id = $row_sql_point[cus_id]";  

    mysqli_query($conn, $sql);
    echo $sql;


