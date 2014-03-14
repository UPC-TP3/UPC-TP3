$(document).ready(function () {
    $("#txtNroDocumento").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key >= 48 && key <= 57);
    });


    $("#txtTelefono").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key >= 48 && key <= 57);
    });


    $("#txtCelular").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key >= 48 && key <= 57);
    });

    $("#txtNombre").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key == 13 || (key >= 65 && key <= 90) || (key >= 97 && key <= 122));
    });

    $("#txtApellidoP").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key == 13 || (key >= 65 && key <= 90) || (key >= 97 && key <= 122));
    });
    $("#txtApellidoM").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key == 13 || (key >= 65 && key <= 90) || (key >= 97 && key <= 122));
    });
});

function fnMensaje(pvMensaje) {
    alert(pvMensaje);
    fnLimpiarControles();
}

function fnLimpiarControles() {
    $("#txtApellidoP").val('');
    $("#txtApellidoM").val('');
    $("#txtNombre").val('');
    $("#txtDireccionN").val('');
    $("#txtNroDocumento").val('');
    $("#txtTelefono").val('');
    $("#txtCelular").val('');
    $("#ddlTipoDocumentoN").val('0');
    $("#ddlSexo").val('-1');
    $("#txtFechaNac").val('');
}