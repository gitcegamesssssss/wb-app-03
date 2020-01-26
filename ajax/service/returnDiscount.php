<?php
/* use for return **1 discount to customer*/
/* URL parameter required(2) : orderId */
error_reporting(0);
if (isset($_GET["orderId"])) {
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "wbdb";

    $conn = new mysqli($host, $username, $password, $database);
    mysqli_set_charset($conn, "utf8");

    $res = mysqli_query(
        $conn,
        "SELECT proc_trans.order_id as order_id,
    customers.id as customer_id,
    customers.discount as discount
    FROM proc_trans JOIN customers ON
    proc_trans.cus_id = customers.id
    WHERE proc_trans.order_id = $_GET[orderId]"
    );
    $row = mysqli_fetch_array($res);

    $arrDiscount = explode(',', $row["discount"]);

    $newStrDiscount = "";

    foreach ($arrDiscount as $tmp) {
        if ($tmp != $_GET["orderId"])
            $newStrDiscount .= "$tmp,";
    }
    $newStrDiscount = substr($newStrDiscount, 0, -1);

    if ($newStrDiscount == "") {
        $newStrDiscount = "0";
    }
    echo $newStrDiscount;

    if ($row["discount"] != "0") {
        mysqli_query(
            $conn,
            "UPDATE customers SET point = point + 10, discount = '$newStrDiscount' WHERE id = $row[customer_id]"
        );
    }    
} else {
    echo ("invalid param.");
}
