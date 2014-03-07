


var cancelbeforeunload = true;
var lineas;
var ubicacion;
var ubicaciontrack;
var orginalFormAction = null;
var continuarProcessing = false;
var MostrarProcessing = true;
var IsOld = "0";

function BeginRequestHandler() {   
    if (MostrarProcessing) mostrarObjecto('Processing');
    orginalFormAction = theForm.action;
}


function EndRequestHandler() {
    ocultarObjecto('Processing');
    theForm.action = orginalFormAction;
    theForm._initialAction = orginalFormAction;
}

function RegisterRequestHandlers() {

    if (typeof (Sys) != "undefined") {

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.Application.notifyScriptLoaded();

    }
}


var app = Sys.Application;
app.add_load(RegisterRequestHandlers);
app.add_init(ApplicationInit);
app.add_unload(ApplicationUnload);


function ApplicationInit(sender) {
    ocultarObjecto('Processing');
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (!prm.get_isInAsyncPostBack()) {
        prm.add_initializeRequest(InitializeRequest);
        prm.add_beginRequest(BeginRequest);
        prm.add_pageLoading(PageLoading);
        prm.add_pageLoaded(PageLoaded);
        prm.add_endRequest(EndRequest);
    }

    $(window).bind("beforeunload", function (e) {
        if (!cancelbeforeunload) { event.returnValue = "Todavia no has guardado los datos."; }
        else { $(window).unbind("beforeunload"); }
    });
}


function _tooltiptracking(sw, items, name, l, t, parent) {
    var target_items = !parent ? $("#" + items) : $("#" + parent).find(items);
    if (sw != "2") {
        target_items.each(function (i) {
            var my_tooltip = $("#" + name);

            if ($(this).attr("title") == "" && $(this).attr("title") != "undefined") {

                $(this).removeAttr("title").mouseover(function () {

                    my_tooltip.css({ opacity: 1, display: "none" }).fadeIn(100);

                }).mousemove(function (kmouse) {

                    var border_top = $(window).scrollTop();
                    var border_right = $(window).width();
                    var left_pos;
                    var top_pos;
                    var offset = 20;
                    if (border_right - (offset * 2) >= my_tooltip.width() + kmouse.pageX) {
                        left_pos = kmouse.pageX + offset;
                    } else {
                        left_pos = border_right - my_tooltip.width() - offset;
                    }

                    if (border_top + (offset * 2) >= kmouse.pageY - my_tooltip.height()) {
                        top_pos = border_top + offset;
                    } else {
                        top_pos = kmouse.pageY - my_tooltip.height() - offset;
                    }


                    my_tooltip.css({ left: left_pos - l, top: t ? t : (top_pos + 150) });
                }).mouseout(function () {
                    my_tooltip.fadeOut(100);

                });
            }
        });
    }
    else {

        target_items.each(function (i) {
            var my_tooltip = $("#" + name);


            my_tooltip.find("#toolTipClose2").click(function (tclick) {
                my_tooltip.css({ opacity: 1, display: "none" }).fadeIn(400);
                my_tooltip.css({ left: "-9999px" });

            });



            if ($(this).attr("title") == "" && $(this).attr("title") != "undefined") {

                $(this).removeAttr("title").mouseover(function () {

                    my_tooltip.css({ opacity: 1, display: "none" }).fadeIn(800);

                }).mousemove(function (kmouse) {

                    var border_top = $(window).scrollTop();
                    var border_right = $(window).width();
                    var left_pos;
                    var top_pos;
                    var offset = 20;
                    if (border_right - (offset * 2) >= my_tooltip.width() + kmouse.pageX) {
                        left_pos = kmouse.pageX + offset;
                    } else {
                        left_pos = border_right - my_tooltip.width() - offset;
                    }

                    if (border_top + (offset * 2) >= kmouse.pageY - my_tooltip.height()) {
                        top_pos = border_top + offset;
                    } else {
                        top_pos = kmouse.pageY - my_tooltip.height() - offset;
                    }


                    my_tooltip.css({ left: left_pos - l, top: t ? t : (top_pos + 150) });
                }).mouseout(function () {
                    my_tooltip.fadeOut(2000);

                });

            }

        });


    }
}


