<?php
$host = "localhost";
$database = "wbdb";
$username = "root";
$password = "";
$conn = mysqli_connect($host, $username, $password, $database);

//order_id generating
$order_id = mysqli_query($conn, "SELECT cur_order_id FROM status WHERE id = 1");
$order_id = mysqli_fetch_array($order_id);
$order_id = $order_id['cur_order_id'] + 1;
?>
<!doctype html>
<html lang="en">

<head>
    <style>
        input[type="text"]:disabled {
            background: white;
        }
    </style>
    <title>+Order create</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/wb-app-03/js/main.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="../assets/icon/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
</head>

<body style="display:none">
    <div class="" id="navbar-main">
    </div>
    <div class="container-fluid m-3">
        <div class="row">
            <!-- input and controller -->
            <div class="col-2">
                <div class="row">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="oi oi-layers"></span>&nbsp;Order id</span>
                        </div>
                        <input type="text" class="form-control text-center" id="input-order-id" disabled value="<?php echo $order_id; ?>">
                    </div>
                </div>
                <div class="row">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="oi oi-people"></span>&nbsp;Customer</span>
                        </div>
                        <input type="text" class="form-control text-center" id="input-customer-show" value="GUEST (0 pt.)" disabled>
                        <input type="hidden" class="form-control text-center" id="input-customer-id" value="1" disabled>
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#modal-scan-user"><span class="oi oi-magnifying-glass"></span></button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <button type="button" class="btn btn-primary btn-block text-right" data-toggle="modal" data-target="#modal-add-bev">
                        <span class="oi oi-task float-left"></span>add Beverage</button>
                </div>
                <div class="row mt-2">
                    <button type="button" class="btn btn-primary btn-block text-right" data-toggle="modal" data-target="#modal-add-dish">
                        <span class="oi oi-task float-left"></span>add Dish</button>
                </div>
                <div class="row mt-2">
                    <button type="button" class="btn btn-primary btn-block text-right" data-toggle="modal" data-target="#modal-add-snack">
                        <span class="oi oi-task float-left"></span>add Snack</button>
                </div>
            </div>
            <!-- table -->
            <div class="col-10 ">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-header">
                            Current Orders ( Total Order:
                            <span class="font-weight-bold" id="total-order">0</span> ea. )
                            <button type="button" class="btn btn-danger float-right" onclick="clearTable()">
                                <span class="oi oi-ban mr-1"></span>Clear</button>
                        </div>
                        <div class="card-body py-0 px-0">
                            <table class="table table-bordered table-hover text-center my-0">
                                <thead>
                                    <tr>
                                        <th class="text-left" style="width: 60%">Order details (Menu Name + Modification)</th>
                                        <th style="width: 9%">Cost per piece</th>
                                        <th style="width: 8%">Quantities</th>
                                        <th style="width: 9%">Total</th>
                                        <th style="width: 4%">*</th>
                                    </tr>
                                </thead>
                                <tbody id="table-items">
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                            <div class="input-group col-2 float-left">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="oi oi-inbox"></span>&nbsp;Cost</span>
                                </div>
                                <input type="number" min="0" class="form-control text-center" id="total-cost" value="0" disabled>
                            </div>
                            <div class="input-group col-1 float-left" style="display:none;" id="discount-btn" onclick="useDiscount();">
                                <button type="button" class="btn btn-warning btn-sm mt-1">
                                    Discount <span class="oi oi-bolt"></span>
                                </button>
                            </div>
                            <div class="input-group col-2 float-left">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="oi oi-dollar mb-1"></span>&nbsp;Cash</span>
                                </div>
                                <input type="number" min="0" class="form-control text-center" id="cash" value="0" oninput="calBalance();">
                            </div>
                            <div class="input-group col-2 float-left">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="oi oi-loop"></span>&nbsp;Balance</span>
                                </div>
                                <input type="number" min="0" class="form-control text-center" id="balance" value="0" disabled>
                            </div>
                            <button type="button" class="btn btn-success float-right" onclick="exeSQL(createSQL());">
                                confirm<span class="oi oi-task ml-1"></span></button>

                        </div>
                    </div>
                </div>
            </div>
            <!-- modal-add-bev -->
            <div class="modal fade" id="modal-add-bev">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Add Beverages</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <span class="oi oi-basket"></span>&nbsp;Beverage</span>
                                            </div>
                                            <select class="form-control text-center" name="input-bev-id" id="input-bev-id" onfocus="this.value=''">
                                                <?php
                                                $result = mysqli_query($conn, "SELECT id, name, cost FROM items WHERE item_type = 1");
                                                while ($row = mysqli_fetch_array($result)) {
                                                    $arrCost = explode(",", $row['cost']);
                                                    echo "<option value='$row[id]'>$row[name] (hot $arrCost[0]฿, ice $arrCost[1]฿, feppe $arrCost[2]฿)</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <span class="oi oi-basket">
                                            </div>
                                            <select class="form-control text-center" name="input-bev-type" id="input-bev-type" onfocus="this.value=''">
                                                <option value="0">hot</option>
                                                <option value="1">ice</option>
                                                <option value="2">feppe</option>
                                            </select>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <span class="oi oi-layers"></span>&nbsp;Quantities</span>
                                            </div>
                                            <input type="number" min="0" class="form-control text-center" value="1" name="input-bev-quantities" id="input-bev-quantities" onfocus="this.value=''">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-secondary" type="button" onclick="inc('input-bev-quantities');"><span class="oi oi-plus"></span></button>
                                            </div>
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-secondary" type="button" onclick="dec('input-bev-quantities');"><span class="oi oi-minus"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="input-group-prepend d-block">
                                            <span class="input-group-text">
                                                <span class="oi oi-beaker"></span>&nbsp;Modification</span>
                                        </div>
                                        <select class="custom-select" name="input-bev-mods" id="input-bev-mods" size="10" onfocus="this.value=''" multiple>
                                            <?php
                                            $result = mysqli_query($conn, "SELECT id, name, cost FROM mod_bev");
                                            while ($row = mysqli_fetch_array($result)) {
                                                echo "<option value='$row[id]'>$row[name] (+$row[cost]฿) </option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-10">
                                    </div>
                                    <div class="col-2"><button type="button" class="btn btn-primary btn-block" onclick="addBev();">add</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal-add-dish -->
            <div class="modal fade" id="modal-add-dish">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Add Dishes</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <span class="oi oi-basket"></span>&nbsp;Main Dish</span>
                                            </div>
                                            <select class="form-control text-center" name="input-dish-id" id="input-dish-id" onfocus="this.value=''">
                                                <?php
                                                $result = mysqli_query($conn, "SELECT id, name, cost FROM items WHERE item_type = 2");
                                                while ($row = mysqli_fetch_array($result)) {
                                                    echo "<option value='$row[id]'>$row[name] ($row[cost]฿)</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="input-group-prepend d-block">
                                            <span class="input-group-text">
                                                <span class="oi oi-beaker"></span>&nbsp;Modification</span>
                                        </div>
                                        <select class="custom-select" name="input-dish-mods" id="input-dish-mods" size="10" onfocus="this.value=''" multiple>
                                            <?php
                                            $result = mysqli_query($conn, "SELECT id, name, cost FROM mod_dish");
                                            while ($row = mysqli_fetch_array($result)) {
                                                echo "<option value='$row[id]'>$row[name] (+$row[cost]฿) </option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <span class="oi oi-layers"></span>&nbsp;Quantities</span>
                                            </div>
                                            <input type="number" min="0" class="form-control text-center" value="1" name="input-dish-quantities" id="input-dish-quantities">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-secondary" type="button" onclick="inc('input-dish-quantities');"><span class="oi oi-plus"></span></button>
                                            </div>
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-secondary" type="button" onclick="dec('input-dish-quantities');"><span class="oi oi-minus"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-10">
                                    </div>
                                    <div class="col-2"><button type="button" class="btn btn-primary btn-block" onclick="addDish()">add</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal-add-snack -->
            <div class="modal fade" id="modal-add-snack">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Add Snacks</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <span class="oi oi-basket"></span>&nbsp;Snack</span>
                                            </div>
                                            <select class="form-control text-center" name="input-snack-id" id="input-snack-id" onfocus="this.value=''">
                                                <?php
                                                $result = mysqli_query($conn, "SELECT id, name, cost FROM items WHERE item_type = 3");
                                                while ($row = mysqli_fetch_array($result)) {
                                                    echo "<option value='$row[id]'>$row[name] ($row[cost]฿)</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <span class="oi oi-layers"></span>&nbsp;Quantities</span>
                                            </div>
                                            <input type="number" min="0" class="form-control text-center" value="1" name="input-snack-quantities" id="input-snack-quantities">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-secondary" type="button" onclick="inc('input-snack-quantities');"><span class="oi oi-plus"></span></button>
                                            </div>
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-secondary" type="button" onclick="dec('input-snack-quantities');"><span class="oi oi-minus"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-10">
                                    </div>
                                    <div class="col-2"><button type="button" class="btn btn-primary btn-block" onclick="addSnack()">add</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal-adding-loader -->
            <div class="modal" id="modal-adding-loader">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div id="loader-loading">
                                    <span class="float-left">
                                        <img src="../assets/icon/loader/primary-loader.svg">
                                    </span>
                                    <span>
                                        <h3 class="text-primary float-right mt-3 mr-2">Adding order please wait . . .</h3>
                                    </span>
                                </div>
                                <div id="loader-complete" style="display:none;">
                                    <span>
                                        <h3 class="text-success text-center ">
                                            <span class="oi oi-check"></span> Successful
                                        </h3>
                                    </span>
                                </div>
                                <div id="loader-failed" style="display:none;">
                                    <span>
                                        <h3 class="text-danger text-center ">
                                            <span class="oi oi-circle-x"></span> failed
                                        </h3>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal-scan-user -->
            <div class="modal fade" id="modal-scan-user">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">find user</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="form-group">
                                    <label for=""></label>
                                    <input type="tel" class="form-control" name="" id="" aria-describedby="helpId" placeholder="type phone number . . ." oninput="userScan(this.value)">
                                </div>
                                <div id="user-show">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal-summary -->
            <div class="modal fade" id="modal-summary">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">summary</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div id="show-summary">
                                    summary field.
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-9">
                                    </div>
                                    <div class="col-3"><button type="button" class="btn btn-primary btn-block" onclick="">confirm</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        checkToken(sessionStorage.wbUsr, sessionStorage.wbToken);

        $('#navbar-main').load("../components/navbar-main/navbar-main.html #navbar-main");
        $.getScript("../components/navbar-main/navbar-main.js");
        
        //Order data
        var orderId = document.getElementById("input-order-id").value;
        //user data
        var userInfo= {id: "1", name: "GUEST", tel: "0", point: "0"};
        var discountState = 0;
        //added items (items storage & items status)
        var arrItems = [];
        var totalOrders = 0;
        var totalCost = 0;
        var point = 0;
        //----------------   
        var tmpBevProp;
        var tmpDishProp;
        var tmpSnackProp;
        //==================================================================================     
        function exeSQL(sql) { //ajax function  
            if (sql == null) {
                alert("list empty!");
            } else {
                document.getElementById("loader-complete").style.display = "none";
                document.getElementById("loader-failed").style.display = "none";
                document.getElementById("loader-loading").style.display = "initial";
                $("#modal-adding-loader").modal('show');
                confirmDiscount();
                $.ajax({
                    url: `/wb-app-03/ajax/addItems.php?
                sql=${sql}&cur_order_id=${document.getElementById("input-order-id").value}&point=${point}&cusId=${parseInt(userInfo.id)}`,
                    type: 'GET',
                    success: function(result) {
                        console.log(result);
                        document.getElementById("loader-loading").style.display = "none";
                        if (result != '2') { //0 or 1 is an error code [0 = mysql connection error, 1 = sql execution error]
                            document.getElementById("loader-failed").style.display = "initial";
                        } else {
                            document.getElementById("loader-complete").style.display = "initial";
                            clearTable();                                                                
                            window.location.replace("/wb-app-03/page/jobs-current.html");
                        }
                    }
                });
            }
        }

        function addBev() {
            updateBevProperties();
            arrItems.push(tmpBevProp);
            totalOrders += parseInt(tmpBevProp.quantities);
            totalCost += tmpBevProp.cost_total;
            var table = document.getElementById("table-items");
            var row = table.insertRow();
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            row.classList.add("w3-animate-top");
            cell1.innerHTML = tmpBevProp.details;
            cell1.classList.add("text-left");
            cell2.innerHTML = tmpBevProp.cost_per_piece;
            cell3.innerHTML = tmpBevProp.quantities;
            cell4.innerHTML = tmpBevProp.cost_total;
            //create button 
            var delBtn = document.createElement("BUTTON");
            delBtn.innerHTML = "<span class='oi oi-delete'></span>";
            delBtn.classList.add("btn");
            delBtn.classList.add("btn-danger");
            delBtn.setAttribute("id", `row-${arrItems.length}`);
            delBtn.onclick = function() {
                //console.log(this.parentElement.parentElement.rowIndex);
                var rowId = this.parentElement.parentElement.rowIndex;
                totalOrders -= parseInt(arrItems[rowId - 1].quantities);
                totalCost -= arrItems[rowId - 1].cost_total;
                table.deleteRow(rowId - 1);
                arrItems.splice(rowId - 1, 1);
                updateTotalCost();
                updateTotalOrders();
                calBalance();
            }
            cell5.appendChild(delBtn);
            updateTotalCost();
            updateTotalOrders();
            calBalance();
            point += parseInt(tmpBevProp.quantities);
        }

        function addDish() {
            updateDishProperties();
            arrItems.push(tmpDishProp);
            totalOrders += parseInt(tmpDishProp.quantities);
            totalCost += tmpDishProp.cost_total;
            var table = document.getElementById("table-items");
            var row = table.insertRow();
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            row.classList.add("w3-animate-top");
            cell1.innerHTML = tmpDishProp.details;
            cell1.classList.add("text-left");
            cell2.innerHTML = tmpDishProp.cost_per_piece;
            cell3.innerHTML = tmpDishProp.quantities;
            cell4.innerHTML = tmpDishProp.cost_total;
            //create button 
            var delBtn = document.createElement("BUTTON");
            delBtn.innerHTML = "<span class='oi oi-delete'></span>";
            delBtn.classList.add("btn");
            delBtn.classList.add("btn-danger");
            delBtn.setAttribute("id", `row-${arrItems.length}`);
            delBtn.onclick = function() {
                //console.log(this.parentElement.parentElement.rowIndex);
                var rowId = this.parentElement.parentElement.rowIndex;
                totalOrders -= parseInt(arrItems[rowId - 1].quantities);
                totalCost -= arrItems[rowId - 1].cost_total;
                table.deleteRow(rowId - 1);
                arrItems.splice(rowId - 1, 1);
                updateTotalCost();
                updateTotalOrders();
                calBalance();
            }
            cell5.appendChild(delBtn);
            updateTotalCost();
            updateTotalOrders();
            calBalance();
        }

        function addSnack() {
            updateSnackProperties();
            arrItems.push(tmpSnackProp);
            totalOrders += parseInt(tmpSnackProp.quantities);
            totalCost += tmpSnackProp.cost_total;
            var table = document.getElementById("table-items");
            var row = table.insertRow();
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            row.classList.add("w3-animate-top");
            cell1.innerHTML = tmpSnackProp.details;
            cell1.classList.add("text-left");
            cell2.innerHTML = tmpSnackProp.cost_per_piece;
            cell3.innerHTML = tmpSnackProp.quantities;
            cell4.innerHTML = tmpSnackProp.cost_total;
            //create button 
            var delBtn = document.createElement("BUTTON");
            delBtn.innerHTML = "<span class='oi oi-delete'></span>";
            delBtn.classList.add("btn");
            delBtn.classList.add("btn-danger");
            delBtn.setAttribute("id", `row-${arrItems.length}`);
            delBtn.onclick = function() {
                //console.log(this.parentElement.parentElement.rowIndex);
                var rowId = this.parentElement.parentElement.rowIndex;
                totalOrders -= parseInt(arrItems[rowId - 1].quantities);
                totalCost -= arrItems[rowId - 1].cost_total;
                table.deleteRow(rowId - 1);
                arrItems.splice(rowId - 1, 1);
                updateTotalCost();
                updateTotalOrders();
                calBalance();
            }
            cell5.appendChild(delBtn);
            updateTotalCost();
            updateTotalOrders();
            calBalance();
        }

        function updateBevProperties() {
            var mods = $("#input-bev-mods").val();
            var modsStr = ``;
            mods.forEach(element => {
                modsStr += `${element},`;
            });
            modsStr = modsStr.slice(0, -1);
            tmpBevProp = {
                "id": document.getElementById("input-bev-id").value,
                "type_id": document.getElementById("input-bev-type").value,
                "quantities": document.getElementById("input-bev-quantities").value,
                "mods": modsStr,
                "cost_per_piece": 0,
                "cost_total": 0,
                "details": ""
            };
            $.ajax({
                url: `../ajax/bev_calculation.php?
                id=${tmpBevProp.id}&
                type_id=${tmpBevProp.type_id}&
                mods=${tmpBevProp.mods}`,
                type: 'GET',
                async: false,
                success: function(result) {
                    var tmpJSON = JSON.parse(result);
                    tmpBevProp.cost_per_piece = tmpJSON.cost_per_piece;
                    tmpBevProp.details = tmpJSON.item_details;
                    tmpBevProp.cost_total = tmpBevProp.quantities * tmpBevProp.cost_per_piece;
                }
            });
        }

        function updateDishProperties() {
            var mods = $("#input-dish-mods").val();
            var modsStr = ``;
            mods.forEach(element => {
                modsStr += `${element},`;
            });
            modsStr = modsStr.slice(0, -1);
            tmpDishProp = {
                "id": document.getElementById("input-dish-id").value,
                "quantities": document.getElementById("input-dish-quantities").value,
                "mods": modsStr,
                "cost_per_piece": 0,
                "cost_total": 0,
                "details": ""
            };
            $.ajax({
                url: `../ajax/dish_calculation.php?
                id=${tmpDishProp.id}&                
                mods=${tmpDishProp.mods}`,
                type: 'GET',
                async: false,
                success: function(result) {
                    var tmpJSON = JSON.parse(result);
                    tmpDishProp.cost_per_piece = tmpJSON.cost_per_piece;
                    tmpDishProp.details = tmpJSON.item_details;
                    tmpDishProp.cost_total = tmpDishProp.quantities * tmpDishProp.cost_per_piece;
                }
            });
        }

        function updateSnackProperties() {
            var mods = $("#input-snack-mods").val();
            tmpSnackProp = {
                "id": document.getElementById("input-snack-id").value,
                "quantities": document.getElementById("input-snack-quantities").value,
                "cost_per_piece": 0,
                "cost_total": 0,
                "details": ""
            };
            $.ajax({
                url: `../ajax/snack_calculation.php?
                id=${tmpSnackProp.id}`,
                type: 'GET',
                async: false,
                success: function(result) {
                    var tmpJSON = JSON.parse(result);
                    tmpSnackProp.cost_per_piece = tmpJSON.cost_per_piece;
                    tmpSnackProp.details = tmpJSON.item_details;
                    tmpSnackProp.cost_total = tmpSnackProp.quantities * tmpSnackProp.cost_per_piece;
                }
            });
        }

        function clearTable() {
            arrItems = [];
            totalOrders = 0;
            totalCost = 0;
            var new_body = document.createElement("TBODY");
            new_body.setAttribute("id", "table-items");
            document.getElementById("table-items").replaceWith(new_body);
            updateTotalCost();
            updateTotalOrders();
            calBalance();
        }

        function inc(id) {
            document.getElementById(id).value++;
        }

        function dec(id) {
            if (document.getElementById(id).value > 0) {
                document.getElementById(id).value--;
            }
        }

        function alertArrItems() {
            /*var msg = ``;
            arrItems.forEach(element => {
                msg += ` ${element.details}\n`;
                msg += ` Quantities: ${element.quantities}\n`;
                msg += ` Total Cost: ${element.cost_total}\n`;
                msg += "========================================\n";
            });
            alert(msg);*/
        }

        function createSQL() {
            if (arrItems.length == 0) {
                return null;
            } else {
                var orderId = document.getElementById("input-order-id").value;
                var cusId = document.getElementById("input-customer-id").value;
                var agentId = sessionStorage.wbUsrId; //root         
                var mods;
                var sql =
                    `INSERT INTO proc_trans (order_id, cus_id, item_id, mod_item, abs_cost, unit, agent_id, item_details) VALUES `;
                arrItems.forEach(element => {
                    if (element.mods == "" || element.mods == undefined) {
                        mods = 'NULL';
                    } else {
                        mods = `'${element.mods}'`;
                    }
                    sql +=
                        `(${orderId},${cusId},${element.id},${mods},${element.cost_per_piece},${element.quantities},${agentId}, '${element.details}'),`;
                });
                sql = sql.slice(0, -1);
                return sql;
            }
            //console.log(sql);
        }

        function updateTotalOrders() {
            document.getElementById("total-order").innerText = totalOrders;
        }

        function updateTotalCost() {
            document.getElementById("total-cost").value = totalCost;
        }

        function showSummary() {
            var el_summary = document.getElementById("show-summary");
            el_summary.innerHTML = totalCost;
        }

        function userScan(value) {
            var tmpJSON = "";
            //document.getElementById("user-show").innerHTML = value;
            $.ajax({
                url: `/wb-app-03/ajax/userScan.php?str=${value}`,
                type: 'GET',
                success: function(result) {
                    var tmp_el_user_show = document.getElementById("user-show");
                    tmp_el_user_show.innerHTML = "";
                    if (result != "") {
                        tmpJSON = JSON.parse(result);
                        console.log(tmpJSON.length);
                        tmpJSON.forEach(el => {
                            //console.log(el["name"]);                                                     
                            var tmp_el_a = document.createElement("A");
                            tmp_el_a.href = "#";
                            tmp_el_a.addEventListener("click",
                                function() {
                                    document.getElementById("input-customer-show").value = `${el["name"]} (${el["point"]} pt.)`;
                                    document.getElementById("input-customer-id").value = el["id"];
                                    $('#modal-scan-user').modal('hide');
                                    userInfo = el;
                                    if (el["point"] >= 10) {
                                        document.getElementById("discount-btn").style.display = "";
                                    } else {
                                        document.getElementById("discount-btn").style.display = "none";
                                    }
                                });
                            tmp_el_a.innerHTML = `name: ${el["name"]} tel: ${el["tel"]}`;
                            tmp_el_user_show.appendChild(tmp_el_a);
                            tmp_el_user_show.appendChild(document.createElement("br"));
                        });
                    }
                }
            });
        }

        function calBalance() {
            document.getElementById("balance").value = document.getElementById("cash").value - totalCost;
        }

        function useDiscount() {
            if (discountState == 0) {
                discountState = 1;
                totalCost -= 40;
                updateTotalCost();
                calBalance();
                $("#total-cost").addClass("w3-animate-zoom border border-warning text-warning font-weight-bold");
            } else if (discountState == 1) {
                discountState = 0;
                totalCost += 40;
                updateTotalCost();
                calBalance();
                $("#total-cost").removeClass("w3-animate-zoom border border-warning text-warning font-weight-bold");
            }
        }

        function confirmDiscount() {
            if (discountState == 1) {
                alert("discount complete");
                $.ajax({
                    url: `/wb-app-03/ajax/service/useDiscount.php?customerId=${userInfo.id}&orderId=${orderId}`,
                    type: 'GET',
                    success: function(result) {
                        console.log(result);                        
                    }
                });
            }
        }
    </script>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../assets/bootstrap/js/bootstrap.bundle.js" crossorigin="anonymous"></script>
    <script src="../assets/bootstrap/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../assets/bootstrap/js/bootstrap.js" crossorigin="anonymous"></script>
</body>

</html>