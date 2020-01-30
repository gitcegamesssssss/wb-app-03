<?php
/* use list finished-order by URL parameter
    - date (use for filter record)

    - minTime (use for filter record)
    |
    - maxTime (use for filter record)

    - type (use for type filter)    

    return 0 [wrong]
    return jsonstring [ok]
*/
if (isset($_GET['date']) || isset($_GET['minDate']) || isset($_GET['maxDate']) && isset($_GET['type'])) {
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
    done_trans.item_details as item_details,
    done_trans.item_id as item_id,
    items.item_type as item_type
    FROM done_trans 
    JOIN customers ON done_trans.cus_id = customers.id
    JOIN items ON done_trans.item_id = items.id
    JOIN agent ON done_trans.agent_id = agent.id
    WHERE items.item_type = $_GET[type] && done_trans.add_date ";

    if (isset($_GET['minDate']) && isset($_GET['maxDate'])) {
        //date-time filtering
        $sql .= "BETWEEN '$_GET[minDate]' AND '$_GET[maxDate]'";
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
            $tmpObj->itemName = $row['item_name'];
            $tmpObj->itemId = $row['item_id'];
            $tmpObj->itemType = $row['item_type'];            
            $tmpObj->cost = $row['cost'];
            $tmpObj->unit = $row['unit'];                
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
