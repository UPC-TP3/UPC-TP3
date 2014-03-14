<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="frmAgendaMedica.aspx.cs" Inherits="GestionCitas_frmAgendaMedica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<fieldset>
        <legend style="font-size: 13px">
            <br />
            Seleccionar Médico</legend>
        <asp:GridView ID="grvMedico" runat="server" Width="95%" CssClass="datos" AutoGenerateColumns="False"
            DataKeyNames="CodigoMedico" OnRowCommand="grvMedico_RowCommand" 
            onselectedindexchanged="grvMedico_SelectedIndexChanged" CellPadding="4" 
            Font-Size="Small" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Nombres" HeaderText="Nombres">
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos">
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DescripcionEspecialidad" HeaderText="Especialidad">
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="imbVer" runat="server" AlternateText="Ver Agenda" ImageUrl="~/Imagenes/ver.png"
                            CommandName="Ver" ToolTip="Ver Agenda" CommandArgument="<%#(short)Container.DataItemIndex%>"/>
                    </ItemTemplate>
                    <ItemStyle Width="20px" HorizontalAlign="Center" />
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
        <br />
        <a href="/" class="button" style="margin-left: 10px;margin-bottom:25px;">Cancelar</a>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

