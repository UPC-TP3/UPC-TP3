<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="requisitosExamen.aspx.cs" Inherits="GestionImagenes_requisitosExamen" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
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
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" Runat="Server">
    <div class="col_04">
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td class="recibo_dig">
                Requisitos</td>
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
                        &nbsp;<asp:Button ID="btnConsultar" runat="server" onclick="btnConsultar_Click" 
                                Text="Consultar" />
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
                            <asp:TextBox ID="txtTipo_atencion" runat="server" Width="135px" ReadOnly="True" 
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
                                CssClass="caja_texto_enabled"></asp:TextBox>
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
                            <asp:DropDownList ID="cboLocal" runat="server" AutoPostBack="True" Enabled="False" 
                                >
                            </asp:DropDownList>
                        </td>
                        <td>
                            Consultorio</td>
                        <td>
                            <asp:DropDownList ID="cboConsultorio" runat="server" 
                                
                                AutoPostBack="True" Enabled="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Horario</td>
                        <td>
                            <asp:DropDownList ID="cboHorario" runat="server" 
                                Width="137px" AutoPostBack="True" Enabled="False" 
                                >
                            </asp:DropDownList>
                        </td>
                        <td>
                            Estado</td>
                        <td>
                            <asp:TextBox ID="txtEstado_programacion" runat="server" Width="109px" 
                                ReadOnly="True" CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Especialista</td>
                        <td>
                            <asp:TextBox ID="txtEspecialista" runat="server" Width="224px" ReadOnly="True" 
                                CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:HiddenField ID="hidProgramacion" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="divSpanDP">
                                Requisitos</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <asp:GridView ID="grvListado" runat="server" AutoGenerateColumns="False" 
                                Width="90%">
                                <Columns>
                                    <asp:BoundField DataField="id_examen" HeaderText="Id_examen" Visible="False" />
                                    <asp:BoundField DataField="requisito" HeaderText="Requisitos" />
                                    <asp:TemplateField HeaderText="Cumple requisito ?">
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkCumple" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <asp:Button ID="btnVerificar" runat="server" Text="Verificar" 
                                onclick="btnVerificar_Click" 
                                onclientclick="javascript:return confirm(&quot;Seguro de realizar la Verificación?&quot;)" />
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