function _tooltip(items, name, l, t, parent) {
    var target_items = !parent ? $("#" + items) : $("#" + parent).find(items);

    if (arguments.length < 6) {

        target_items.each(function (i) {
            var my_tooltip = $("#" + name);

            my_tooltip.find("#toolTipClose").click(function (tclick) {
                my_tooltip.css({ opacity: 1, display: "none" }).fadeIn(400);
                my_tooltip.css({ left: "-9999px" });

            });

            if ($(this).attr("title") == "" && $(this).attr("title") != "undefined") {

                $(this).removeAttr("title").click(function (kclick) {
                    switch (ubicacion) {
                        case "ConFacDetalleLlamadasFijo":
                            {
                                $('#lblNro').html($(this).html());
                                $('#lblNomTit').html($(this).next().val());
                                pagename_tageo = '/Detalle';
                            }
                            break;
                        case "ConRanRankingConsumo":
                            {
                                $('#lblCabecera').html($(this).html());
                                $('#lblDetalle').html($(this).next().val());
                            }
                            break;
                        case "ConInfInformacionConsumo":
                            {
                                $('#lblCabecera').html($(this).html());
                                $('#lblDetalle').html($(this).next().val());
                            }
                            break;   
                    }

                    var border_top = $(window).scrollTop();
                    var border_right = $(window).width();
                    var left_pos;
                    var top_pos;
                    var offset = 20;
                    if (border_right - (offset * 2) >= my_tooltip.width() + kclick.pageX) {
                        left_pos = kclick.pageX + offset;
                    } else {
                        left_pos = border_right - my_tooltip.width() - offset;
                    }

                    if (border_top + (offset * 2) >= kclick.pageY - my_tooltip.height()) {
                        top_pos = border_top + offset;
                    } else {
                        top_pos = kclick.pageY - my_tooltip.height() - offset;
                    }


                    my_tooltip.css({ left: left_pos - l, top: t ? t : (top_pos + 150) });
                });

            }

        });

    } else {
        switch (arguments[5]) {
            case "evtMouse":
                target_items.each(function (i) {
                    var my_tooltip = $("#" + name);

                    if ($(this).attr("title") == "" && $(this).attr("title") != "undefined") {

                        var IsMouse = false;

                        $(this).removeAttr("title").mouseover(function () {
                            if (IsMouse) {
                                my_tooltip.css({ opacity: 1, display: "none" }).fadeIn(400);
                            }
                        }).mousemove(function (kmouse) {
                            switch (ubicacion) {
                                case "ConFacRecibosFijo":
                                    {
                                        var response;
                                        if ($.browser.msie)
                                            response = this.parentElement.getElementsByTagName("input")[0].value;
                                        else
                                            response = this.parentNode.getElementsByTagName("input")[0].value;
                                        if (response != "no")
                                        { return; } else { IsMouse = true; }

                                    }
                                    break;
                            }

                            var border_top = $(window).scrollTop();
                            var border_right = $(window).width();
                            var left_pos;
                            var top_pos;
                            var offset = 20;
                            if (border_right - (offset * 2) >= my_tooltip.width() + kmouse.pageX) {
                                left_pos = kmouse.pageX + offset;
                            } else {
                                left_pos = border_right - my_tooltip.width() - offset;
                            }

                            if (border_top + (offset * 2) >= kmouse.pageY - my_tooltip.height()) {
                                top_pos = border_top + offset;
                            } else {
                                top_pos = kmouse.pageY - my_tooltip.height() - offset;
                            }


                            my_tooltip.css({ left: left_pos - l, top: t ? t : (top_pos + 150) });
                        }).mouseout(function () {
                            if (IsMouse) {
                                my_tooltip.fadeOut(800);
                            }
                        }).click(function (kclick) {

                            if (!IsMouse) {
                                switch (ubicacion) {
                                    case "ConFacRecibosFijo":
                                        {
                                            var response;
                                            if ($.browser.msie)
                                                response = this.parentElement.getElementsByTagName("input")[0].value;
                                            else
                                                response = this.parentNode.getElementsByTagName("input")[0].value;
                                            if (response != "no") {
                                                if (response == "error") { alert("El recibo digital no se encuentra disponible."); return; }
                                                else { winpop = window.open(response, 'ReciboConsumo', 'top=150,left=150,width=800,height=500,status=yes,resizable=yes,scrollbars=yes'); return; }
                                            }
                                        }
                                        break;
                                }
                                IsMouse = false;
                            }
                        });

                    }
                });
                break;
        }

    }
}

