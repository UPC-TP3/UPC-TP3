<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="generarOrdenPagoEdit.aspx.cs" Inherits="GestionImagenes_generarOrdenPagoEdit" %>

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
    <%--     <script type="text/javascript">
         $(document).ready(function () {

             $('#btnConsultar').click(function () {
                 return confirm("Seguro de Anular Contrato");
             })
         });
    </script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<script type="text/javascript">
    $(document).ready(function () {

        $('#<%= btnOrden_pago.ClientID %>').click(function () {
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

            return confirm("Seguro de Generar la Orden de Pago?");

        })



    });
    </script>

    <div class="col_04">
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="False" 
                    CssClass="recibo_dig" Font-Italic="False"></asp:Label>
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
                            <asp:TextBox ID="txtPaciente" runat="server" Width="300px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            Médico</td>
                        <td>
                            <asp:TextBox ID="txtMedico" runat="server" Width="223px" ReadOnly="True" 
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
                            &nbsp;</td>
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
                            Estado</td>
                        <td>
                            <asp:TextBox ID="txtEstado_programacion" runat="server" Width="109px" 
                                ReadOnly="True" CssClass="no_edit"></asp:TextBox>
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
                                Text="Re-Programar" onclick="btnProgramar_Click" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAnular" runat="server" Text="Anular" />
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
                                        <asp:HiddenField ID="hidId_orden_pago" runat="server" />
                                    </td>
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
                <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;<asp:RangeValidator 
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