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
        

        }
        
        //        function CleanControles() {
        //            $("#<%=txtNroOrdenHosp.ClientID%>").val("");
        //            $("#<%=txtFecOrden.ClientID%>").val("");
        //            $("#<%=txtPrevision.ClientID%>").val("");
        //            $("#<%=txtIntervencion.ClientID%>").val("");
        //            $("#<%=txtNroDiasHosp.ClientID%>").val("");
        //            $("#<%=txtMedTratante.ClientID%>").val("");
        //            $("#<%=txtIndicacion.ClientID%>").val("");

        //            $("#<%=ddlProcedencia.ClientID%>").attr("selectedIndex", 0);
        //            $("#<%=ddlMotivo.ClientID%>").attr("selectedIndex", 0);
        //            $("#<%=ddlExamen.ClientID%>").attr("selectedIndex", 0);

        //            $("#<%=txtNroDoc.ClientID%>").val("");
        //            $("#<%=txtNombre.ClientID%>").val("");
        //            $("#<%=txtApPat.ClientID%>").val("");
        //            $("#<%=txtApMat.ClientID%>").val("");
        //            $("#<%=txtTelefono.ClientID%>").val("");
        //            $("#<%=txtCorreo.ClientID%>").val("");
        //            $("#<%=ddlTipoDoc.ClientID%>").attr("selectedIndex", 0);
        //            $("#<%=ddlSexo.ClientID%>").attr("selectedIndex", 0);
        //        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
        <h2 class="recibo_dig">
            Admisión de Hospitalización
        </h2>
        <div class="box_tit">
            Orden Hospitalización
        </div>
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 100%">
                        <table border="0" cellspacing="3" cellpadding="0" class="Tabla_filtro_txt" style="width: 100%">
                            <tr>
                                <td style="width: 15%; padding: 0  0  0  0;">
                                    Nro.Orden:
                                </td>
                                <td style="width: 15%;">
                                    <asp:TextBox ID="txtNroOrdenHosp" runat="server" MaxLength="10"></asp:TextBox>
                                    <ext:FilteredTextBoxExtender ID="fteNroOrden" runat="server" Enabled="true" ValidChars=".° "
                                        FilterType="Numbers" TargetControlID="txtNroOrdenHosp">
                                    </ext:FilteredTextBoxExtender>
                                </td>
                                <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                </td>
                                <td style="width: 20%">
                                    <asp:UpdatePanel ID="updOrden" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnGetOrden" runat="server" Text="Obtener" OnClientClick="return ValidarDatos();"
                                                OnClick="btnGetOrden_Click" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnControl" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <asp:Button ID="btnControl" runat="server" Visible="false" OnClientClick="return ValidarDatos();" />
                                </td>
                                <td style="width: 15%">
                                    Fecha Orden:
                                </td>
                                <td style="width: 20%;">
                                    <asp:TextBox ID="txtFecOrden" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15; padding: 0  0  0  0;">
                                    Procedencia:
                                </td>
                                <td style="width: 15%;">
                                    <asp:DropDownList ID="ddlProcedencia" runat="server" Style="width: 100%" Enabled="false">
                                        <asp:ListItem Value="10" Text="Ambulatorio"></asp:ListItem>
                                        <asp:ListItem Value="20" Text="Emergencia"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                    Motivo:
                                </td>
                                <td style="width: 20%">
                                    <asp:DropDownList ID="ddlMotivo" runat="server" Enabled="false">
                                        <asp:ListItem Value="0" Text="Clinica"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Quirurgica"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%">
                                    Previsión:
                                </td>
                                <td style="width: 20%;">
                                    <asp:TextBox ID="txtPrevision" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; padding: 0  0  0  0;">
                                    Irtervención:
                                </td>
                                <td style="width: 15%;">
                                    <asp:TextBox ID="txtIntervencion" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                                <td style="width: 10%;">
                                    Días Hosp.:
                                </td>
                                <td style="width: 20%">
                                    <asp:TextBox ID="txtNroDiasHosp" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                                <td style="width: 15%">
                                    Médico Trat.:
                                </td>
                                <td style="width: 20%;">
                                    <asp:TextBox ID="txtMedTratante" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%;">
                                    Exa. Pre Op:
                                </td>
                                <td style="width: 15%;">
                                    <asp:DropDownList ID="ddlExamen" runat="server" Style="width: 100%" Enabled="false">
                                        <asp:ListItem Value="0" Text="SI"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="NO"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%; padding: 0 0 0 0;">
                                    Indicaciones:
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtIndicacion" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <div class="box_tit reg_title" id="divSpanDP" runat="server" style="width: 98%">
                            Datos del Paciente</div>
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                                <td style="width: 30%">
                                    Tipo De documento:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Nro. Documento:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:DropDownList ID="ddlTipoDoc" runat="server" Style="width: 98%" Enabled="false">
                                        <asp:ListItem Value="1" Text="DNI"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Pasaporte"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Licencia de Conducir"></asp:ListItem>
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
                                    Nombre:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Apellido Paterno:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Apellido Materno:
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
                                    Sexo:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Teléfono:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Correo electrónico:
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:DropDownList ID="ddlSexo" runat="server" Style="width: 98%" Enabled="false">
                                        <asp:ListItem Value="M" Text="Masculino"></asp:ListItem>
                                        <asp:ListItem Value="F" Text="Femenino"></asp:ListItem>
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
                                    Fecha Nacimiento:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    Dirección:
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
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div class="box_tit reg_title" id="div1" runat="server" style="width: 98%; padding: 0  0  0  0;">
                            Datos del Internamiento</div>
                        <table border="0" cellspacing="3" cellpadding="0" class="Tabla_filtro_txt" style="width: 100%">
                            <tr>
                                <td style="width: 15%; padding: 0  0  0  0;">
                                    Fec. Ingreso:
                                </td>
                                <td style="width: 15%;">
                                    <asp:TextBox ID="txtFecIngreso" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                    Tipo Orden:
                                </td>
                                <td style="width: 20%">
                                    <asp:TextBox ID="txtTipOrden" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 15%">
                                    Carta Garantía:
                                </td>
                                <td style="width: 20%;">
                                    <asp:TextBox ID="txtCartaGarantia" runat="server" MaxLength="10"></asp:TextBox>
                                    <ext:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true"
                                        ValidChars=".° " FilterType="Numbers" TargetControlID="txtCartaGarantia">
                                    </ext:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; padding: 0  0  0  0;">
                                    Especialidad:
                                </td>
                                <td style="width: 15%;">
                                    <asp:DropDownList ID="ddlEspecialidad" runat="server" Style="width: 98%">
                                        <asp:ListItem Value="1" Text="General"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Privado"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Traumatología"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="Fisioterapia"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="Psicología"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="Psiquiatría"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%; padding: 0px 5px 0px 0px;">
                                    Cama:
                                </td>
                                <td style="width: 20%">
                                    <asp:DropDownList ID="ddlCama" runat="server" Style="width: 98%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%">
                                </td>
                                <td style="width: 20%;">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:HiddenField ID="hdfIDPaciente" runat="server" />
                                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
