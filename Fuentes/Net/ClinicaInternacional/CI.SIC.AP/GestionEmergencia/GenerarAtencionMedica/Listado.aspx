<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="Listado.aspx.cs" Inherits="GenerarAtencionMedica_Listado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
        <table style="width: 100%;">
            <tr>
                <td>
                    DNI Paciente
                </td>
                <td>
                    <asp:TextBox ID="txtDNIPaciente" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Nro Ingreso
                </td>
                <td>
                    <asp:TextBox ID="txtNroIngreso" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblMensaje" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
                        <tr>
                <td colspan="3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GestionEmergencia/GenerarAtencionMedica/AtencionMedica.aspx">Nuevo Ingreso</asp:HyperLink>
                </td>
            </tr>
        </table>
    <br />
        <asp:GridView ID="grvLista" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"
            AutoGenerateColumns="False" OnRowCommand="grvLista_RowCommand" 
            DataKeyNames="id" AllowPaging="True" 
            onpageindexchanging="grvLista_PageIndexChanging">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Nro" />
                <asp:BoundField DataField="fechaIngreso" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha Ingreso">
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="DNIPaciente" HeaderText="DNI Paciente"></asp:BoundField>
                <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
                <asp:BoundField DataField="Medico" HeaderText="Medico" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="imbEditar" runat="server" AlternateText="Editar" ImageUrl="~/Imagenes/edit.png"
                            CommandName="Editar" ToolTip="Editar Registro" CommandArgument='<%# Eval("id") %>' />
                        <asp:ImageButton ID="imbVer" runat="server" AlternateText="Ver" ImageUrl="~/Imagenes/ver.png"
                            CommandName="Ver" ToolTip="Ver Registro" CommandArgument='<%# Eval("id") %>' />
                        <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Ver" ImageUrl="~/Imagenes/borrar.png"
                            CommandName="Borrar" ToolTip="Borrar Registro" CommandArgument='<%# Eval("id") %>' />
                    </ItemTemplate>
                    <ItemStyle Width="60px" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>
</asp:Content>
