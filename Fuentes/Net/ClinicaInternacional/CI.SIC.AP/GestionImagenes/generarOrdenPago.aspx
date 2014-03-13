<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="generarOrdenPago.aspx.cs" Inherits="GestionImagenes_generarOrdenPago" %>

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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<div class="col_04">
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td style="height: 16px">
                            &nbsp;</td>
                        <td class="recibo_dig">
                            Búsqueda de Exámenes</td>
                        <td style="height: 16px">
                            &nbsp;</td>
                        <td style="height: 16px">
                            &nbsp;</td>
                        <td style="height: 16px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 16px">
                        </td>
                        <td style="height: 16px">
                        </td>
                        <td style="height: 16px">
                        </td>
                        <td style="height: 16px">
                        </td>
                        <td style="height: 16px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Paciente</td>
                        <td>
                            <asp:TextBox ID="txtPaciente" runat="server" Width="283px"></asp:TextBox>
                        </td>
                        <td>
                            Orden interna</td>
                        <td>
                            <asp:TextBox ID="txtId_orden_interna" runat="server" MaxLength="10" 
                                Width="72px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Orden Exámen</td>
                        <td>
                            <asp:TextBox ID="txtId_orden_examen" runat="server" MaxLength="6" Width="96px"></asp:TextBox>
                        </td>
                        <td>
                            Historia clínica</td>
                        <td>
                            <asp:TextBox ID="txtId_historia" runat="server" MaxLength="10" Width="72px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
                                Text="Buscar" CssClass="btn_search" />
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
                        <td>
                            &nbsp;</td>
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
                <asp:GridView ID="grvLista" runat="server" AutoGenerateColumns="False" 
                    Width="80%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hplModificar" runat="server" 
                                    
                                    NavigateUrl='<%# Eval("id_programacion", "generarOrdenPagoEdit.aspx?id={0}&accion=M") %>' 
                                    ToolTip="Modificación"><img src="../Imagenes/edit.png" alt="Modificar" 
                                    border="0" width="19" height="19" /></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Id_programacion" />
                        <asp:BoundField DataField="Id_orden_examen" HeaderText="Orden Examen" />
                        <asp:BoundField DataField="Local" HeaderText="Local" />
                        <asp:BoundField DataField="Consultorio" HeaderText="Consultorio" />
                        <asp:BoundField DataField="Examen" HeaderText="Exámen" />
                        <asp:BoundField DataField="Fecha" DataFormatString="{0:dd/MM/yyyy hh:mm}" 
                            HeaderText="Fecha" HtmlEncode="False" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
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
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>