function ApplicationUnload(sender) {
}
function ApplicationDisposing(sender) {
}

function ObtienePerfilTageo(perfil){
    switch (perfil)
    {
        case '151': 
        case '152':
            return "/empresa";
        case '148':
            return "/persona";
        case '149':
        case '150':
            return "/negocio";
    }
    return perfil;
}



function pageLoad(sender, args) {
    if (ubicacion != undefined) {

        switch (ubicacion) {
            case "ConFacDetalleLlamadasFijo":
                {
                    if ($('#' + gvDetalleLlamada).length > 0) { _tooltip(".tooltip", "PanelDetLLamada", 38, false, gvDetalleLlamada); }
                    if (!args.get_isPartialLoad()) {
                        leerRecibos($("#" + ddlLineas).get(0).value);
                    }
                }
                break;
            case "ConFacRecibosFijo":
                {
                    if ($('#' + gvRecibos).length > 0) { _tooltip(".tooltip", "PanelRecibos", 38, false, gvRecibos, "evtMouse"); }
                    if (!args.get_isPartialLoad()) {
                        leerRecibos($("#Contenido_ddlLinea").get(0));
                    }
                }
                break;
            case "Login":
                {
                    ddlDocumentoInicio_Click($('#ddlTipoDocumento').get(0), 'txtNumeroDocumento', 'fteNumeroDocumento');
                    ddlDocumentoInicio_Click($('#ddlTipoDocumentoPopUp').get(0), 'txtNumeroDocumentoPopUp', 'fteNumeroDocumentoPopUp');
                }
                break;
            case "ConCliProductosDetalles": { mostrarObjecto('Processing'); } break;

            case "ConFacAfiliacionReciboDigitalFijo":
                {
                    chk_DigitalClick($('#' + chkFactura).get(0));
                }
                break;
            //INI SRT
            case "ConRanRankingConsumo":
                {
                    if ($('#' + grid).length > 0) { _tooltip(".tooltip", "pnlMinLibres", 38, false, grid); }
                    if ($('#' + gridHistorico).length > 0) { _tooltip(".tooltip", "pnlMinLibres", 38, false, gridHistorico); }
                }
                break;
            case "ConInfInformacionConsumo":
                {
                    //if ($('#Contenido_gvInformacionConsumoHistorico_DXMainTable tr').length > 0) { _tooltip(".tooltip", "pnlDetalle", 38, false, "Contenido_gvInformacionConsumoHistorico_DXMainTable"); }
                    //if ($('#Contenido_gvInformacionConsumo_DXMainTable tr').length > 0) { _tooltip(".tooltip", "pnlDetalle", 38, false, "Contenido_gvInformacionConsumo_DXMainTable"); }
                    if ($('#Contenido_tblActual tr').length > 0) { _tooltip(".tooltip", "pnlDetalle", 38, false, "Contenido_tblActual"); }
                    if ($('#Contenido_tblHistorico tr').length > 0) { _tooltip(".tooltip", "pnlDetalle", 38, false, "Contenido_tblHistorico"); }
                }
                break;
            //FIN SRT 
        }
    }

    if (ubicaciontrack != undefined) {

        switch (ubicaciontrack) {
            case "ConTrackPedidoDetalle":
                {
                    ocultarObjecto('imgLoading');
                    _tooltiptracking("1", "VerUbicacion", "UbicacionTracking", 215, 390);
                    _tooltiptracking("2", "VerUbicacion2", "UbicacionTracking2", 40, 341);
                    _tooltiptracking("3", "VerUbicacion3", "UbicacionTracking3", -10, 550);
                }
                break;
            case "TrackingPedido":
                {
                    ocultarObjecto('imgLoading');
                    _tooltiptracking("2", "VerUbicacion4", "que_es", 500, -90);
                    $('#tpins').html(" En esta sección conocerás el estado de tus Pedidos pendientes de atención, desde la solicitud hasta finalizar la instalación (se consideran sólo los pedidos que necesiten visita al domicilio).");
                }
                break;

        }
    }

}

function pageUnload() {
}

var x_ddlLinea;
function InitializeRequest(sender, args) {
    if (MostrarProcessing) mostrarObjecto('Processing');
}

function BeginRequest(sender, args) {
    if (MostrarProcessing) mostrarObjecto('Processing');    
}
function PageLoading(sender, args) {
}

