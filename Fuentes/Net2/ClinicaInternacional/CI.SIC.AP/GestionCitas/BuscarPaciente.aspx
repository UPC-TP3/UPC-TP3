<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BuscarPaciente.aspx.cs" Inherits="GestionCitas_BuscarPaciente" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Busqueda de Pacientes</title>
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

////            function Seleccionar(sender, eventArgs) {
////                document.getElementById('= hdnCodigoPaciente.ClientId >').value = eventArgs.getDataKeyValue("CodJob");
////            }

            function select(value) 
            {
                var ret = value;
                
                window.opener.UpdatePaciente(ret); window.close(); 
            } 



        </script>
</head>
<body>
    <form id="frmbuscarpaciente" runat="server">
    <div>
    
        <br />
    
        Selecccione un paciente :<br />
        <br />
   

        <asp:GridView ID="grvPacientes" runat="server" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" AutoGenerateColumns="False" 
            DataKeyNames="CodigoPaciente" 
            onselectedindexchanged="grvPacientes_SelectedIndexChanged">    
            <AlternatingRowStyle BackColor="Gainsboro" />
           
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CodigoPaciente" HeaderText="Codigo" />
                <asp:BoundField DataField="Nombres" HeaderText="Nombres" />
                <asp:BoundField DataField="ApellidoPat" HeaderText="Apellido Paterno" />
                <asp:BoundField DataField="ApellidoMat" HeaderText="Apellido Materno" />
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
    
    </div>

       <input id="Button1" onclick="CerrarSinEvento();" type="button" value="Cancelar" />  
    </form>
</body>
</html>
