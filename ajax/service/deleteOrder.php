<?php
error_reporting(0);
if (isset($_GET['id'])) {
    echo ("id valid! $_GET[id]");
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "wbdb";

    $conn = new mysqli($host, $username, $password, $database);
    mysqli_set_charset($conn, "utf8");

    $res = mysqli_query(
        $conn,
        "DELETE FROM proc_trans WHERE id = $_GET[id]"
    );
} else {
    echo ("invalid param.");
}
