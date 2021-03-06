﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" ClientIDMode="Static"  CodeFile="programacionImagenesEdit.aspx.cs" Inherits="GestionImagenes_programacionImagenesEdit" %>

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
    <script language="javascript" type="text/javascript" src="../js/jquery-1.7.1.js" ></script>
    <script type="text/javascript">
        function fnMensaje(pvMensaje) {
            alert(pvMensaje);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">

        <script type="text/javascript">


            $(document).ready(function () {

                $('#<%= btnReProgramar.ClientID %>').click(function () {


                    if ($('#<%= txtId_orden_examen.ClientID %>').val() == "") {
                        alert("Ingrese Orden de Examen");
                        $('#<%= txtId_orden_examen.ClientID %>').focus();
                        return false;
                    }
                    if ($('#<%= txtId_historia.ClientID %>').val() == "") {
                        alert("Orden de Examen Inválido");
                        $('#<%= txtId_orden_examen.ClientID %>').focus();
                        return false;
                    }
                    var cboL = 'select#' + '<%= cboLocal.ClientID %>';
                    if ($(cboL).val() == "0") {
                        alert("Seleccione Local");
                        $(cboL).focus();
                        return false;
                    }

                    var cboC = 'select#' + '<%= cboConsultorio.ClientID %>';
                    if ($(cboC).val() == "0") {
                        alert("Seleccione Sala");
                        $(cboC).focus();
                        return false;
                    }

                    var cboH = 'select#' + '<%= cboHorario.ClientID %>';
                    if ($(cboH).val() == "0") {
                        alert("Seleccione Horario");
                        $(cboH).focus();
                        return false;
                    }

                    if ($('#<%= txtMotivoR.ClientID %>').val() == "") {
                        alert("Ingrese Motivo de Reprogramación");
                        $('#<%= txtMotivoR.ClientID %>').focus();
                        return false;
                    }
                    //e.preventDefault();
                    return confirm("Seguro de Realizar la Re-Programación?");

                })


                $('#<%= btnProgramar.ClientID %>').click(function () {

                    if ($('#<%= txtEstado_orden_examen.ClientID %>').val() != "Pagada") {
                        alert("Primero debe realizar el pago.");
                        $('#<%= txtEstado_orden_examen.ClientID %>').focus();
                        return false;
                    }

                    if ($('#<%= txtId_orden_examen.ClientID %>').val() == "") {
                        alert("Ingrese Orden de Examen");
                        $('#<%= txtId_orden_examen.ClientID %>').focus();
                        return false;
                    }
                    if ($('#<%= txtId_historia.ClientID %>').val() == "") {
                        alert("Orden de Examen Inválido");
                        $('#<%= txtId_orden_examen.ClientID %>').focus();
                        return false;
                    }
                    var cboL = 'select#' + '<%= cboLocal.ClientID %>';
                    if ($(cboL).val() == "0") {
                        alert("Seleccione Local");
                        $(cboL).focus();
                        return false;
                    }

                    var cboC = 'select#' + '<%= cboConsultorio.ClientID %>';
                    if ($(cboC).val() == "0") {
                        alert("Seleccione Sala");
                        $(cboC).focus();
                        return false;
                    }

                    var cboH = 'select#' + '<%= cboHorario.ClientID %>';
                    if ($(cboH).val() == "0") {
                        alert("Seleccione Horario");
                        $(cboH).focus();
                        return false;
                    }
                    //e.preventDefault();
                    return confirm("Seguro de Realizar Programación?");

                })
            });
    </script>
    <div class="col_04">
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td colspan="4">
                            <div class="box_tit">
                                Orden de Examen</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Orden de examen</td>
                        <td>
                            <asp:TextBox ID="txtId_orden_examen" runat="server" Width="85px" 
                                ontextchanged="txtId_orden_examen_TextChanged"></asp:TextBox>
                        &nbsp;
                            <asp:Button ID="btnConsultar" runat="server" Text="Consultar" 
                                onclick="btnConsultar_Click" />
                        </td>
                        <td>
                            Fecha orden</td>
                        <td>
                            <asp:TextBox ID="txtFecha_examen" runat="server" Width="83px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Estado</td>
                        <td>
                            <asp:TextBox ID="txtEstado_orden_examen" runat="server" Width="95px" 
                                ReadOnly="True" CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Orden atención</td>
                        <td>
                            <asp:TextBox ID="txtId_orden_atencion" runat="server" Width="84px" 
                                ReadOnly="True" CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            Tipo atención</td>
                        <td>
                            <asp:TextBox ID="txtTipo_atencion" runat="server" Width="142px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Historia clínica</td>
                        <td>
                            <asp:TextBox ID="txtId_historia" runat="server" Width="84px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Paciente</td>
                        <td>
                            <asp:TextBox ID="txtPaciente" runat="server" Width="208px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            Médico</td>
                        <td>
                            <asp:TextBox ID="txtMedico" runat="server" Width="206px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tipo examen</td>
                        <td>
                            <asp:DropDownList ID="cboTipo_examen" runat="server" Enabled="False" 
                                CssClass="no_edit">
                            </asp:DropDownList>
                        </td>
                        <td>
                            Examen</td>
                        <td>
                            <asp:TextBox ID="txtExamen" runat="server" ReadOnly="True" Width="216px" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Precio S/.</td>
                        <td>
                            <asp:TextBox ID="txtPrecio" runat="server" ReadOnly="True" Width="57px" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:HiddenField ID="hidProgramacion" runat="server" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="box_tit">
                                Programación</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Local</td>
                        <td>
                            <asp:DropDownList ID="cboLocal" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="cboLocal_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            Sala</td>
                        <td>
                            <asp:DropDownList ID="cboConsultorio" runat="server" 
                                onselectedindexchanged="cboConsultorio_SelectedIndexChanged" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Horario</td>
                        <td>
                            <asp:DropDownList ID="cboHorario" runat="server" 
                                Width="137px" AutoPostBack="True" 
                                onselectedindexchanged="cboHorario_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblEstado_programacion" runat="server" 
                                Font-Names="Verdana;Arial;Hervetica" Font-Size="10px" Text="Estado" 
                                Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEstado_programacion" runat="server" Width="109px" 
                                ReadOnly="True" CssClass="no_edit" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Especialista</td>
                        <td>
                            <asp:TextBox ID="txtEspecialista" runat="server" Width="224px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMotivoR" runat="server" Text="Motivo Reprogramación" 
                                Font-Names="Verdana;Arial;Hervetica,10px" Font-Size="10px"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtMotivoR" runat="server" Width="459px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblHistorial" runat="server" Text="Historial programación" 
                                Font-Names="Verdana;Arial;Hervetica,10px" Font-Size="10px" Visible="False"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                <asp:GridView ID="grvProgramacion" runat="server" AutoGenerateColumns="False" 
                    Width="98%" CssClass="mGrid">
                    <Columns>
<%--                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hplModificar" runat="server" 
                                    
                                    NavigateUrl='<%# Eval("id_programacion", "programacionImagenesEdit.aspx?id={0}&accion=M") %>' 
                                    ToolTip="Modificación"><img src="../Imagenes/edit.png" alt="Modificar" 
                                    border="0" width="19" height="19" /></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField DataField="Id_programacion" Visible="False" />
                        <asp:BoundField DataField="Id_orden_examen" HeaderText="Orden Examen" 
                            Visible="False" />
                        <asp:BoundField DataField="Local" HeaderText="Local" />
                        <asp:BoundField DataField="Consultorio" HeaderText="Consultorio" />
                        <asp:BoundField DataField="Examen" HeaderText="Exámen" />
                        <asp:BoundField DataField="Fecha" DataFormatString="{0:dd/MM/yyyy hh:mm}" 
                            HeaderText="Fecha" HtmlEncode="False" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" Visible="False" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
<%--                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hplAnular" runat="server" 
                                    
                                    NavigateUrl='<%# Eval("id_programacion", "programacionImagenesEdit.aspx?id={0}&accion=A") %>' 
                                    ToolTip="Anular"><img src="../Imagenes/borrar.png" alt="Modificar" border="0" width="18" height="18" /></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                            <asp:Button ID="btnProgramar" runat="server" 
                                Text="Programar" onclick="btnProgramar_Click" />
                                    </td>
                                    <td>
                            <asp:Button ID="btnReProgramar" runat="server" 
                                Text="Re-Programar" onclick="btnReProgramar_Click"/>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAnular" runat="server" onclick="btnAnular_Click" 
                                            Text="Anular" />
                                    </td>
                                    <td>
                            <asp:Button ID="btnOrden_pago" runat="server" 
                                Text="Generar Orden Pago" onclick="btnOrden_pago_Click" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            onclick="btnCerrar_Click" Text="Cancelar" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:HiddenField ID="hidAccion" runat="server" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <asp:RangeValidator 
                    ID="RangeValidator1" runat="server" ControlToValidate="txtId_orden_examen" 
                    ErrorMessage="Debe ser numérico" Font-Bold="True" ForeColor="Red" 
                    MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>