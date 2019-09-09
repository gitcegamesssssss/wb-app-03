<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "wbdb";

$conn = new mysqli($host, $username, $password, $database);
mysqli_set_charset($conn, "utf8");

$item_details = '';
$cost_per_piece = 0;

$res_item = mysqli_query($conn, "SELECT name, cost FROM items WHERE id = $_GET[id]");
$row_item = mysqli_fetch_array($res_item);

//set base item_details
$item_details .= $row_item['name'];
//set base cost_per_piece
$cost_per_piece = $row_item['cost'];

$myObj = new stdClass();
$myObj->item_details = "" . $item_details;
$myObj->cost_per_piece = "" . $cost_per_piece;
$myJSON = json_encode($myObj);
echo $myJSON;