function get_dataPaged(lst, CurrentPage, PageSize) {
    var take = (CurrentPage * PageSize);
    var skip = take - PageSize;

    var i = 0;
    var l = lst.length / PageSize;
    var newLst = new Array();

    for (x = skip; x < (CurrentPage < l ? take : lst.length); x++) {
        newLst[i] = lst[x];
        i++;
    }

    return newLst;
}

function PageLoaded(sender, args) {
    if (continuarProcessing == false) ocultarObjecto('Processing');
    
}
function EndRequest(sender, args) {
    if (continuarProcessing == false) ocultarObjecto('Processing');
}


function WindowOpen(url, target, alto, ancho) {
    if (alto == "0" || ancho == "0") {
        window.open(url, target, '');
    } else {
        vert = (screen.height - alto) / 2;
        hor = (screen.width - ancho) / 2;
        propiedades = eval("'toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=yes, scrollbars=no, width=" + ancho + ", height=" + alto + ", left=" + hor + ", top=" + vert + "'");
        window.open(url, target, propiedades);
    }
}

function OnSucceeded(result, userContext, methodName) {
    continuarProcessing = false;
    ocultarObjecto('Processing');   
}

function OnFailed(error, userContext, methodName) {
    ocultarObjecto('Processing');
}
function setImagen(id, imagen) {
    $("#" + id).attr({
        alt: id,
        src: imagen
    });
}
function getExtension(FileName) {
    return FileName.substr(FileName.lastIndexOf('.')).toLowerCase();
}

function mostrarObjecto(id) {
    $('#' + id).css({ visibility: "visible", display: "block" });
}
function ocultarObjecto(id) {
    $('#' + id).css({ visibility: "hidden", display: "none" });
}

function gvLineas_Click(obj) {
    if (document.activeElement.tagName == 'A') { cancelbeforeunload = true; }
}

function chk_DigitalClick(obj) {
    if (obj.checked) {
        if (ubicacion == "ConFacAfiliacionReciboDigitalFijo") {
            cargarAfiliacion(1);
        }
    }
    $.each(lineas, function (i, v) {
        v.FlagReciboDigital = obj.checked ? "1" : "0";
    });

    if (obj.checked == false) {
        if (ubicacion == "ConFacAfiliacionReciboDigitalFijo") {
            cargarAfiliacion(0);
        }
    }
}

function chk_FisicoClick(obj) {
    if ($.browser.msie)
        codTelefono = obj.parentElement.parentElement.childNodes.item(1).outerText;
    else
        codTelefono = obj.parentNode.parentNode.childNodes.item(2).innerHTML;
    $.each(lineas, function (i, v) {
        if (v.NumeroLinea == codTelefono) {
            v.FlagReciboFisico = obj.checked ? "1" : "0";
            if (ubicacion == "ConFacAfiliacionReciboDigitalFijo") {
                v.EditFRF = !v.EditFRF;
            }
        }
    });
}

function client_Validator() {
    try {
        var isPageValid = true;

        if (typeof (Page_Validators) != "undefined") {
            if (typeof (Page_ClientValidate) == 'function') {
                isPageValid = Page_ClientValidate();
            } else {
                alert("Page_ClientValidate function undefined");
            }
        } else {
            alert("Page_Validators undefined");
        }

        return isPageValid;
    } catch (er) {
        alert("ERROR: " + er);
    }
}

function afiliarme_Click() {
    if (client_Validator()) {
        if (!$('#ConfirmAfil').attr("checked"))
        { alert('Usted no ha aceptado las Condiciones del contrato.'); return false; }
        registrarClienteLineas();
        hideModalPopup('pMPB2');
    }
}
function mostrarMensajeAlerta(msj) {
    $('#divAlerta').html(msj);
    showModalPopup('mpeBAlerta');
}

/********* INI LCAICEDO 13-07-2011 REF-40 MEJORAS COL 2.5 ************/
function mostrarMensajeAlert(msj) {
    alert(msj);
}
//********* FIN LCAICEDO 13-07-2011 REF-40 MEJORAS COL 2.5 ***********/

function ValidaURL(url) {
    var regex = /^(ht|f)tps?:\/\/\w+([\.\-\w]+)?\.([a-z]{2,3}|info|mobi|aero|asia|name)(:\d{2,5})?(\/)?((\/).+)?$/i;
    return regex.test(url);
}

$.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function showModalPopup(behaviorId) {
    var modalPopupBehavior = $find(behaviorId);
    modalPopupBehavior.show();
}

