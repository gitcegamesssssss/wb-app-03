<?php
/* use for move record from proc-table to done-table*/ 
//error_reporting(0);
if (isset($_GET['id'])) {    
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "wbdb";

    $conn = new mysqli($host, $username, $password, $database);
    mysqli_set_charset($conn, "utf8");

    $res = mysqli_query(
        $conn,
        "SELECT * from proc_trans WHERE id = $_GET[id]"
    );

    $row_prog = mysqli_fetch_array($res);

    if ($row_prog['work_stat'] == 2) {
        $res_move = mysqli_query(
            $conn,
            "INSERT INTO done_trans (order_id, cus_id, item_id, mod_item, abs_cost, unit, agent_id, add_date) 
            VALUES ($row_prog[order_id], $row_prog[cus_id], $row_prog[item_id], '$row_prog[mod_item]', $row_prog[abs_cost],
            $row_prog[unit], $row_prog[agent_id], '$row_prog[add_date]')"
        );

        if (mysqli_error($conn) == '') { //mysql_errno return '' when NO error
            //delete record on Proc table
            $res_delete = mysqli_query(
                $conn,
                "DELETE FROM proc_trans WHERE id = $_GET[id]"
            );
           die("1");
        } else { //in case error occur
            die("0");
        }
    }else{
        die ("0");
    }
} else {
    die("0");
}
