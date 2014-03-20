$(document).ready(function () {
    objPage.initialize();

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
        return (key == 32 || (key >= 65 && key <= 90) || (key >= 97 && key <= 122));
    });
    $("#txtOcupacion").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key == 32 || (key >= 65 && key <= 90) || (key >= 97 && key <= 122));
    });

    $("#txtApellidoP").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key == 32 || (key >= 65 && key <= 90) || (key >= 97 && key <= 122));
    });
    $("#txtApellidoM").keypress(function (event) {
        var nav4 = window.event ? true : false;
        var key = nav4 ? event.which : event.keyCode;
        return (key == 32 || (key >= 65 && key <= 90) || (key >= 97 && key <= 122));
    });

    $("#ddlPais").change(function () {
        // armo el objeto que servira de parametro, para ello utilizo una libreria de JSON
        //este parametro mapeara con el definido en el web service
        var params = new Object();
        params.p_Valor = $("#ddlPais").val();
        params = JSON.stringify(params);

        $.ajax({
            type: "POST",
            url: "GcAdmActualizarPaciente.aspx/pr_CargarCboDepartamento",
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: CargarDpto,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus + ": " + XMLHttpRequest.responseText);
            }
        });

    });

    $("#ddlDepartamento").change(function () {
        // armo el objeto que servira de parametro, para ello utilizo una libreria de JSON
        //este parametro mapeara con el definido en el web service
        var params = new Object();
        params.p_Valor = $("#ddlDepartamento").val();
        params = JSON.stringify(params);

        $.ajax({
            type: "POST",
            url: "GcAdmActualizarPaciente.aspx/pr_CargarCboProvincia",
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: CargarProvincia,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus + ": " + XMLHttpRequest.responseText);
            }
        });

    });

    $("#ddlProvincia").change(function () {
        // armo el objeto que servira de parametro, para ello utilizo una libreria de JSON
        //este parametro mapeara con el definido en el web service
        var params = new Object();
        params.p_Valor = $("#ddlProvincia").val();
        params = JSON.stringify(params);

        $.ajax({
            type: "POST",
            url: "GcAdmActualizarPaciente.aspx/pr_CargarCboDistrito",
            data: params,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: CargarDistrito,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus + ": " + XMLHttpRequest.responseText);
            }
        });

    });
});

var Page = function (pContainer) {
    this.container = pContainer;
};