function hideModalPopup(behaviorId) {
    var modalPopupBehavior = $find(behaviorId);
    modalPopupBehavior.hide();
}

function completarHTML(lineasCount, strHTML, v, i) {
    EsFinRow = EsFinBloq = false;
    if (OnlyDigital == group) {
        group += 4; EsIni = true; strHTML += strFinBloq; EsFinBloq = true;
        if (OnlyDigital == 4) { strHTML = strIniRow + strHTML; }
        if (OnlyDigital == 16) {
            strHTML += strFinRow + strIniRow;
            EsFinRow = true;
            OnlyDigital = 0;
            group = 4;

        }
    } else {
        if (lineasCount <= group) {
            if (OnlyDigital == 0) { strHTML = strIniRow + strHTML; }
        }
    }

    OnlyDigital++;

    var numlinea = String(v.NumeroLinea);
    var lHTML = '<tr><td><img src="../img/vineta_gris.gif" alt=""/></td> <td class="ltexto3">' + numlinea + '</td></tr>';
    if (EsIni) {
        EsIni = false;
        strHTML += strIniBloq + lHTML;
    } else {
        strHTML += strMiddle + lHTML;
    }

    if (i == (lineasCount - 1)) {
        if (EsFinBloq) { EsFinBloq = false; }
        if (EsFinRow) { EsFinRow = false; }
    }

    return strHTML;
}

var strIniRow = '<tr><td width="88"></td>';
var strIniBloq = '<td width="130"><table cellpadding="0" cellspacing="0" border="0" >';
var strMiddle = '<tr><td height="5"></td></tr>';
var strFinBloq = '</table></td>';
var strFinRow = '</tr>';

var EsIni = true;
var EsFinBloq = false;
var EsFinRow = false;
var group = 4;
var OnlyDigital = 0;
var mostrarpnlDesAfiliacion = false;
var strHTML_D = '';

var newLineas = new Array();

