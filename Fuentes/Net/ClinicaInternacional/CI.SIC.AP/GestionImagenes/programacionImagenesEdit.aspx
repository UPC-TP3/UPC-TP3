<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="programacionImagenesEdit.aspx.cs" Inherits="GestionImagenes_programacionImagenesEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
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
            <td>
                <table style="width:100%;">
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
                            <asp:TextBox ID="txtFecha_examen" runat="server" Width="83px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Estado</td>
                        <td>
                            <asp:TextBox ID="txtEstado_orden_examen" runat="server" Width="95px" 
                                ReadOnly="True"></asp:TextBox>
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
                                ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            Tipo atención</td>
                        <td>
                            <asp:TextBox ID="txtTipo_atencion" runat="server" Width="142px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Historia clínica</td>
                        <td>
                            <asp:TextBox ID="txtId_historia" runat="server" Width="84px" ReadOnly="True"></asp:TextBox>
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
                            <asp:TextBox ID="txtPaciente" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            Médico</td>
                        <td>
                            <asp:TextBox ID="txtMedico" runat="server" Width="223px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tipo examen</td>
                        <td>
                            <asp:DropDownList ID="cboTipo_examen" runat="server" Enabled="False">
                            </asp:DropDownList>
                        </td>
                        <td>
                            Examen</td>
                        <td>
                            <asp:TextBox ID="txtExamen" runat="server" ReadOnly="True" Width="216px"></asp:TextBox>
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
                            <asp:TextBox ID="txtPrecio" runat="server" ReadOnly="True" Width="57px"></asp:TextBox>
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
                            <strong>Programación</strong></td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
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
                            Consultorio</td>
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
                                ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Especialista</td>
                        <td>
                            <asp:TextBox ID="txtEspecialista" runat="server" Width="224px" ReadOnly="True"></asp:TextBox>
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
                            <asp:Button ID="btnOrden_pago" runat="server" 
                                Text="Generar Orden Pago" onclick="btnOrden_pago_Click" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            onclick="btnCerrar_Click" Text="Cerrar" />
                                    </td>
                                </tr>
                                <tr>
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
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

