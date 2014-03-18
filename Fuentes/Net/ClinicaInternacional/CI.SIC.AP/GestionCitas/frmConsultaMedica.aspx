<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="frmConsultaMedica.aspx.cs" Inherits="GestionCitas_frmConsultaMedica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">

<p>
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" 
        Text="Seleccionar Cita Medica"></asp:Label>
    </p>

<table class="formulario">
                                    <colgroup>
                                        <col style="width: 20%;" />
                                        <col style="width: 5%; text-align: center;" />
                                        <col style="width: 75%;" />
                                    </colgroup>
                                    <tr>
                                        <td>
                                            Medico</td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cboMedico" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                            Ingrese DNI&nbsp; 
                                        </td>
                                        <td class="style1">
                                           :
                                        </td>
                                        <td class="style1">
                                            <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
                                                Text="Buscar" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                       </table>

    <asp:GridView ID="grvCitas" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="CodigoCita" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Font-Size="Small" 
        ForeColor="#333333" GridLines="None" Width="694px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CodigoCita" HeaderText="Codigo" />
            <asp:BoundField DataField="FechaAgenda" HeaderText="Fecha" 
                DataFormatString="{0:d}" />
            <asp:BoundField DataField="NumeroConsultorio" HeaderText="Consultorio" />
            <asp:BoundField DataField="Horario_Turno" HeaderText="Horario" />
            <asp:BoundField DataField="NombrePaciente" HeaderText="Paciente" />
            <asp:BoundField DataField="Dni" HeaderText="DNI" />
            <asp:BoundField DataField="DesEstado" HeaderText="Estado" />
            
            <asp:CommandField ShowSelectButton="True" />
            
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
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

