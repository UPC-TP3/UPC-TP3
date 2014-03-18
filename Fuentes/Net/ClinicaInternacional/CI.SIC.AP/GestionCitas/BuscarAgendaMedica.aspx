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



    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table class="formulario">
                                    <colgroup>
                                        <col style="width: 20%;" />
                                        <col style="width: 5%; text-align: center;" />
                                        <col style="width: 75%;" />
                                    </colgroup>
                                    <tr>
                                        <td>
                                            Fecha
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFecha" runat="server"
                                                Width="93px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                            Especialidad 
                                        </td>
                                        <td class="style1">
                                           :
                                        </td>
                                        <td class="style1">
                                            <asp:DropDownList ID="cboEspecialidad" runat="server">
                                            </asp:DropDownList>
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
        <br />
    
        Seleccione el horario de atención<br />
        <asp:GridView ID="grvAgendaMedica" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" GridLines="None" 
             DataKeyNames="CodigoAgenda" 
            onselectedindexchanged="grvAgendaMedica_SelectedIndexChanged" 
            ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CodigoAgenda" HeaderText="Codigo" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Horario_Turno" HeaderText="Horario" />
                <asp:BoundField DataField="NumeroConsultorio" HeaderText="Nro Consultorio" />
                <asp:BoundField DataField="NombresMedico" HeaderText="Nombre Medico" />
                <asp:BoundField DataField="ApellidosMedico" HeaderText="Apellidos Medico" />
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
        <br />
    



    </div>
     <input id="Button1" onclick="CerrarSinEvento();" type="button" value="Cancelar" />  
    </form>
</body>
</html>
