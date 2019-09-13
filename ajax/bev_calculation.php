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
$arr_bev_type = ["hot", "ice", "fepp"];
$item_details .= $row_item['name'];
$item_details .= '(' . $arr_bev_type[$_GET['type_id']] . ')';
//set base cost_per_piece
$arr_cost = explode(',', $row_item['cost']);
$cost_per_piece = $arr_cost[intval($_GET['type_id'])];

//loop each mod
if ($_GET['mods'] != "") {
    $arr_mod = explode(',', $_GET['mods']);
    foreach ($arr_mod as $tmp) {
        $res_tmp = mysqli_query($conn, "SELECT name, cost FROM mod_bev WHERE id = $tmp");
        $row_tmp = mysqli_fetch_array($res_tmp);
        //append item_details
        $item_details .= "/ " . $row_tmp['name'];
        //append cost_per_piece
        $cost_per_piece += intval($row_tmp['cost']);
    }
}

$myObj = new stdClass();
$myObj->item_details = "" . $item_details;
$myObj->cost_per_piece = "" . $cost_per_piece;
$myJSON = json_encode($myObj);
echo $myJSON;
