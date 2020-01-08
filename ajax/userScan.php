<?php
$host = "localhost";
$database = "wbdb";
$username = "root";
$password = "";
$conn = mysqli_connect($host, $username, $password, $database);
$sql = "SELECT id, name, tel, point FROM `customers` WHERE `tel` LIKE '%$_GET[str]%'";
if ($_GET['str'] != "") {
    $result = mysqli_query($conn, $sql);
    $strJSON = "[";
    while ($row = mysqli_fetch_array($result)) {
        $tmpObj = new stdClass();
        $tmpObj->id = $row['id'];
        $tmpObj->name = $row['name'];
        $tmpObj->tel = $row['tel'];
        $tmpObj->point = $row['point'];
        $tmpJSON = json_encode($tmpObj);

        $strJSON .= $tmpJSON . ",";
    }
    $strJSON = substr($strJSON, 0, -1);
    $strJSON .= "]";

    die($strJSON);
}else{
    die();
}
