<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="Consultar.aspx.cs" Inherits="EvaluacionDeInstalacionConsultar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="grvLista" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"
        AutoGenerateColumns="False" onrowcommand="grvLista_RowCommand">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="Fecha" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha Evaluación">
                <ItemStyle HorizontalAlign="Center" Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="NombreDisponibilidad" HeaderText="Estado" />
            <asp:BoundField DataField="NombreResultado" HeaderText="Resultado" />
            <asp:BoundField DataField="NombreEnfermeroAuxiliar" HeaderText="Nombre Evaluador" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="imbEditar" runat="server" AlternateText="Editar" ImageUrl="~/Imagenes/edit.png"
                        CommandName="Editar" ToolTip="Editar Registro" CommandArgument='<%# Eval("IdEvaluacion") %>'/>
                </ItemTemplate>
                <ItemStyle Width="20px" />
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
</asp:Content>
