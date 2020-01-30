<?php
    /**
     * for listing item by URL parameter
     * type
     *  - 0 = all
     *  - 1 = beverages
     *  - 2 = dishes
     *  - 3 = snacks     
     * return
     *  - list of selected type
     *  - "0" is type on set or something wrong
    */

    if(isset($_GET['type'])){
        $host = "localhost";
        $username = "root";
        $password = "";
        $database = "wbdb";
        $conn = new mysqli($host, $username, $password, $database);
        mysqli_set_charset($conn, "utf8");

        if($_GET['type'] == 0){
            $sql = "SELECT name, item_type FROM items ORDER BY item_type";
        }else{            
            $sql = "SELECT name, item_type FROM items WHERE item_type = $_GET[type]";
        }

        $result = mysqli_query($conn, $sql);
        $jsonStr = "[";
        while($row = mysqli_fetch_array($result)){
            $tmpObj = new stdClass();
            $tmpObj->name = $row['name'];
            $tmpObj->type = $row['item_type'];

            $tmpJSON = json_encode($tmpObj);
            $jsonStr .= $tmpJSON . ",";
        }
        $jsonStr = substr($jsonStr, 0, -1);
        $jsonStr .= "]";
        die($jsonStr);
    }else{
        die("0");
    }