Page.prototype = {
    initialize: function () {
        this.hddIdTipoDoc = $('#hddIdTipoDoc');
        this.hddIDPaciente = $('#hddIDPaciente');
        this.hddAccion = $('#hddAccion');
        this.txtTipoDocumento = $('#txtTipoDocumento');
        this.txtDocumento = $('#txtNroDocumento');
        this.txtNombre = $('#txtNombre');
        this.txtApellidoP = $('#txtApellidoP');
        this.txtApellidoM = $('#txtApellidoM');
        this.txtFechaNac = $('#txtFechaNac');
        this.txtDireccionN = $('#txtDireccionN');
        this.txtTelefono = $('#txtTelefono');
        this.txtCelular = $('#txtCelular');
        this.ddlSexo = $('#ddlSexo');
        this.ddlPais = $('#ddlPais');
        this.ddlDepartamento = $('#ddlDepartamento');
        this.ddlProvincia = $('#ddlProvincia');
        this.ddDistrito = $('#ddDistrito');
        this.ddlEstadoCivil = $('#ddlEstadoCivil');
        this.txtCorreo = $('#txtCorreo');
        this.txtOcupacion = $('#txtOcupacion');
        this.btnGuardar = $('#btnGuardar');
        this.btnSalir = $('#btnSalir');
        this.bind();
        return false;
    },
    bind: function () {
        this.btnGuardar.click(this.ActualizarPaciente);
        this.btnSalir.click(this.Salir);
        return false;
    },
    ActualizarPaciente: function () {

        if (objPage.txtNombre.val().length < 2) {
            alert("Ingrese un Nombre Correcto");
            objPage.txtNombre.focus();
            return false;
        }
        if (objPage.txtApellidoP.val().length < 1) {
            alert("Ingrese un Apellido Paterno Correcto");
            objPage.txtApellidoP.focus();
            return false;
        }
        if (objPage.txtApellidoM.val().length < 1) {
            alert("Ingrese un Apellido Materno Correcto");
            objPage.txtApellidoM.focus();
            return false;
        }

        if (objPage.ddlSexo.val() == "0") {
            alert("Seleccionar Sexo");
            objPage.ddlSexo.focus();
            return false;
        }


        if (objPage.txtDireccionN.val().length < 5) {
            alert("Ingrese un Dirección Correcto");
            objPage.txtDireccionN.focus();
            return false;
        }
        if (objPage.ddlEstadoCivil.val() == "0") {
            alert("Seleccionar Estado Civil");
            objPage.ddlEstadoCivil.focus();
            return false;
        }

        if (objPage.txtFechaNac.val().length < 10) {
            alert("Ingrese una de Fecha Nacimiento Correcta");
            objPage.txtFechaNac.focus();
            return false;
        }
        var today = new Date();
        var date2 = new Date(objPage.txtFechaNac.val());

        if (date2 > today) {
            alert("Fecha Nacimiento Incorrecta");
            objPage.txtFechaNac.focus();
            return false;
        }

        if (objPage.txtTelefono.val() != "") {
            if (objPage.txtTelefono.val().length < 7) {
                alert("Ingrese un Número telefonico Correcto");
                objPage.txtTelefono.focus();
                return false;
            }
        }
        if (objPage.txtCelular.val() != "") {
            if (objPage.txtCelular.val().length < 7) {
                alert("Ingrese un Número Celular Correcto");
                objPage.txtCelular.focus();
                return false;
            }
        }
        if (objPage.ddlPais.val() == "0") {
            alert("Seleccionar Pais");
            objPage.ddlPais.focus();
            return false;
        }
        if (objPage.ddlDepartamento.val() == "0") {
            alert("Seleccionar Departamento");
            objPage.ddlDepartamento.focus();
            return false;
        }
        if (objPage.ddlProvincia.val() == "0") {
            alert("Seleccionar Provincia");
            objPage.ddlProvincia.focus();
            return false;
        }
        if (objPage.ddDistrito.val() == "0") {
            alert("Seleccionar Distrito");
            objPage.ddDistrito.focus();
            return false;
        }

        if (objPage.txtOcupacion.val() != "") {
            if (objPage.txtOcupacion.val().length < 7) {
                alert("Ingrese Ocupación Correcta");
                objPage.txtOcupacion.focus();
                return false;
            }
        }
        if (objPage.txtCorreo.val() != "") {
            expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!expr.test(objPage.txtCorreo.val())) {
                alert("Dirección de correo incorrecta.");
                objPage.txtCorreo.focus();
                return false;
            }
        }
        var objData = {
            IdPaciente: objPage.hddIDPaciente.val(),
            NroDocumento: objPage.txtDocumento.val(),
            TipoDocumento: objPage.hddIdTipoDoc.val(),
            Nombre: objPage.txtNombre.val(),
            ApellidoP: objPage.txtApellidoP.val(),
            ApellidoM: objPage.txtApellidoM.val(),
            FechaNac: objPage.txtFechaNac.val(),
            Direccion: objPage.txtDireccionN.val(),
            Telefono: objPage.txtTelefono.val(),
            Celular: objPage.txtCelular.val(),
            Sexo: objPage.ddlSexo.val(),
            Pais: objPage.ddlPais.val(),
            Departamento: objPage.ddlDepartamento.val(),
            Provincia: objPage.ddlProvincia.val(),
            Distrito: objPage.ddDistrito.val(),
            EstadoCivil: objPage.ddlEstadoCivil.val(),
            Correo: objPage.txtCorreo.val(),
            Ocupacion: objPage.txtOcupacion.val()
        };
        var args = Sys.Serialization.JavaScriptSerializer.serialize(objData);
        fn_Paciente_Call(args, function (output, context) {
            var objResult = Sys.Serialization.JavaScriptSerializer.deserialize(output);
            if (objResult.Result == true) {

                if (objPage.hddAccion.val() == "1") {
                    alert(objResult.Message);
                    fnLimpiarControles();
                } else {
                    alert(objResult.Message);
                    location.href("GcAdmVerificarPaciente.aspx");
                }
            } else {
                alert(objResult.Message);
                //fnLimpiarControles();
            }
        });
        //fnLimpiarControles();
        return false;
    },
    Salir: function () {
        location.href("GcAdmVerificarPaciente.aspx");
        return false;
    }
};

function fnLimpiarControles() {
    objPage.txtApellidoM.val('');
    objPage.txtApellidoP.val('');
    objPage.txtNombre.val('');
    objPage.hddIdTipoDoc.val(''); 
    objPage.hddIDPaciente.val('');
    objPage.hddAccion.val('');

    objPage.txtTipoDocumento.val('');
    objPage.txtFechaNac.val('')
    objPage.txtDireccionN.val('');
    objPage.txtDocumento.val('');
    objPage.txtTelefono.val('');
    objPage.txtCelular.val('');
    objPage.ddlSexo.val('-1');
    objPage.txtCorreo.val('');
    objPage.txtOcupacion.val('')
    objPage.ddlEstadoCivil.val('0');
    objPage.ddlPais.val('0');
    objPage.ddlDepartamento.html('');
    objPage.ddlProvincia.html('');
    objPage.ddDistrito.html('');
    objPage.ddlDepartamento.append($("<option></option>").attr("value", "0").text("-Seleccione-"));
    objPage.ddlProvincia.append($("<option></option>").attr("value", "0").text("-Seleccione-"));
    objPage.ddDistrito.append($("<option></option>").attr("value", "0").text("-Seleccione-"));
};
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