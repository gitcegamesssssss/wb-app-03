<?php
/* use list finished-order by URL parameter
    - date (use for filter record)

    - minTime (use for filter record)
    |
    - maxTime (use for filter record)

    return 0 [wrong]
    return jsonstring [ok]
*/
if (isset($_GET['date'])) {
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "wbdb";

    $conn = new mysqli($host, $username, $password, $database);
    mysqli_set_charset($conn, "utf8");

    $sql = "SELECT 
    done_trans.id as id, 
    done_trans.order_id as order_id, 
    customers.name as customer_name, 
    items.name as item_name, 
    done_trans.abs_cost as cost, 
    done_trans.unit as unit, 
    agent.name as agent_name, 
    done_trans.add_date as add_date, 
    done_trans.item_details as item_details
    FROM done_trans 
    JOIN customers ON done_trans.cus_id = customers.id
    JOIN items ON done_trans.item_id = items.id
    JOIN agent ON done_trans.agent_id = agent.id
    WHERE done_trans.add_date ";

    if (isset($_GET['minTime']) && isset($_GET['maxTime'])) {
        //date-time filtering
        $sql .= "BETWEEN '$_GET[date] $_GET[minTime]:00' AND '$_GET[date] $_GET[maxTime]:00'";
    } else {
        //only date filtering
        $sql .= "LIKE '$_GET[date]%'";
    }

    $sql .= "ORDER BY done_trans.id ASC";

    $res = mysqli_query(
        $conn,
        $sql
    );

    if (mysqli_num_rows($res) != 0) {
        $jsonStr = "[";
        while ($row = mysqli_fetch_array($res)) {
            $tmpObj = new stdClass();
            $tmpObj->id = $row['id'];
            $tmpObj->orderId = $row['order_id'];
            $tmpObj->itemName = $row['item_name'];
            $tmpObj->customerName = $row['customer_name'];
            $tmpObj->cost = $row['cost'];
            $tmpObj->unit = $row['unit'];
            $tmpObj->agentName = $row['agent_name'];
            $tmpObj->itemDetails = $row['item_details'];
            $tmpObj->addDate = $row['add_date'];

            $tmpJSON = json_encode($tmpObj);
            $jsonStr .= $tmpJSON . ",";
        }
        $jsonStr = substr($jsonStr, 0, -1);
        $jsonStr .= "]";
        die($jsonStr);
    }else{
        die("0");
    }
} else {
    die("0");
}
