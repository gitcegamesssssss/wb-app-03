<?php
/*
    use for set workstatus to "2"
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
        "UPDATE proc_trans SET work_stat = 2 WHERE id = $_GET[id]"
    );
    die("1");
} else {
    die("0");
}