function OkButton() {
    if (lineas == undefined) return;
    strHTML_D = '';
    var strHTML_A = '';
    var group_A = group_D = 4;
    var OnlyDigital_A = OnlyDigital_D = 0;
    var EsIni_A = EsIni_D = true;
    var EsFinBloq_A = EsFinBloq_D = EsFinRow_A = EsFinRow_D = false;

    var lineasCount = 0;
    var newi = 0;

    if (ubicacion == "ConFacAfiliacionReciboDigitalFijo") {
        newLineas = new Array();
        mostrarpnlDesAfiliacion = false;
        var newLineasF = new Array();
        var newiF = 0;

        $.each(lineas, function (i, v) {
            //if (v.EditFRD) {
            newLineas[newi] = v;
            v.EditFRD = false;
            newi++;
            // }

            if (v.EditFRF) {
                newLineasF[newiF] = v;
                newiF++;
            }
        });
    } else { newLineas = lineas; }

    lineasCount = newLineas.length;
    if (lineasCount == 0) {
        if (newLineasF.length == 0) return;
        else {
            var strlineas = $.json.encode(newLineasF);
            __doPostBack('Contenido_btnAceptar', strlineas);
        }
    }

    $.each(newLineas, function (i, v) {

        if (v.FlagReciboDigital == "1") {
            OnlyDigital = OnlyDigital_A;
            group = group_A;
            EsIni = EsIni_A;
            EsFinBloq = EsFinBloq_A;
            EsFinRow = EsFinRow_A;
            strHTML_A = completarHTML(lineasCount, strHTML_A, v, i);
            OnlyDigital_A = OnlyDigital;
            group_A = group;
            EsIni_A = EsIni;
            EsFinBloq_A = EsFinBloq;
            EsFinRow_A = EsFinRow;
        } else {
            if (ubicacion == "ConFacAfiliacionReciboDigitalFijo") {
                OnlyDigital = OnlyDigital_D;
                group = group_D;
                EsIni = EsIni_D;
                EsFinBloq = EsFinBloq_D;
                EsFinRow = EsFinRow_D;
                strHTML_D = completarHTML(lineasCount, strHTML_D, v, i);
                OnlyDigital_D = OnlyDigital;
                group_D = group;
                EsIni_D = EsIni;
                EsFinBloq_D = EsFinBloq;
                EsFinRow_D = EsFinRow;
            }
        }
    });

    if (ubicacion == "ConFacAfiliacionReciboDigitalFijo") {
        if (OnlyDigital_A == 0 && OnlyDigital_D == 0) return;
    }

    var lHTML = '<tr><td>&nbsp;</td> <td class="ltexto3">&nbsp;</td></tr>';

    if (OnlyDigital_A == 0) {
        if (ubicacion != "ConFacAfiliacionReciboDigitalFijo") {
            registrarClienteLineas();
            hideModalPopup('pMPB0');
            return;
        }
    }

    var mostrarpnlAfiliacion = (strHTML_A != "" ? true : false);

    while ((OnlyDigital_A % 4) != 0) {
        strHTML_A += strMiddle + lHTML;
        OnlyDigital_A++;
    }

    if (!EsFinBloq_A) { strHTML_A += strFinBloq; }
    if (!EsFinRow_A) { strHTML_A += strFinRow; }

    try {
        $('#tbLineas').html(strHTML_A);
    }
    catch (err) {
    }

    if (ubicacion == "ConFacAfiliacionReciboDigitalFijo") {

        mostrarpnlDesAfiliacion = (strHTML_D != "" ? true : false);

        while ((OnlyDigital_D % 4) != 0) {
            strHTML_D += strMiddle + lHTML;
            OnlyDigital_D++;
        }

        if (!EsFinBloq_D) { strHTML_D += strFinBloq; }
        if (!EsFinRow_D) { strHTML_D += strFinRow; }

       
        if (mostrarpnlAfiliacion) {
            
            if ($('#Contenido_hfEstadoAfiliacion').val() == "1") {
                _gaq.push(['_trackPageview', tipo_tageo + pagename_tageo + '/afiliacion-cambios']);
                $('#Contenido_lblMsg').html('Se grabaron las modificaciones realizadas en su servicio de Recibo Digital.');
                var strlineas = $.json.encode(getLineasPorFiltro("1"));
                strlineas = strlineas + '%' + 'Se grabaron las modificaciones realizadas en su servicio de Recibo Digital.';
                __doPostBack('Contenido_imbAfiliarme', strlineas);
            }
            else {
                $('#Contenido_lblMsg').html('Afiliación Exitosa.');
                $('#ConfirmAfil').attr("checked", false);
                _gaq.push(['_trackPageview', tipo_tageo + pagename_tageo + '/afiliacion']);
                showModalPopup('bmpAfiliacion');
            }
        }
        else
            if (mostrarpnlDesAfiliacion) {
                // Metodo que pregunta por el estado del usuario en session
                if ($('#Contenido_hfEstadoAfiliacion').val() == "1") {
                    $('#Contenido_ddlRazones').get(0).selectedIndex = 0;                  
                    showModalPopupAfi('bmpPanelConfirmacion');
                    strHTML_D = String(strHTML_D).replace('<td width="88"></td>', '');
                    strHTML_D = String(strHTML_D).replace('130', '80');
                    $('#tbLineas_D').html(strHTML_D);
                }
                else {
                    $('#Contenido_lblMsg').html('Usted ya se encuentra desafiliado a Recibo Digital.');
                    showModalPopup('bmpMsg');
                }
                return;
            }

        return;
    }

    hideModalPopup('pMPB0');
    var email = $('#txtCorreo1');
    $('#txtCorreoAfi1').val((email.length > 0 ? email.val() : $('#txtCorreo1Repr').val()));
    $('#txtCorreoAfi2').val((email.length > 0 ? $('#txtCorreo2').val() : $('#txtCorreo2Repr').val()));
    // en el registro de un usuario
    if ($('#chkDigital').attr("checked")) {
        mostrarTextoLegal();
        showModalPopup('pMPB2');
    }
    else {
        CancelButton();
    }
}

function cerrarAfiliacion() {
    if (confirm("Desea regresar a la ventana previa.?")) {
        hideModalPopup('pMPB2');
        showModalPopup('pMPB0');
    }
}
function hidePopUpAceptar(behaviorId) {
    var modalPopupBehavior = $find(behaviorId);
    modalPopupBehavior.hide();
}
function showPopUpAceptar(behaviorId) {
    var modalPopupBehavior = $find(behaviorId);
    modalPopupBehavior.show();
}

