<?php
/*
    0 = rec
    1 = prog
    2 = done
*/
error_reporting(0);
if (isset($_GET['id'])) {   
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "wbdb";

    $conn = new mysqli($host, $username, $password, $database);
    mysqli_set_charset($conn, "utf8");

    $res = mysqli_query(
        $conn,
        "UPDATE proc_trans SET work_stat = 1 WHERE id = $_GET[id]"
    );
    die("1");
} else {
    die("0");
}
