<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="FrmAgendaDetalle.aspx.cs" Inherits="GestionCitas_FrmAgendaDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
    <fieldset>
        <legend style="font-size: medium">Agenda del Medico&nbsp;&nbsp;&nbsp; </legend>
        <table class="formulario" style="font-size: 14px">
            <colgroup>
                <col style="width: 20%;" />
                <col style="width: 5%; text-align: center;" />
                <col style="width: 75%;" />
            </colgroup>
            <tr>
                <td>
                    Nombres
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:Label runat="server" ID="lblNombres"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Apellidos
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:Label runat="server" ID="lblApellidos"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Especialidad
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:Label runat="server" ID="lblEspecialidad"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:GridView ID="grvAgendaMedica" runat="server" Width="97%" CssClass="datos" AutoGenerateColumns="False"
            DataKeyNames="CodigoAgenda" OnRowCommand="grvMedico_RowCommand" 
            onrowdatabound="grvAgendaMedica_RowDataBound" CellPadding="4" 
            Font-Size="Small" ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="grvAgendaMedica_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Horario_Turno" HeaderText="Horario">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="EstadoDisplay" HeaderText="Estado">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="NumeroConsultorio" HeaderText="Consultorio" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="imbEliminar" runat="server" AlternateText="Eliminar" ImageUrl="~/Imagenes/Iconos/Delete.png"
                            CommandName="Eliminar" ToolTip="Eliminar" CommandArgument="<%#(short)Container.DataItemIndex%>" />
                        <asp:ImageButton ID="imbEditar" runat="server" AlternateText="Editar" ImageUrl="~/Imagenes/Iconos/Edit.png"
                            CommandName="Editar" ToolTip="Editar" CommandArgument="<%#(short)Container.DataItemIndex%>" />
                    </ItemTemplate>
                    <ItemStyle Width="45px" HorizontalAlign="Center"/>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:Button ID="btnCrear" runat="server" Text="Nuevo Turno" CssClass="button" 
                    onclick="btnCrear_Click" style="margin-left: 10px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="frmAgendaMedica.aspx" class="button" >Regresar al Listado</a>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>