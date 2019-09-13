<?php
$host = "localhost";
$database = "wbdb";
$username = "root";
$password = "";
$conn = mysqli_connect($host, $username, $password, $database);
$sql =
    'SELECT proc_trans.id, 
    proc_trans.order_id, 
    proc_trans.cus_id, 
    customers.name as cus_name, 
    proc_trans.item_id, 
    items.name as item_name, 
    proc_trans.abs_cost, 
    proc_trans.unit,
    proc_trans.agent_id, 
    agent.name as agent_name, 
    proc_trans.add_date, 
    proc_trans.item_details,
    proc_trans.work_stat
    FROM proc_trans
    JOIN customers ON proc_trans.cus_id = customers.id
    JOIN items ON proc_trans.item_id = items.id
    JOIN agent ON proc_trans.agent_id = agent.id
    ORDER BY proc_trans.id ASC';

?>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="../../assets/icon/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
</head>

<body>
    <div id="table-jobs-current">
        <div class="container-fluid mt-2">
            <table class="table table-bordered table-hover table-responsive-sm" id="tag-table-jobs-current">
                <thead class="bg-primary thead-dark">
                    <tr>
                        <th>#</th>
                        <th>Order details (Menu Name + Modification)</th>
                        <th>Cost per piece</th>
                        <th>Quantities</th>
                        <th>Cost total</th>
                        <th>work status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $result = mysqli_query($conn, $sql);
                    $rem_order_id = 0;
                    $i = 1;
                    while ($row = mysqli_fetch_array($result)) {                       
                        $cur_order_id = $row['order_id'];

                        $cost_total = $row['abs_cost'] * $row['unit'];
                        $arrStr_workstat = ["received", "progress", "done"];
                        $workstat = $arrStr_workstat[$row['work_stat']];
                        if ($cur_order_id != $rem_order_id) {
                            $i = 1;
                            echo "
                            <tr>
                                <td colspan='6'>Order ID : #$cur_order_id (Customer: $row[cus_name], Agent: $row[agent_name])</td>
                            </tr>";
                            $rem_order_id = $cur_order_id;
                        }
                        echo "
                        <tr class='table-secondary'>
                            <td>$i</td>
                            <td>$row[item_details]</td>
                            <td>$row[abs_cost]</td>
                            <td>$row[unit]</td>
                            <td>$cost_total</td>
                            <td>$workstat</td>
                        </tr>
                        ";
                        $i++;                        
                    }
                    ?>
                </tbody>
            </table>
        </div>
        <script src="./table-jobs-current.js"></script>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>