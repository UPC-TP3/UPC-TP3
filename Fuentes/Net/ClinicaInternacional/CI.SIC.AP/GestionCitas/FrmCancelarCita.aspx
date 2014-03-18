<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeFile="FrmCancelarCita.aspx.cs" Inherits="GestionCitas_FrmCancelarCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
    <fieldset>
        <legend>Cancelar Citas</legend>
        <asp:GridView ID="grvCita" runat="server" Width="97%" CssClass="datos" AutoGenerateColumns="False"
            DataKeyNames="CodigoCita" OnRowCommand="grvCita_RowCommand" 
            onrowdatabound="grvCita_RowDataBound" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="FechaAgenda" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Horario_Turno" HeaderText="Horario">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="NombrePaciente" HeaderText="Paciente">
                    <HeaderStyle HorizontalAlign="Center" />                    
                </asp:BoundField>
                <asp:BoundField DataField="NombreMedico" HeaderText="Medico">
                    <HeaderStyle HorizontalAlign="Center" />                    
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                       
                        <asp:ImageButton ID="imbCancelar" runat="server" AlternateText="Cancelar" ImageUrl="~/Imagenes/Iconos/Delete.png"
                            CommandName="Cancelar" ToolTip="Cancelar" CommandArgument="<%#(short)Container.DataItemIndex%>" />
                    </ItemTemplate>
                    <ItemStyle Width="45px" HorizontalAlign="Center" />
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
    </fieldset><br />
    <br />
    <asp:Button ID="btnRegresar" runat="server" onclick="btnRegresar_Click" 
        Text="Retornar" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>
