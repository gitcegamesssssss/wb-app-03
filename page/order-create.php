<?php
$host = "localhost";
$database = "wbdb";
$username = "root";
$password = "";
$conn = mysqli_connect($host, $username, $password, $database);
?>
<!doctype html>
<html lang="en">

<head>
    <title>+Order create</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="../assets/icon/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
</head>

<body>
    <div class="w3-animate-left" id="navbar-main">
    </div>
    <div class="container-fluid m-3">
        <div class="row">
            <!-- input and controller -->
            <div class="col-2 w3-animate-right">
                <div class="row">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="input-order-id">
                                <span class="oi oi-layers"></span>&nbsp;Order id</span>
                        </div>
                        <input type="text" class="form-control text-center" disabled value="1">
                    </div>
                </div>
                <div class="row">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="input-customer-id">
                                <span class="oi oi-people"></span>&nbsp;Customer</span>
                        </div>
                        <input type="text" class="form-control text-center" value="GUEST">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-secondary" type="button"><span class="oi oi-magnifying-glass"></span></button>
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
            <div class="col-10 w3-animate-top">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-header">
                            Current Orders ( Total Order:
                            <span class="font-weight-bold" id="total-order">0</span> ea. , Total Cost:
                            <span class="font-weight-bold text-danger" id="total-cost">0</span> <span class="font-weight-bold text-danger">฿</span> )
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
                            <button type="button" class="btn btn-success float-right" onclick="alertArrItems()">
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
                                            <select class="form-control text-center" name="input-bev-id" id="input-bev-id">
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
                                            <select class="form-control text-center" name="input-bev-type" id="input-bev-type">
                                                <option value="0">hot</option>
                                                <option value="1">ice</option>
                                                <option value="2">feppe</option>
                                            </select>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <span class="oi oi-layers"></span>&nbsp;Quantities</span>
                                            </div>
                                            <input type="number" class="form-control text-center" value="1" name="input-bev-quantities" id="input-bev-quantities">
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
                                    <div class="col-6">
                                        <div class="input-group-prepend d-block">
                                            <span class="input-group-text">
                                                <span class="oi oi-beaker"></span>&nbsp;Modification</span>
                                        </div>
                                        <select class="custom-select" name="input-bev-mods" id="input-bev-mods" multiple>
                                            <?php
                                            $result = mysqli_query($conn, "SELECT id, name, cost FROM mod_bev");
                                            while ($row = mysqli_fetch_array($result)) {
                                                echo "<option value='$row[id]'>$row[name] (+$row[cost]฿) </option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <div class="container-fluid">
                                            <button class="btn btn-primary"><span class="oi oi-list" onclick="updateBevProperties()"></span>&nbsp;&nbsp;View details</button>
                                            <div id="list-of-details">
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
                                        <span class="float-right">
                                            per piece : <span class="font-weight-bold text-primary" name="mon-bev-price-piece" id="mon-bev-price-piece">x</span>
                                            &nbsp;฿
                                            totals : <span class="font-weight-bold text-primary" name="mon-bev-price-total" id="mon-bev-price-total">x</span>
                                            &nbsp;฿
                                        </span>
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
                <div class="modal-dialog modal-dialog-centered">
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
                                            <select class="form-control text-center" name="input-dish-id" id="input-dish-id">
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
                                        <select class="custom-select" name="input-dish-mods" id="input-dish-mods" size="10" multiple>
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
                                            <input type="number" class="form-control text-center" value="1" name="input-dish-quantities" id="input-dish-quantities">
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
                                        <span class="float-right">
                                            per piece : <span class="font-weight-bold text-primary" name="mon-bev-price-piece" id="mon-bev-price-piece">x</span>
                                            &nbsp;฿
                                            totals : <span class="font-weight-bold text-primary" name="mon-bev-price-total" id="mon-bev-price-total">x</span>
                                            &nbsp;฿
                                        </span>
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
                <div class="modal-dialog modal-dialog-centered">
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
                                            <select class="form-control text-center" name="input-snack-id" id="input-snack-id">
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
                                            <input type="number" class="form-control text-center" value="1" name="input-snack-quantities" id="input-snack-quantities">
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
                                        <span class="float-right">
                                            per piece : <span class="font-weight-bold text-primary" name="mon-bev-price-piece" id="mon-bev-price-piece">x</span>
                                            &nbsp;฿
                                            totals : <span class="font-weight-bold text-primary" name="mon-bev-price-total" id="mon-bev-price-total">x</span>
                                            &nbsp;฿
                                        </span>
                                    </div>
                                    <div class="col-2"><button type="button" class="btn btn-primary btn-block" onclick="addSnack()">add</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#navbar-main').load("../components/navbar-main/navbar-main.html #navbar-main");
        $.getScript("../components/navbar-main/navbar-main.js");
        //added items (items storage & items status)
        var arrItems = [];
        var totalOrders = 0;
        var totalCost = 0;
        //----------------   
        var tmpBevProp;
        var tmpDishProp;
        var tmpSnackProp;
        //==================================================================================   
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
            }
            cell5.appendChild(delBtn);
            updateTotalCost();
            updateTotalOrders();
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
            }
            cell5.appendChild(delBtn);
            updateTotalCost();
            updateTotalOrders();
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
            }
            cell5.appendChild(delBtn);
            updateTotalCost();
            updateTotalOrders();
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
            var msg = ``;
            arrItems.forEach(element => {
                msg += ` ${element.details}\n`;
                msg += ` Quantities: ${element.quantities}\n`;
                msg += ` Total Cost: ${element.cost_total}\n`;
                msg += "========================================\n";
            });
            alert(msg);
        }

        function updateTotalOrders() {
            document.getElementById("total-order").innerText = totalOrders;
        }

        function updateTotalCost() {
            document.getElementById("total-cost").innerText = totalCost;
        }
    </script>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../assets/bootstrap/js/bootstrap.bundle.js" crossorigin="anonymous"></script>
    <script src="../assets/bootstrap/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../assets/bootstrap/js/bootstrap.js" crossorigin="anonymous"></script>
</body>

</html>