function mostrarTextoLegal() {
    var nombre = $('#txtNombre');
    var nombreCompleto = nombre.length > 0 ? $('#txtNombre').val() + ' ' + $('#txtApPaterno').val() + ' ' + $('#txtApMaterno').val() : $('#txtRazonSocial').val();
    var html = "Yo, <strong>" + nombreCompleto + "</strong>, cliente titular autorizo a Telefónica:<br /><br /> " +
                "&#8226 Enviarme el/los recibos telefónicos digitalizados, de todas mis Líneas,  a los correos electrónicos indicados en los campos “Correo electrónico 1” y “Correo electrónico 2”.<br /><br />" +
                "&#8226 Tomo conocimiento de que en caso dicho(s) correo(s) electrónico(s) varíe(n), debo informar a Telefónica el cambio realizado para no perder la continuidad del servicio.<br /><br />" +
                "&#8226 Así mismo, tomo conocimiento que mi solicitud se ampara en el artículo 25° de las Condiciones de Uso de los Servicios Públicos de Telecomunicaciones, aprobadas mediante Resolución N° 116-2003-CD/OSIPTEL.<br /><br />" +
                "Nota importante:<br /><br />" +
                "&#8226 Si un titular cuenta con distintas líneas telefónicas, y a la vez se afilia al servicio Recibo Digital, debe tomar en cuenta que los recibos de todas sus líneas telefónicas (sean de uso Residencial, Negocio o Telefonía de Uso Público) serán enviados únicamente al(los) correo(s) electrónico(s).<br /><br />" +
                "&#8226 Sin embargo, podrá mantener en forma paralela el envío del formato físico a domicilio de alguna de ellas.<br /><br />" +
                "&#8226 Este servicio es gratuito y no tiene plazo mínimo de permanencia.<br /><br />" +
                "&#8226 El Recibo Digital  es un documento que no tiene validez tributaria.<br /><br />";
    $('.caja_legal').html(html);
}

function ddlDocumento_Click(domElem, numdoc, filterdoc) {
    if (domElem != undefined) {
        var doc = $('#' + numdoc).get(0);
        switch (domElem.value) {
            case "": doc.maxLength = 0; doc.value = ""; break;
            case "14": doc.maxLength = 8; doc.value = ""; if (filterdoc != undefined) $find(filterdoc).set_FilterType(2); break;
            case "17": doc.maxLength = 11; doc.value = ""; if (filterdoc != undefined) $find(filterdoc).set_FilterType(2); break;
            default: doc.maxLength = 15; doc.value = ""; if (filterdoc != undefined) $find(filterdoc).set_FilterType(14); break;
        }
    }
}

function ddlDocumentoInicio_Click(domElem, numdoc, filterdoc) {
    if (domElem != undefined) {
        var doc = $('#' + numdoc).get(0);
        switch (domElem.value) {
            case "": doc.maxLength = 0; break;
            case "14": doc.maxLength = 8; if (filterdoc != undefined) $find(filterdoc).set_FilterType(2); break;
            case "17": doc.maxLength = 11; if (filterdoc != undefined) $find(filterdoc).set_FilterType(2); break;
            default: doc.maxLength = 15; if (filterdoc != undefined) $find(filterdoc).set_FilterType(14); break;
        }
    }
}

function ValidaNumero(campo) {
    var regex = /^([0-9])*$/;
    return regex.test(campo);
}


/*********************************************************************************
//  INI         :   COL - P-0020-AccCom - Jatuncar - 14/07/2011
//  Modificación:   -Se agregó '.value' a variable doc
-Se quitó espacio luego de caracter '#' y despues de signo +
-Se modificó mensajes de alerta
-Se agregó condición para CEX
**********************************************************************************/
function validarDocumento(ddlDocumento, txtNumeroDocumento) {


    var res = true;
    var doc = $('#' + txtNumeroDocumento);
    if (doc.get(0) != null) {
        doc = doc.get(0).value;
        var ddl = $('#' + ddlDocumento).val();
        switch (ddl) {
            case "14":
                if ((doc.length > 0) && (doc.length != 8)) {
                    alert('-Debe ingresar los 8 dígitos de su documento de identidad.'); res = false;
                }
                break;
            case "17":
                if ((doc.length >= 0) && (doc.length != 11)) {


                    alert('-Debe ingresar los 11 dígitos de su RUC.'); res = false; return;
                }


                if ((doc.length > 0) && (doc.substring(0, 1) == '0')) {
                    alert('-Vuelva a digitar el número correcto.'); res = false;
                }
                break;
            case "18":
                if ((doc.length > 0) && (doc.length < 3)) {
                    alert('-Documento inválido.'); res = false;
                }
                break;
        }
    }
    return res;
}
function validarTelefonoFijo(txtTelefono, ddlDepartamento, revNumeroFijo) {
    var telefono = $('#' + txtTelefono).get(0);
    var ddldpt = $('#' + ddlDepartamento).val();
    var rev = $get(revNumeroFijo);

    if (ddldpt == "1") {
        telefono.maxLength = 7;
        if (rev != undefined) rev['validationexpression'] = "^([1-9][0-9]{6})$";
    }
    else {
        telefono.maxLength = 6;
        if (rev != undefined) rev['validationexpression'] = "^([1-9][0-9]{5})$";
    }
    telefono.value = "";
}
/*********************************************************************************
//  FIN : COL - P-0020-AccCom - Jatuncar - 14/07/2011
**********************************************************************************/

