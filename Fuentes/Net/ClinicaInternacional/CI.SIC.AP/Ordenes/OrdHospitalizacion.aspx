<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="OrdHospitalizacion.aspx.cs" Inherits="Ordenes_OrdHospitalizacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ext" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .col_04 span
        {
            padding: 0px 0px 0px 0px;
            text-align: inherit;
        }
        .ValidacionMensaje
        {
            font-size: 11px;
            color: Red;
        }
    </style>
    <script type="text/javascript">

        function imgBtnFiltrar_Mouseover(object) { object.src = object.src.replace("img_filtro.gif", "img_filtro_hover.gif"); }
        function imgBtnFiltrar_Mouseout(object) { object.src = object.src.replace("img_filtro_hover.gif", "img_filtro.gif"); }
        function imgBtnBorrarFiltro_Mouseover(object) { object.src = object.src.replace("img_borrarfiltro.gif", "img_borrarfiltro_hover.gif"); }
        function imgBtnBorrarFiltro_Mouseout(object) { object.src = object.src.replace("img_borrarfiltro_hover.gif", "img_borrarfiltro.gif"); }

        function imgBtnBorrarFiltro_Click() {
            $('#Contenido_txtFechaInicio').val("");
            $('#Contenido_txtFechaFin').val("");
        }




        function lnkNuevoRegistro_Click() {
            $('#Contenido_lbl1').html('Registro de Orden de Hospitalización');
            cleanerFields();
            showModalPopup('bmpRegAct');

            return false;
        }

        function ValidarDatos() {
            var IdOrden = $("#<%=txtNroDoc.ClientID%>").val();
            var oTipoDoc = $('#<%= ddlTipoDoc.ClientID %>').attr("selectedIndex");

            var resp = true;

            if (IdOrden == '') {
                alert('Debe Ingresar Nro de documento de identidad');
                resp = false;
            }

            if (oTipoDoc == '0') {
                alert('Debe seleccionar el tipo de documento');
                resp = false;
            }


            return resp;
        }


        function cleanerFields() {
            $('#<%= ddlTipoDoc.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlSexo.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlSede.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlMotivo.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlMedTurno.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlMedTratante.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlProcedencia.ClientID %>').get(0).selectedIndex = 0;

            $("#<%=txtNroDoc.ClientID%>").val("");
            $("#<%=txtNombres.ClientID%>").val("");
            $("#<%=txtPaterno.ClientID%>").val("");
            $("#<%=txtMaterno.ClientID%>").val("");

            $("#<%=txtFecha.ClientID%>").val("");
            $("#<%=txtNroDias.ClientID%>").val("");
            $("#<%=txtPrevision.ClientID%>").val("");

            $("#<%=txtIdConsulta.ClientID%>").val("");
            $("#<%=txtExaPreOpera.ClientID%>").val("");
        }

        function ValidarRegistro() {
            var est = true;
            var msg = "";

            var FecRegistro = $("#<%=txtFecha.ClientID%>").val();
            var oNroDias = $("#<%=txtNroDias.ClientID%>").val();
            var oConsulta = $("#<%=txtIdConsulta.ClientID%>").val();

            var oSede = $('#<%= ddlSede.ClientID %>').attr("selectedIndex");
            var oMotivo = $('#<%= ddlMotivo.ClientID %>').attr("selectedIndex");
            var oMTratante = $('#<%= ddlMedTratante.ClientID %>').attr("selectedIndex");
            var oMedTurno = $('#<%= ddlMedTurno.ClientID %>').attr("selectedIndex");
            var oProcedencia = $('#<%= ddlProcedencia.ClientID %>').attr("selectedIndex");

            if (FecRegistro == '') { msg = msg + "- Debe ingresar Fecha Programada \n"; }
            if (oNroDias == '') { msg = msg + "- Debe ingresar Nro de días\n"; }
            if (oConsulta == '') { msg = msg + "- Debe ingresar el Nro de Consulta\n"; }

            if (oSede == '0') { msg = msg + "- Debe seleccionar Sede \n"; }
            if (oMotivo == '0') { msg = msg + "- Debe seleccionar el Motivo \n"; }
            if (oMTratante == '0') { msg = msg + "- Debe seleccionar el Médico Tratante \n"; }
            if (oMedTurno == '0') { msg = msg + "- Debe seleccionar el Médico de Turno \n"; }
            if (oProcedencia == '0') { msg = msg + "- Debe seleccionar la procedencia \n"; }

            if (msg != '') {
                alert(msg);
                est = false;
            }

            return est;
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
        <h2 class="recibo_dig">
            Orden de Hospitalización
        </h2>
        <div class="box_tit">
            Datos Paciente
        </div>
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 100%">
                        <table class="Tabla_filtro_txt" width="100%">
                            <tr>
                                <td>
                                    <div style="width: 128px; float: left; font-weight: 600; padding-bottom: 5px;">
                                        Fecha Creación</div>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="width: 128px; float: left; font-weight: 600;">
                                        Inicio</div>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <div style="width: 128px; float: left; font-weight: 600;">
                                        Fin</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtFechaInicio" class="celeste_cuadro" runat="server" ToolTip="dd/mm/yyyy"
                                        Width="180px" />
                                    <ext:MaskedEditExtender ID="meeFechaInicio" runat="server" TargetControlID="txtFechaInicio"
                                        Mask="99/99/9999" MessageValidatorTip="true" MaskType="Date" ErrorTooltipEnabled="True" />
                                    <ext:CalendarExtender ID="ceFechaInicio" runat="server" TargetControlID="txtFechaInicio"
                                        Format="dd/MM/yyyy" />
                                    <ext:MaskedEditValidator ID="mevFecInicio" runat="server" CssClass="ValidacionMensaje"
                                        ControlExtender="meeFechaInicio" ControlToValidate="txtFechaInicio" IsValidEmpty="True"
                                        InvalidValueMessage="Fecha invalida" TooltipMessage="" EmptyValueBlurredText=" "
                                        InvalidValueBlurredMessage="" SetFocusOnError="true" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFechaFin" class="celeste_cuadro" runat="server" ToolTip="dd/mm/yyyy"
                                        Width="180px" />
                                    <ext:MaskedEditExtender ID="meeFechaFin" runat="server" TargetControlID="txtFechaFin"
                                        Mask="99/99/9999" MessageValidatorTip="true" MaskType="Date" ErrorTooltipEnabled="True" />
                                    <ext:CalendarExtender ID="ceFechaFin" runat="server" TargetControlID="txtFechaFin"
                                        Format="dd/MM/yyyy" />
                                    <ext:MaskedEditValidator ID="mevFechaFin" runat="server" CssClass="ValidacionMensaje"
                                        ControlExtender="meeFechaFin" ControlToValidate="txtFechaFin" IsValidEmpty="True"
                                        InvalidValueMessage="Fecha invalida" TooltipMessage="" EmptyValueBlurredText=" "
                                        InvalidValueBlurredMessage="" SetFocusOnError="true" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="separador">
                        <asp:ImageButton runat="server" ID="imgBtnFiltrar" OnClick="imgBtnBuscar_Click" onmouseover="imgBtnFiltrar_Mouseover(this);"
                            onmouseout="imgBtnFiltrar_Mouseout(this);" ImageUrl="~/css/img/img_filtro.gif"  />
                        <asp:ImageButton runat="server" ID="imgBtnBorrarFiltro" OnClientClick="imgBtnBorrarFiltro_Click();"
                            onmouseover="imgBtnBorrarFiltro_Mouseover(this);" onmouseout="imgBtnBorrarFiltro_Mouseout(this);"
                            CausesValidation="false" ImageUrl="~/css/img/img_borrarfiltro.gif"  OnClick="imgBtnBuscar_Click"/>
                    </div>
                    <div class="box_c2" style="margin-top: 15px; width: 680px;">
                        <div class="f5f6f6_01_1">
                            <div class="f5f6f6_02">
                            </div>
                        </div>
                        <div class="cont_c02_detalle">
                            <h3 class="subtit_c44">
                                Actualizar Orden de Hospitalización</h3>
                            <p class="parrafo_111">
                                Selecciona una Orden que deseas actualizar:
                            </p>
                            <p class="parrafo_111">
                                <asp:LinkButton ID="lnkNuevoRegistro" runat="server" class="celeste_azul" OnClientClick="return lnkNuevoRegistro_Click();">Registrar Nuevo</asp:LinkButton>
                            </p>
                            <asp:UpdatePanel ID="updDetalle" runat="server" style="padding-left: 29px;" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel ID="pngv" runat="server" Width="650px" ScrollBars="Horizontal">
                                        <asp:GridView ID="gvOrdenes" runat="server" CssClass="GrivView" AllowPaging="True" CellPadding="1" CellSpacing="3"
                                            PageIndex="20" ShowFooter="True" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="gvOrdenes_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="ID_Orden_Hospitalizacion" HeaderText="Nro Orden" />
                                                <asp:BoundField DataField="FechaOrden" HeaderText="Fecha Registro" />
                                                <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
                                                <asp:BoundField DataField="DescripcionInternamiento" HeaderText="Motivo" />
                                                <asp:BoundField DataField="MedTratante" HeaderText="Médico Tratante" />
                                                <asp:BoundField DataField="MedTurno" HeaderText="Médico Turno" />
                                            </Columns>
                                            <HeaderStyle CssClass="tits"></HeaderStyle>
                                            <AlternatingRowStyle CssClass="bg_f6f7f9" HorizontalAlign="Left" />
                                            <RowStyle HorizontalAlign="Left" />
                                            <PagerSettings Mode="NextPreviousFirstLast" />
                                            <PagerStyle CssClass="pager_gvLineas" />
                                            <EmptyDataTemplate>
                                                No existen registros</EmptyDataTemplate>
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="imgBtnFiltrar" />
                                    <asp:AsyncPostBackTrigger ControlID="imgBtnBorrarFiltro" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div class="fff_03_bla width700">
                            <div class="fff_04_bla">
                            </div>
                        </div>
                    </div>
                    <asp:Panel ID="pnlRegAct" runat="server" CssClass="cuadrodes" Style="width: 720px;">
                        <div class="ubi-main-popclave">
                            <div class="close-popclave" style="width: 680px;">
                                <div class="ubi-close-popclave" style="width: 680px;">
                                    <a href="#" onclick="hideModalPopup('bmpRegAct');">cerrar</a>
                                </div>
                            </div>
                            <div id="tituloCuenta" class="lineblu" style="position: relative; width: 670px;">
                                <h2 style="font-weight: bold;">
                                    <asp:Label ID="lbl1" runat="server" CssClass="reg_establ" Style="color: White;" Text="Actualizar Orden"></asp:Label>
                                </h2>
                            </div>
                            <div class="txt_linese" style="padding-left: 0px; padding-bottom: 0px; width: 700px;">
                                <div class="">
                                    <div class="cont_c02_detalle2 width700" style="display: table; width: 687px">
                                        <asp:UpdatePanel ID="updOrden" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <table border="0" cellspacing="3" cellpadding="0" class="Tabla_filtro_txt" style="width: 645">
                                                    <asp:HiddenField ID="hdfIDPaciente" runat="server" />
                                                    <tr>
                                                        <td style="width: 20%" class="block_center">
                                                            Tipo Doc.:
                                                        </td>
                                                        <td style="width: 15%">
                                                            <asp:DropDownList ID="ddlTipoDoc" runat="server" Style="width: 99%">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="width: 20%" class="block_center">
                                                            Documento:
                                                        </td>
                                                        <td style="width: 15%">
                                                            <asp:TextBox ID="txtNroDoc" runat="server" style="width: 70%"></asp:TextBox>
                                                            <asp:Button CssClass="botonesIndividual" ToolTip="Obtener Nro.Orden" ID="btnGetOrden"
                                                                Width="20px" runat="server" Text="..." OnClick="btnGetOrden_Click"  style="width: 20%" />
                                                        </td>
                                                        <td style="width: 20%" class="block_center">
                                                            Sexo:
                                                        </td>
                                                        <td style="width: 15%">
                                                            <asp:DropDownList ID="ddlSexo" Enabled="false" runat="server" Style="width: 99%">
                                                                <asp:ListItem Value="M" Text="Masculino"></asp:ListItem>
                                                                <asp:ListItem Value="F" Text="Femenino"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 20%" class="block_center">
                                                            Nombre:
                                                        </td>
                                                        <td style="width: 15%">
                                                            <asp:TextBox ID="txtNombres" runat="server" Enabled="false"></asp:TextBox>
                                                        </td>
                                                        <td style="width: 20%" class="block_center">
                                                            Ap. Paterno:
                                                        </td>
                                                        <td style="width: 15%">
                                                            <asp:TextBox ID="txtPaterno" runat="server" Enabled="false"></asp:TextBox>
                                                        </td>
                                                        <td style="width: 20%" class="block_center">
                                                            Ap. Materno:
                                                        </td>
                                                        <td style="width: 15%">
                                                            <asp:TextBox ID="txtMaterno" runat="server" Enabled="false"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnControl" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:Button ID="btnControl" runat="server" Visible="false" OnClientClick="return ValidarDatos();" />
                                    </div>
                                    <div>
                                   

                                    </div>
                                    <div style="font-weight: 600; padding: 10px 0px 10px 0px;">
                                        Datos Orden de Hospitalización
                                    </div>
                                    <div class="cont_c02_detalle2 width700" style="display: table; width: 650px">
                                        <asp:UpdatePanel ID="uplDatosOrden" runat="server">
                                            <ContentTemplate>
                                                <table border="0" cellspacing="3" cellpadding="0" class="Tabla_filtro_txt" style="width: 645">
                                                    <tr>
                                                        <td style="width: 15%" class="block_center">
                                                            Fecha Hospita.:
                                                        </td>
                                                        <td style="width: 20%" class="block_center">
                                                            <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
                                                            <ext:MaskedEditExtender ID="meeFecIngreso" runat="server" TargetControlID="txtFecha"
                                                                Mask="99/99/9999" MessageValidatorTip="true" MaskType="Date" ErrorTooltipEnabled="True"
                                                                CultureName="es-PE" />
                                                            <ext:CalendarExtender ID="txtFecIngreso_CalendarExtender" runat="server" TargetControlID="txtFecha"
                                                                Format="dd/MM/yyyy" PopupPosition="BottomLeft" />
                                                        </td>
                                                        <td style="width: 10%" class="block_center">
                                                            Sede:
                                                        </td>
                                                        <td style="width: 20%">
                                                            <asp:DropDownList ID="ddlSede" runat="server" Style="width: 98%">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="width: 15%" class="block_center">
                                                            Días Hospita.:
                                                        </td>
                                                        <td style="width: 20%">
                                                            <asp:TextBox ID="txtNroDias" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 15%" class="block_center">
                                                            Motivo:
                                                        </td>
                                                        <td style="width: 20%">
                                                            <asp:DropDownList ID="ddlMotivo" runat="server" Style="width: 98%">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="width: 10%" class="block_center">
                                                            Previsión:
                                                        </td>
                                                        <td style="width: 20%">
                                                            <asp:TextBox ID="txtPrevision" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="width: 15%" class="block_center">
                                                            Cod. Consulta:
                                                        </td>
                                                        <td style="width: 20%">
                                                            <asp:TextBox ID="txtIdConsulta" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 15%" class="block_center">
                                                            Médico Tratante:
                                                        </td>
                                                        <td style="width: 20%">
                                                            <asp:DropDownList ID="ddlMedTratante" runat="server" Style="width: 98%">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="width: 10%" class="block_center">
                                                            Médico Turno:
                                                        </td>
                                                        <td style="width: 20%">
                                                            <asp:DropDownList ID="ddlMedTurno" runat="server" Style="width: 98%">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="width: 15%" class="block_center">
                                                            Procedencia:
                                                        </td>
                                                        <td style="width: 20%">
                                                            <asp:DropDownList ID="ddlProcedencia" runat="server" Style="width: 100%">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 15%" class="block_center">
                                                            Examenes PreOperatorios:
                                                        </td>
                                                        <td style="width: 99%" colspan="3">
                                                            <asp:TextBox ID="txtExaPreOpera" runat="server" Width="99%"></asp:TextBox>
                                                        </td>
                                                        <td style="width: 15%">
                                                        </td>
                                                        <td style="width: 20%">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 99%; text-align: center;" colspan="6">
                                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="ibguardar_Click"
                                                                OnClientClick="return ValidarRegistro();" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Button ID="btnTabla" runat="server" Style="display: none" />
                    <ext:ModalPopupExtender ID="popRegAct" runat="server" BehaviorID="bmpRegAct" PopupControlID="pnlRegAct"
                        TargetControlID="btnTabla" BackgroundCssClass="modalBackground">
                    </ext:ModalPopupExtender>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
