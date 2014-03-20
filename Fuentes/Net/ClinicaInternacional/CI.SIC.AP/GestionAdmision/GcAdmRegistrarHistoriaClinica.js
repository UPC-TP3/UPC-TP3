$(document).ready(function () {
    objPage.initialize();

    $("#ddlTipoAlergia").append($("<option></option>").attr("value", "0").text("-Seleccione-"))

    $("#ddlAlergias").change(function () {
        // armo el objeto que servira de parametro, para ello utilizo una libreria de JSON
        //este parametro mapeara con el definido en el web service

        if ($("#ddlAlergias").val() == "1") {
            $("#ddlTipoAlergia").prop("disabled", false);
            var params = new Object();
            params.p_Valor = "";
            params = JSON.stringify(params);

            $.ajax({
                type: "POST",
                url: "GcAdmRegistrarHistoriaClinica.aspx/pr_CargarAlergias",
                data: params,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: CargarAlergias,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus + ": " + XMLHttpRequest.responseText);
                }
            });
        } else {
            $("#ddlTipoAlergia").prop("disabled", true);
            $("#ddlTipoAlergia").val('0');
        }
    });


    $("#ddlInterv").change(function () {
        if ($("#ddlInterv").val() == "1") {
            $('#txtInterv').prop("readonly", false);
        } else {
            $('#txtInterv').prop("readonly", true);
            $('#txtInterv').val('');
        }

    });

});
var Page = function (pContainer) {
    this.container = pContainer;


};

Page.prototype = {
    initialize: function () {
        this.ddlInterv = $('#ddlInterv');
        this.ddlGrupo = $('#ddlGrupo');
        this.ddlAlergias = $('#ddlAlergias');
        this.ddlTipoAlergia = $('#ddlTipoAlergia');
        this.ddlTipoAdmin = $('#ddlTipoAdmin');
        this.txtInterv = $('#txtInterv');
        this.btnGuardar = $('#btnGuardar');
        this.btnSalir = $('#btnSalir');
        this.hddIDPaciente = $('#hddIDPaciente');
        this.bind();
        return false;
    },
    bind: function () {
        this.btnGuardar.click(this.RegistrarHistoria);
        this.btnSalir.click(this.Salir);
        return false;
    },
    RegistrarHistoria: function () {
        if (objPage.ddlAlergias.val() == "1") {
            if (objPage.ddlTipoAlergia.val() == "0") {
                alert("Seleccionar Tipo de Alergia");
                objPage.ddlTipoAlergia.focus();
                return false;
            }
        }
        if (objPage.ddlInterv.val() == "1") {
            if (objPage.txtInterv.val() == "") {
                alert("Ingresar Intervención Quirúrgica");
                objPage.txtInterv.focus();
                return false;
            }
        }
        if (objPage.ddlTipoAdmin.val() == "0") {
            alert("Seleccionar Tipo Admisión");
            objPage.ddlTipoAdmin.focus();
            return false;
        }
        if (objPage.ddlGrupo.val() == "0") {
            alert("Seleccionar Grupo Sanguineo");
            objPage.ddlGrupo.focus();
            return false;
        }

        var objData = {
            IDPaciente: objPage.hddIDPaciente.val(),
            Intervencion: objPage.txtInterv.val(),
            Alergias: objPage.ddlTipoAlergia.val(),
            TipoAdmision: objPage.ddlTipoAdmin.val(),
            GrupoSanguineo: objPage.ddlGrupo.val()
        };
        var args = Sys.Serialization.JavaScriptSerializer.serialize(objData);
        fn_Paciente_Call(args, function (output, context) {
            var objResult = Sys.Serialization.JavaScriptSerializer.deserialize(output);
            if (objResult.Result == true) {
                alert(objResult.Message);
                location.href("GcAdmVerificarHistoriaClinica.aspx");
            } else {
                alert(objResult.Message);
            }
        });
        return false;
    },
    Salir: function () {
        location.href("GcAdmVerificarHistoriaClinica.aspx");
        return false;
    }
};
function CargarAlergias(result) {
    $("#ddlTipoAlergia").html("");
    $.each(result.d, function () {
        $("#ddlTipoAlergia").append($("<option></option>").attr("value", this.MAS_CodCampo).text(this.MAS_DesCorta))
    });
}