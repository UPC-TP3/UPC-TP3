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
    
    <table class="formulario">
                                    <colgroup>
                                        <col style="width: 20%;" />
                                        <col style="width: 5%; text-align: center;" />
                                        <col style="width: 75%;" />
                                    </colgroup>
                                    <tr>
                                        <td>
                                            Dni
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDni" runat="server" 
                                                Width="93px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                            Apellido 
                                        </td>
                                        <td class="style1">
                                           :
                                        </td>
                                        <td class="style1">
                                            <asp:TextBox ID="txtApellido" runat="server" Width="234px"></asp:TextBox>
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


        <br />   
        Selecccione un paciente :<br />
        <br />
   

        <asp:GridView ID="grvPacientes" runat="server" CellPadding="4" 
            GridLines="None" AutoGenerateColumns="False" 
            DataKeyNames="CodigoPaciente" 
            onselectedindexchanged="grvPacientes_SelectedIndexChanged" 
            ForeColor="#333333">    
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CodigoPaciente" HeaderText="Codigo" />
                <asp:BoundField DataField="Nombres" HeaderText="Nombres" />
                <asp:BoundField DataField="ApellidoPat" HeaderText="Apellido Paterno" />
                <asp:BoundField DataField="ApellidoMat" HeaderText="Apellido Materno" />
                <asp:BoundField DataField="Dni" HeaderText="DNI" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    
    </div>

       <input id="Button1" onclick="CerrarSinEvento();" type="button" value="Cancelar" />  
    </form>
</body>
</html>
