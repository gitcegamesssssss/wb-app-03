var pathname = window.location.pathname;
var arrPath = pathname.split('/');
var arrCur = arrPath[arrPath.length - 1].split('.');
var page = arrCur[0];
console.log(page);
document.getElementById("infoUsr").innerText = sessionStorage.wbUsr;

switch (page) {
    case 'conn-device':
        $('#conn-device').addClass('active');
        break;
    case 'jobs-current':
        $('#jobs-current').addClass('active');
        $('#jobs').addClass('active');
        break;
    case 'jobs-finished':
        $('#jobs-finished').addClass('active');
        $('#jobs').addClass('active');
        break;
    case 'report-overview':
        $('#report-overview').addClass('active');
        $('#report').addClass('active');
        break;
    case 'report-details':
        $('#report-details').addClass('active');
        $('#report').addClass('active');
        break;
    default:
        break;
}

if(sessionStorage.wbUserType == 1){
    document.getElementById("report").style.display = "none";
}
/*$('.nav-item .nav-link').click(function () {
    $('.nav-item .nav-link').removeClass("active");
    $(this).toggleClass("active");
});
$('.dropdown-item').click(function () {
    $('.dropdown-item').removeClass("active");
    $(this).toggleClass("active");
});*/