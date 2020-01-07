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
    WHERE add_date >= "' . date("Y-m-d") . ' 00:00:00"   
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
                <thead class="table-primary">
                    <tr class="text-center">
                        <th style='width:4%'>#</th>
                        <th style='width:56%'class="text-left">Order details (Menu Name + Modification)</th>
                        <th style='width:10%'>Cost per piece</th>
                        <th style='width:10%'>Quantities</th>
                        <th style='width:10%'>Cost total</th>
                        <th style='width:10%'>work status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $result = mysqli_query($conn, $sql);
                    $rem_order_id = 0;
                    $i = 1;
                    $j = 0;
                    date_default_timezone_set("Asia/Bangkok");
                    $current_time = date("H:i:s");
                    
                    $current_time = strtotime($current_time);
                    while ($row = mysqli_fetch_array($result)) {
                        $cur_order_id = $row['order_id'];

                        $date_time = explode(" ", $row['add_date']);
                        $cost_total = $row['abs_cost'] * $row['unit'];
                        $arrStr_workstat = ["Received", "Progress", "Done"];
                        $arrColor = ['text-danger', 'text-warning', 'text-success'];
                        $workstat = $arrStr_workstat[$row['work_stat']];
                        $workStatColor = $arrColor[$row['work_stat']];
                        
                        $received_time = strtotime($date_time[1]);
                        $waiting_time = $current_time - $received_time;
                        $waiting_time = $waiting_time / 60 ;//in min
                        $waiting_time = round($waiting_time, 0);
                        $waiting_time_color = $arrColor[2];
                        if($waiting_time >= 30)
                            $waiting_time_color = $arrColor[0];
                        else if($waiting_time >= 20)
                            $waiting_time_color = $arrColor[1];
                        else 
                            $waiting_time_color = $arrColor[2]; 
                        if ($cur_order_id != $rem_order_id) {
                            $i = 1;
                            $delay = $i * 0.1;
                            echo "
                            <tr>                                
                                <td colspan='6'>
                                <span class='mx-4'>
                                Order ID : 
                                <span class='font-weight-bold'>#$cur_order_id</span> 
                                
                                (Customer: 
                                <span class='font-weight-bold'>$row[cus_name]</span>
                                , Agent: 
                                <span class='font-weight-bold'>$row[agent_name]</span> 
                                )
                                </span>
                                $date_time[1]
                                <span class='$waiting_time_color'>(~$waiting_time min.)</span>
                                <span class='float-right'>                                    
                                    <button type='button' class='btn btn-danger btn-sm' onclick='delOrder($cur_order_id);'>
                                        <span class='oi oi-trash'></span>
                                    </button>
                                </span>
                                </td>
                            </tr>";
                            $rem_order_id = $cur_order_id;
                        }
                        echo "
                        <tr class='text-center'onclick=$('#$row[id]').toggle()>
                            <td class='table-primary'>$i</td>
                            <td class='text-left'>$row[item_details]</td>
                            <td>$row[abs_cost]</td>
                            <td>$row[unit]</td>
                            <td>$cost_total</td>
                            <td id='work-status-$j' class='font-weight-bold $workStatColor text-center'>$workstat</td>
                        </tr>
                        ";
                        echo "
                        <tr id='$row[id]' style='display:none;'>
                            <td colspan='5' class='w3-animate-opacity text-center table-primary'> 

                            <button type='button' class='btn btn-success btn-sm' onclick='archRecord($row[id]);'>
                            <span class='oi oi-circle-check'></span> ARCHIVE</button>

                            <button type='button' class='btn btn-danger btn-sm' onclick='delRecord($row[id]);'>
                            <span class='oi oi-circle-x'></span> DELETE</button>
                            id -> $row[id]
                            </td>  
                            <td class='text-center'>set to 
                            <button type='button' class='btn btn-outline-danger btn-sm' onclick='setStat2Rec($row[id]);'>R</button>
                            <button type='button' class='btn btn-outline-warning btn-sm' onclick='setStat2Prog($row[id]);'>P</button>
                            <button type='button' class='btn btn-outline-success btn-sm' onclick='setStat2Done($row[id]);'>D</button>
                            </td>                          
                        </tr>
                        ";
                        $i++;
                        $j++;
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