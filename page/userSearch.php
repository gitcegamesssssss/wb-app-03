<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="refresh" content="60">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/wb-app-03/js/main.js"></script>    
    <link href="../assets/icon/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>
    <div class="container">
        <div class="form-group">
            <label for=""></label>
            <input type="tel" class="form-control" name="" id="phone" aria-describedby="helpId" placeholder="" oninput="userScan(this.value)">
            <small id="helpId" class="form-text text-muted">search</small>
        </div>
        <div id="user-show">            
        </div>
    </div>
    <script>        
        $("#phone").inputmask({"mask": "999-9999999"});
        function userScan(value) {
            var tmpJSON = "";            
            //document.getElementById("user-show").innerHTML = value;
            $.ajax({
                url: `/wb-app-03/ajax/userScan.php?str=${value}`,
                type: 'GET',
                success: function(result) {
                    if (result != "") {
                        var tmp_el_user_show = document.getElementById("user-show");
                        tmp_el_user_show.innerHTML = "";
                        tmpJSON = JSON.parse(result);
                        console.log(tmpJSON.length);
                        tmpJSON.forEach(el => {
                            //console.log(el["name"]);                                                     
                            var tmp_el_a = document.createElement("A");
                            tmp_el_a.href = "#";
                            tmp_el_a.addEventListener("click",
                                function() {
                                    alert("Hello World!");
                                });
                            tmp_el_a.innerHTML = `name: ${el["name"]} tel: ${el["tel"]}`;
                            tmp_el_user_show.appendChild(tmp_el_a);
                            tmp_el_user_show.appendChild(document.createElement("br"));
                        });
                    }
                }
            });
        }
    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../assets/bootstrap/js/bootstrap.js" crossorigin="anonymous"></script>
</body>

</html>