function getGuid() {

    return $('#hfGuId').val();
}

function getGuidPersona() {

    return $('#hfGuIdPersona').val();
}

function pagina_tienda(tipo_tienda) {
    if (tipo_tienda == '1') {
        window.open('http://www.movistar.com.pe/telefonia-fija_452_1', '', '');
    }
    else if (tipo_tienda == '2') {
        window.open('http://www.movistar.com.pe/speedy_461_1', '', '');
    }
    else {
        window.open('http://www.movistar.com.pe/movistar-tv/oferta-de-paquetes/lima_12007_1', '', '');
    }
}

function getGuidNegocio() {

    return $('#hfGuIdNegocio').val();
}

function getGuidEmpresa() {

    return $('#hfGuIdEmpresa').val();
}

function getPerfilCliente() {

    return $('#hfPerfilCliente').val();
}

function mIrPaginaPersona(url) {
    cancelbeforeunload = true;
    var Pagina = url + '?GuId=' + getGuidPersona();
    WindowOpen(Pagina, '_parent', screen.height - 180, screen.width - 80);
}

function mIrPaginaNegocio(url) {
    cancelbeforeunload = true;
    var Pagina = url + '?GuId=' + getGuidNegocio();
    WindowOpen(Pagina, '_parent', screen.height - 180, screen.width - 80);
}

function mIrPaginaEmpresa(url) {
    cancelbeforeunload = true;
    var Pagina = url + '?GuId=' + getGuidEmpresa();
    WindowOpen(Pagina, '_parent', screen.height - 180, screen.width - 80);
}


function mIrPagina(url, target) {
    cancelbeforeunload = true;
    var Pagina = url;
    if (arguments.length == 2) {
        WindowOpen(Pagina, '_target', '0', '0');
    }
    else {
        Pagina = url + '?GuId=' + getGuid();
        WindowOpen(Pagina, '_parent', '0', '0');
    }
}

function mIrPaginaMovistar() {
    cancelbeforeunload = true;
    window.open('http://www.movistar.com.pe', '_blank', '');
}

function mIrPaginaTelefonica() 
{
    cancelbeforeunload = true;
    window.open('http://www.telefonica.com.pe', '_blank', '');
}

function mIrPaginaCartola() {
    mIrPagina('../Cliente/ConCliCartolaResumen.aspx');
}

function abrirPopUp(url, a_int_windowWidth, a_int_windowHeight) {
    var int_windowLeft = (screen.width - a_int_windowWidth) / 2;
    var int_windowTop = (screen.height - a_int_windowHeight) / 2;
    var a_bool_scrollbars = 0;
    var a_bool_resizable = 0;
    var a_bool_toolbar = 0;
    var a_bool_menubar = 'no';
    var a_bool_statusbar = 'yes';
    var randomnumber = Math.floor(Math.random() * 1001);
    var str_windowName = "ventana" + randomnumber;
    var str_windowProperties = 'height=' + a_int_windowHeight + ',width=' + a_int_windowWidth + ',top=' + int_windowTop + ',left=' + int_windowLeft + ',scrollbars=' + a_bool_scrollbars + ',resizable=' + a_bool_resizable + ',menubar=' + a_bool_menubar + ',toolbar=' + a_bool_toolbar + ',statusbar=' + a_bool_statusbar + '';

    var obj_window = window.open(url, str_windowName, str_windowProperties);
    if (parseInt(navigator.appVersion) >= 4) {
        obj_window.window.focus();
    }
}