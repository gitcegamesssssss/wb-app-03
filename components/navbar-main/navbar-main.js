var pathname = window.location.pathname;
var arrPath = pathname.split('/');
var arrCur = arrPath[arrPath.length - 1].split('.');
var page = arrCur[0];
console.log(page);

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
    case 'report-today':
        $('#report-today').addClass('active');
        $('#report').addClass('active');
        break;
    case 'report-stat':
        $('#report-stat').addClass('active');
        $('#report').addClass('active');
        break;
    default:
        break;
}
/*$('.nav-item .nav-link').click(function () {
    $('.nav-item .nav-link').removeClass("active");
    $(this).toggleClass("active");
});
$('.dropdown-item').click(function () {
    $('.dropdown-item').removeClass("active");
    $(this).toggleClass("active");
});*/