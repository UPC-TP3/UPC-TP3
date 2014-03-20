$(document).ready(function () {
    objPage.initialize();

    $("#ddlTipoDocumento").change(function () {
        // armo el objeto que servira de parametro, para ello utilizo una libreria de JSON
        //este parametro mapeara con el definido en el web service
        if ($("#ddlTipoDocumento").val() == "1") {
            $("#txtDocumento").keypress(function (event) {
                var nav4 = window.event ? true : false;
                var key = nav4 ? event.which : event.keyCode;
                return (key <= 13 || (key >= 48 && key <= 57) || key == 44);
            });
        }
        else if ($("#ddlTipoDocumento").val() == "2") {
            $("#txtDocumento").keypress(function (event) {
                var nav4 = window.event ? true : false;
                var key = nav4 ? event.which : event.keyCode;
                return (key <= 13 || (key >= 65 && key <= 90) || (key >= 48 && key <= 57) || key == 44);
            });
        }
        else if ($("#ddlTipoDocumento").val() == "3") {
            $("#txtDocumento").keypress(function (event) {
                var nav4 = window.event ? true : false;
                var key = nav4 ? event.which : event.keyCode;
                return (key <= 13 || (key >= 65 && key <= 90) || (key >= 48 && key <= 57) || key == 44);
            });
        }
    });
});

var Page = function (pContainer) {
    this.container = pContainer;
};

Page.prototype = {
    initialize: function () {
        this.ddlTipoDocumento = $('#ddlTipoDocumento');
        this.txtDocumento = $('#txtDocumento');
        this.btnVerificar = $('#btnVerificar');
        this.bind();
        return false;
    },
    bind: function () {
        this.btnVerificar.click(this.VerificarPaciente);
        return false;
    },
    VerificarPaciente: function () {
        if (objPage.ddlTipoDocumento.val() == "0") {
            alert("Seleccionar tipo de Documento");
            objPage.ddlTipoDocumento.focus();
            return false;
        }
        if (objPage.txtDocumento.val() == "") {
            alert("Ingresar Número de documento");
            objPage.txtDocumento.focus();
            return false;
        }
        if (objPage.ddlTipoDocumento.val() == "1") {
            $("#txtDocumento").keypress(function (event) {
                var nav4 = window.event ? true : false;
                var key = nav4 ? event.which : event.keyCode;
                return (key <= 13 || (key >= 48 && key <= 57) || key == 44);
            });
            if (objPage.txtDocumento.val().length < 8 || objPage.txtDocumento.val().length > 8) {
                alert("El número de documento debe tener 8 dígitos");
                objPage.txtDocumento.focus();
                return false;
            }

        } else if (objPage.ddlTipoDocumento.val() == "2") {
            if (objPage.txtDocumento.val().length < 10) {
                alert("El número de documento debe como mínimo 10 dígitos");
                objPage.txtDocumento.focus();
                return false;
            }


        } else if (objPage.ddlTipoDocumento.val() == "3") {
            if (objPage.txtDocumento.val().length < 10) {
                alert("El número de documento debe como mínimo 10 dígitos");
                objPage.txtDocumento.focus();
                return false;
            }
        }

        var objData = {
            Accion: "1",
            NroDocumento: objPage.txtDocumento.val(),
            TipoDocumento: objPage.ddlTipoDocumento.val(),
            DescTipoDocumento: $("#ddlTipoDocumento option:selected").html()
        };
        var args = Sys.Serialization.JavaScriptSerializer.serialize(objData);
        fn_Paciente_Call(args, function (output, context) {
            var objResult = Sys.Serialization.JavaScriptSerializer.deserialize(output);
            if (objResult.Result == true) {
                location.href(objResult.Message);
            } else {
                alert("El Paciente no se encuentra registrado.");
            }
        });



        return false;
    }
};