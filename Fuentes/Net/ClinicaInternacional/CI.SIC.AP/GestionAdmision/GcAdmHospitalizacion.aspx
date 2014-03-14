<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="GcAdmHospitalizacion.aspx.cs" Inherits="GestionAdmision_GcAdmHospitalizacion" %>

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

        function ValidarDatos() {
            var IdOrden = $("#<%=txtNroOrdenHosp.ClientID%>").val();
            var resp = true;
            if (IdOrden == '') {
                alert('Debe Ingresar Nro de Orden de Hospitalización');
                resp = false;
            }

            return resp;
        }

        function ValidarRegistro() {

            var est = true;
            var msg = "";
            var FecIngreso = $("#<%=txtFecIngreso.ClientID%>").val();
            var FecAlta = $("#<%=txtFecAlta.ClientID%>").val();
            var Carta = $("#<%=txtCartaGarantia.ClientID%>").val();

            var oTipOrden = $('#<%= ddlTipoOrden.ClientID %>').attr("selectedIndex");
            var oProcedencia = $('#<%= ddlProcedencia.ClientID %>').attr("selectedIndex");
            var oSede = $('#<%= ddlSede.ClientID %>').attr("selectedIndex");
            var oEspecialidad = $('#<%= ddlEspecialidad.ClientID %>').attr("selectedIndex");
            var oCama = $('#<%= ddlCama.ClientID %>').attr("selectedIndex");


            if (FecIngreso == '') { msg = "- Debe ingresar Fecha Ingreso \n"; }
            if (FecAlta == '') { msg = msg + "- Debe ingresar Fecha de Alta \n"; }

            if (oTipOrden == '0') { msg = msg + "- Debe seleccionar tipo de Orden \n"; }
            if (oProcedencia == '0') { msg = msg + "- Debe seleccionar Procedencia \n"; }
            if (oSede == '0') { msg = msg + "- Debe seleccionar Sede \n"; }
            if (oEspecialidad == '0') { msg = msg + "- Debe seleccionar Especialidad \n"; }
            if (oCama == '0') { msg = msg + "- Debe selecionar Cama \n"; }

            if (oProcedencia == '1') {
                if (Carta == '') { msg = msg + "- Debe ingresar Nro Carta Garantía \n"; }
            }
            
            if (isDateFecIni(FecIngreso) == false) {
                est = false;
            }

            if (isDateFecFin(FecAlta) == false) {
                est = false;
            }           

            if (validaFechas(FecIngreso, FecAlta) == true) {
                msg = msg + "- La Fecha de Ingreso no puede ser mayor a la Fecha de Alta, por favor corregir \n";
                est = false;
            }

            if (validaAnio(FecIngreso, FecAlta) == true) {
                msg = msg + "- El año de las fechas de Ingreso y Alta no pueden ser menores al año actual \n";
                est = false;
            }


            if (msg != '') {
                alert(msg);
                est = false;
            }

            return est;
        }

        function validaFechas(fecha, fecha2) {
            var xMes = fecha.substring(3, 5);
            var xDia = fecha.substring(0, 2);
            var xAnio = fecha.substring(6, 10);
            var yMes = fecha2.substring(3, 5);
            var yDia = fecha2.substring(0, 2);
            var yAnio = fecha2.substring(6, 10);
            if (xAnio > yAnio) {
                return (true);
            }
            else {
                if (xAnio == yAnio) {
                    if (xMes > yMes) {
                        return (true);
                    }
                    if (xMes == yMes) {
                        if (xDia > yDia) {
                            return (true);
                        }
                        else {
                            return (false);
                        }
                    }
                    else {
                        return (false);
                    }
                }
                else {
                    return (false);
                }
            }
        }

        function validaAnio(fecha, fecha2) {

            var f = new Date();
            var ano = f.getFullYear()
          

            var xAnio = fecha.substring(6, 10);
            var yAnio = fecha2.substring(6, 10);
            if (xAnio < ano) {
                return (true);
            }
            else {
                return (false);
            }

            if (yAnio < ano) {
                return (true);
            }
            else {
                return (false);
            }
        }

        function LimpiarCampos() {
            $("#<%=txtNroOrdenHosp.ClientID%>").val("");
            $("#<%=txtFecOrden.ClientID%>").val("");
            $("#<%=txtConsulta.ClientID%>").val("");
            $("#<%=txtPrevision.ClientID%>").val("");
            $("#<%=txtProgramada.ClientID%>").val("");
            $("#<%=txtNroDiasHosp.ClientID%>").val("");
            $("#<%=txtIndicacion.ClientID%>").val("");

            $("#<%=txtNroDoc.ClientID%>").val("");
            $("#<%=txtNombre.ClientID%>").val("");
            $("#<%=txtApPat.ClientID%>").val("");
            $("#<%=txtApMat.ClientID%>").val("");
            $("#<%=txtCorreo.ClientID%>").val("");
            $("#<%=txtFecNac.ClientID%>").val("");
            $("#<%=txtDireccion.ClientID%>").val("");
            $("#<%=txtTelefono.ClientID%>").val("");

            $("#<%=txtTelefono.ClientID%>").val("");

            $('#<%= ddlSexo.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlTipoDoc.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlMedTurno.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlMedTratante.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlSedeOrden.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlMotivo.ClientID %>').get(0).selectedIndex = 0;

            $("#<%=txtFecIngreso.ClientID%>").val("");
            $("#<%=txtFecAlta.ClientID%>").val("");
            $("#<%=txtCartaGarantia.ClientID%>").val("");
            $("#<%=txtTratamiento.ClientID%>").val("");

            $('#<%= ddlTipoOrden.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlProcedencia.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlSede.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlEspecialidad.ClientID %>').get(0).selectedIndex = 0;
            $('#<%= ddlCama.ClientID %>').get(0).selectedIndex = 0;
        }
        

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
        <h2 class="recibo_dig">
            Admisión de Hospitalización
        </h2>
        <div class="box_tit">
            Datos Orden de Hospitalización
        </div>
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 100%">
                        <asp:UpdatePanel ID="updDatosOrden" runat="server">
                            <ContentTemplate>
                                <table border="0" cellspacing="3" cellpadding="0" class="Tabla_filtro_txt" style="width: 100%">
                                    <tr>
                                        <td style="width: 15%; padding: 0  0  0  0;">
                                            <div class="block_center">Nro.Orden:</div> 
                                        </td>
                                        <td style="width: 15%;">
                                           <table border="0" cellpadding="0" cellspacing="0">
                                           <tr>
                                            <td><asp:TextBox ID="txtNroOrdenHosp" runat="server" MaxLength="10"></asp:TextBox>
                                            <ext:FilteredTextBoxExtender ID="fteNroOrden" runat="server" Enabled="true" ValidChars=".° "
                                                FilterType="Numbers" TargetControlID="txtNroOrdenHosp">
                                            </ext:FilteredTextBoxExtender></td>
                                            <td valign="bottom"><asp:UpdatePanel ID="updOrden" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>                                                
                                                    <asp:Button CssClass="botonesIndividual" ToolTip="Obtener Nro.Orden" ID="btnGetOrden" Width="30px" runat="server" Text="..." OnClientClick="return ValidarDatos();"
                                                        OnClick="btnGetOrden_Click" />                                                      
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnControl" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel></td>
                                           </tr>
                                           </table> 
                                            
                                        </td>
                                        <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                        </td>
                                        <td style="width: 20%">
                                            
                                            <asp:Button ID="btnControl" runat="server" Visible="false" OnClientClick="return ValidarDatos();" />
                                        </td>
                                        <td style="width: 15%">
                                        </td>
                                        <td style="width: 20%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15; padding: 0  0  0  0;">
                                            <div class="block_center">Fecha Orden:</div> 
                                        </td>
                                        <td style="width: 15%;">
                                            <asp:TextBox ID="txtFecOrden" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                            <div class="block_center">Motivo:</div> 
                                        </td>
                                        <td style="width: 20%">
                                            <asp:DropDownList ID="ddlMotivo" runat="server" Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 15%">
                                            <div class="block_center">Previsión:</div> 
                                        </td>
                                        <td style="width: 20%;">
                                            <asp:TextBox ID="txtPrevision" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; padding: 0  0  0  0;">
                                            Sede:
                                        </td>
                                        <td style="width: 15%;">
                                            <asp:DropDownList ID="ddlSedeOrden" runat="server" Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 10%;">
                                            <div class="block_center">Consulta:</div> 
                                        </td>
                                        <td style="width: 20%">
                                            <asp:TextBox ID="txtConsulta" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="width: 15%">
                                            <div class="block_center">Fecha y Hora Programada:</div> 
                                        </td>
                                        <td style="width: 20%;">
                                            <asp:TextBox ID="txtProgramada" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; padding: 0  0  0  0;">
                                            <div class="block_center">Días Hospitalización:</div> 
                                        </td>
                                        <td style="width: 15%;">
                                            <asp:TextBox ID="txtNroDiasHosp" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="width: 10%;">
                                            <div class="block_center">Médico Tratante:</div> 
                                        </td>
                                        <td style="width: 20%">
                                            <asp:DropDownList ID="ddlMedTratante" runat="server" Style="width: 100%; font-size: 11px;"
                                                Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 15%">
                                            <div class="block_center">Médico Turno:</div> 
                                        </td>
                                        <td style="width: 20%;">
                                            <asp:DropDownList ID="ddlMedTurno" runat="server" Style="width: 100%; font-size: 11px;"
                                                Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 15%;">
                                            <div class="block_center">Indicaciones:</div> 
                                        </td>
                                        <td colspan="5">
                                            <asp:TextBox ID="txtIndicacion" runat="server" Enabled="false" Style="width: 99%"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                           <asp:AsyncPostBackTrigger ControlID="btnRegistrar" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="box_tit reg_title" id="divSpanDP" runat="server" style="width: 98%">
                            Datos del Paciente</div>
                        <asp:UpdatePanel ID="updPaciente" runat="server">
                            <ContentTemplate>
                                <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                                    <tr>
                                        <td style="width: 30%">
                                            <div class="block_center">Tipo De documento:</div> 
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <div class="block_center">Nro. Documento:</div> 
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <asp:DropDownList ID="ddlTipoDoc" runat="server" Style="width: 98%" Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtNroDoc" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <div class="block_center">Nombre:</div> 
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <div class="block_center">Apellido Paterno:</div> 
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <div class="block_center">Apellido Materno:</div> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtNombre" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtApPat" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtApMat" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <div class="block_center">Sexo:</div> 
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <div class="block_center">Celular:</div> 
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <div class="block_center">Correo electrónico:</div> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <asp:DropDownList ID="ddlSexo" runat="server" Style="width: 98%" Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtTelefono" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtCorreo" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <div class="block_center">Fecha Nacimiento:</div> 
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td colspan="3">
                                            <div class="block_center">Dirección:</div> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtFecNac" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtDireccion" runat="server" Style="width: 98%" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="padding: 0  0  10px  0;">
                                            <asp:HiddenField ID="hdfIDPaciente" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <div class="box_tit reg_title" id="div1" runat="server" style="width: 98%; padding: 0  0  0  0;">
                            Datos del Internamiento</div>
                        <table border="0" cellspacing="3" cellpadding="0" class="Tabla_filtro_txt" style="width: 100%">
                            <tr>
                                <td style="width: 15%; padding: 0  0  0  0;">
                                    <div class="block_center">Fec. Ingreso:</div> 
                                </td>
                                <td style="width: 15%;">
                                    <asp:TextBox ID="txtFecIngreso" runat="server"></asp:TextBox>
                                    <ext:MaskedEditExtender ID="meeFecIngreso" runat="server" TargetControlID="txtFecIngreso"
                                        Mask="99/99/9999" MessageValidatorTip="true" MaskType="Date" ErrorTooltipEnabled="True"
                                        CultureName="es-PE" />
                                    <ext:CalendarExtender ID="txtFecIngreso_CalendarExtender" runat="server" TargetControlID="txtFecIngreso"
                                        Format="dd/MM/yyyy" PopupPosition="BottomLeft" />
                                </td>
                                <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                    <div class="block_center">Tipo Orden:</div> 
                                </td>
                                <td style="width: 20%">
                                    <asp:DropDownList ID="ddlTipoOrden" runat="server" Style="width: 100%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%">
                                    <div class="block_center">Procedencia:</div> 
                                </td>
                                <td style="width: 20%;">
                                    <asp:DropDownList ID="ddlProcedencia" runat="server" Style="width: 100%">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; padding: 0  0  0  0;">
                                    <div class="block_center">Sede:</div> 
                                </td>
                                <td style="width: 15%;">
                                    <asp:DropDownList ID="ddlSede" runat="server" Style="width: 100%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                    <div class="block_center">Tratamiento:</div> 
                                </td>
                                <td style="width: 20%">
                                    <asp:TextBox ID="txtTratamiento" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 15%">
                                    <div class="block_center">Fec. Alta:</div> 
                                </td>
                                <td style="width: 20%;">
                                    <asp:TextBox ID="txtFecAlta" runat="server"></asp:TextBox>
                                    <ext:MaskedEditExtender ID="meeFecAlta" runat="server" TargetControlID="txtFecAlta"
                                        Mask="99/99/9999" MessageValidatorTip="true" MaskType="Date" ErrorTooltipEnabled="True"
                                        CultureName="es-PE" />
                                    <ext:CalendarExtender ID="txtFecAlta_CalendarExtender" runat="server" TargetControlID="txtFecAlta"
                                        Format="dd/MM/yyyy" PopupPosition="BottomLeft" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; padding: 0  0  0  0;">
                                    <div class="block_center">Especialidad:</div> 
                                </td>
                                <td style="width: 15%;">
                                    <asp:DropDownList ID="ddlEspecialidad" runat="server" Style="width: 98%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                    <div class="block_center">Cama:</div> 
                                </td>
                                <td style="width: 20%">
                                    <asp:DropDownList ID="ddlCama" runat="server" Style="width: 98%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%">
                                    <div class="block_center">Carta Garantía:</div> 
                                </td>
                                <td style="width: 20%;">
                                    <asp:TextBox ID="txtCartaGarantia" runat="server" MaxLength="10"></asp:TextBox>
                                    <ext:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true"
                                        ValidChars=".° " FilterType="Numbers" TargetControlID="txtCartaGarantia">
                                    </ext:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="botones" style="text-align:center">                              
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click"
                OnClientClick="return ValidarRegistro();"   /></div>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
