<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="frmCitaDomicilio.aspx.cs" Inherits="GestionCitas_frmCitaDomicilio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<legend>Generar Citas Domiciliarias</legend>
    <asp:GridView ID="grvCitas" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="CodigoCita" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Font-Size="X-Small" 
        ForeColor="#333333" GridLines="None" Width="694px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CodigoCita" HeaderText="Código" />
            <asp:BoundField DataField="FechaAgenda" HeaderText="Fecha" 
                DataFormatString="{0:d}" />
            <asp:BoundField DataField="NumeroConsultorio" HeaderText="Consultorio" />
            <asp:BoundField DataField="Horario_Turno" HeaderText="Horario" />
            <asp:BoundField DataField="NombrePaciente" HeaderText="Paciente" />
            <asp:BoundField DataField="Dni" HeaderText="DNI" />
            <asp:BoundField DataField="NombreMedico" HeaderText="Medico" />
            
            <asp:CommandField SelectText="Reprogramar" ShowSelectButton="True" />
            
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnNuevo" runat="server" onclick="btnNuevo_Click" 
        Text="Nueva Cita" />
    <asp:Button ID="btnCancelar" runat="server" onclick="Button1_Click" 
        Text="Cancelar Citas" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

