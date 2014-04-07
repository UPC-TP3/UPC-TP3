$(document).ready(function () {
    $("#txtNroDocumento").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key >= 48 && key <= 57);
    });

//    $("#ddlPais").change(function () {
//        // armo el objeto que servira de parametro, para ello utilizo una libreria de JSON
//        //este parametro mapeara con el definido en el web service
//        var params = new Object();
//        params.p_Valor = $("#ddlPais").val();
//        params = JSON.stringify(params);

//        $.ajax({
//            type: "POST",
//            url: "GcAdmEmergenciaRegistrar.aspx/pr_CargarCboDepartamento",
//            data: params,
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            async: false,
//            success: CargarDpto,
//            error: function (XMLHttpRequest, textStatus, errorThrown) {
//                alert(textStatus + ": " + XMLHttpRequest.responseText);
//            }
//        });

//    });

//    $("#ddlDepartamento").change(function () {
//        // armo el objeto que servira de parametro, para ello utilizo una libreria de JSON
//        //este parametro mapeara con el definido en el web service
//        var params = new Object();
//        params.p_Valor = $("#ddlDepartamento").val();
//        params = JSON.stringify(params);

//        $.ajax({
//            type: "POST",
//            url: "GcAdmEmergenciaRegistrar.aspx/pr_CargarCboProvincia",
//            data: params,
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            async: false,
//            success: CargarProvincia,
//            error: function (XMLHttpRequest, textStatus, errorThrown) {
//                alert(textStatus + ": " + XMLHttpRequest.responseText);
//            }
//        });

//    });

//    $("#ddlProvincia").change(function () {
//        // armo el objeto que servira de parametro, para ello utilizo una libreria de JSON
//        //este parametro mapeara con el definido en el web service
//        var params = new Object();
//        params.p_Valor = $("#ddlProvincia").val();
//        params = JSON.stringify(params);

//        $.ajax({
//            type: "POST",
//            url: "GcAdmEmergenciaRegistrar.aspx/pr_CargarCboDistrito",
//            data: params,
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            async: false,
//            success: CargarDistrito,
//            error: function (XMLHttpRequest, textStatus, errorThrown) {
//                alert(textStatus + ": " + XMLHttpRequest.responseText);
//            }
//        });

//    });

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
function CargarDpto(result) {
    $("#ddlDepartamento").html("");
    $.each(result.d, function () {
        $("#ddlDepartamento").append($("<option></option>").attr("value", this.MAS_CodCampo).text(this.MAS_DesCorta))
    });
};

function CargarProvincia(result) {
    $("#ddlProvincia").html("");
    $.each(result.d, function () {
        $("#ddlProvincia").append($("<option></option>").attr("value", this.MAS_CodCampo).text(this.MAS_DesCorta))
    });
};
function CargarDistrito(result) {
    $("#ddDistrito").html("");
    $.each(result.d, function () {
        $("#ddDistrito").append($("<option></option>").attr("value", this.MAS_CodCampo).text(this.MAS_DesCorta))
    });
};

