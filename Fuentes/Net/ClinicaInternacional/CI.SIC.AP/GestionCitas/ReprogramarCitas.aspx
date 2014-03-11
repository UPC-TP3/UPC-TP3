<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="ReprogramarCitas.aspx.cs" Inherits="GestionCitas_ReprogramarCitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
    <asp:GridView ID="grvCitas" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="CodigoCita" onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="Reprogramar" ShowSelectButton="True" />
            <asp:BoundField DataField="CodigoCita" HeaderText="Codigo" />
            <asp:BoundField DataField="FechaAgenda" HeaderText="Fecha" />
            <asp:BoundField DataField="NumeroConsultorio" HeaderText="Consultorio" />
            <asp:BoundField DataField="HoraInicioAgenda" HeaderText="Hora Inicio" />
            <asp:BoundField DataField="HoraFinAgenda" HeaderText="Hora Fin" />
            <asp:BoundField DataField="NombrePaciente" HeaderText="Paciente" />
            <asp:BoundField DataField="Dni" HeaderText="DNI" />
            <asp:BoundField DataField="NombreMedico" HeaderText="Medico" />
            
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnNuevo" runat="server" onclick="btnNuevo_Click" 
        Text="Nueva Cita" />
    <asp:Button ID="btnCancelar" runat="server" onclick="Button1_Click" 
        Text="Cancelar Citas" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

