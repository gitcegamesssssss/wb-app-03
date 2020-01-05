<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "wbdb";

$conn = new mysqli($host, $username, $password, $database);
mysqli_set_charset($conn, "utf8");

$res = mysqli_query(
    $conn,
    "SELECT 
    proc_trans.id as proc_id,
    proc_trans.item_details as details,
    proc_trans.unit as unit
    FROM proc_trans JOIN 
    items ON proc_trans.item_id = items.id 
    WHERE items.item_type = 1
    ORDER BY proc_id ASC
    LIMIT 1"
);

if (mysqli_num_rows($res)) {
    $row = mysqli_fetch_array($res);
    echo "$row[proc_id],$row[details],$row[unit];";
}else{
    echo 0;
}
