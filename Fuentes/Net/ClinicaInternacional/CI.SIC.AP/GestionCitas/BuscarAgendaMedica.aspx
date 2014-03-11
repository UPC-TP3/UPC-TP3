<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BuscarAgendaMedica.aspx.cs" Inherits="GestionCitas_BuscarAgendaMedica" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Buscar Agenda Medica</title>
    <base target="_self">
    </base>
        <script language="javascript" type="text/javascript">
            function CerrarConEvento() {
                window.returnValue = true;
                self.close();
            }

            function CerrarSinEvento() {
                window.returnValue = false;
                self.close();
            }

          
            function select(value) {
                var ret = value;

                window.opener.UpdateAgenda(ret); window.close();
            } 



        </script>



</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Seleccione el horario de atención<br />
        <asp:GridView ID="grvAgendaMedica" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="Vertical" 
             DataKeyNames="CodigoAgenda" 
            onselectedindexchanged="grvAgendaMedica_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CodigoAgenda" HeaderText="Codigo" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                <asp:BoundField DataField="HoraInicio" HeaderText="Hora Inicio" />
                <asp:BoundField DataField="HoraFin" HeaderText="Hora Final" />
                <asp:BoundField DataField="NumeroConsultorio" HeaderText="Nro Consultorio" />
                <asp:BoundField DataField="NombresMedico" HeaderText="Nombre Medico" />
                <asp:BoundField DataField="ApellidosMedico" HeaderText="Apellidos Medico" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <br />
    



    </div>
     <input id="Button1" onclick="CerrarSinEvento();" type="button" value="Cancelar" />  
    </form>
</body>
</html>
