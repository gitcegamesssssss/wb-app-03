function checkToken(username, token) {
    $.post("/wb-app-03/ajax/checktoken.php",
        {
            username: `${username}`,
            token: `${token}`
        },
        function (data) {
            if (data == '0') {
                window.location.href = "/wb-app-03/page/login/";
            }else {
                $('body').removeAttr("style");
            }
        }
    );
}