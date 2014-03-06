<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="Registrar.aspx.cs" Inherits="ModuloEmergenciasRegistrarEvaluacionDeInstalacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Fecha: <%= DateTime.Now.ToShortDateString() %></p>
    <p>Nombre del Enfermero Auxiliar: <asp:TextBox ID="txtNombreEnfermeroAuxiliar" runat="server"></asp:TextBox></p>
    <p>Instalación a Evaluar: <asp:DropDownList ID="ddlInstalacion" runat="server" 
            AutoPostBack="True" 
            onselectedindexchanged="ddlInstalacion_SelectedIndexChanged">
</asp:DropDownList></p>
    <asp:UpdatePanel ID="updDatos" runat="server">
        <ContentTemplate>
             <asp:GridView ID="grvLista" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"
        AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>            
            <asp:BoundField DataField="Item" HeaderText="Item" />            
            <asp:TemplateField HeaderText="Conforme">
                <ItemTemplate>                    
                        <asp:CheckBox runat="server" ID="chkConforme" Checked='<%# Eval("Conformidad") %>'/>
                </ItemTemplate>
                <ItemStyle Width="60px" HorizontalAlign="Center" />
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
        </ContentTemplate>       
    </asp:UpdatePanel>    
<asp:DropDownList ID="ddlEstado" runat="server">
</asp:DropDownList>
<asp:DropDownList ID="ddlResultado" runat="server">
</asp:DropDownList>
</asp:Content>

