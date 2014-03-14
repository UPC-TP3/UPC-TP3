$(document).ready(function () {
    $("#txtDocumento").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key <= 13 || (key >= 48 && key <= 57) || key == 44);
    });

});

function fnMensaje(p_vMensaje) {
    alert(p_vMensaje);

}