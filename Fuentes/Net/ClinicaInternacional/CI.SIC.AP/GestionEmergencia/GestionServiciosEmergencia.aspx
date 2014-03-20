<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="GestionServiciosEmergencia.aspx.cs" Inherits="GestionEmergencia_GestionServiciosEmergencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            width: 105%;
        }
        .style3
        {
        }
        .style4
        {
        }
        .style5
        {
            width: 177px;
        }
        .style7
        {
            width: 60%;
        }
        .style8
        {
            width: 103px;
        }
        .style9
        {
            width: 95px;
        }
        .style10
        {
            width: 78px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">

   <h2>
         SERVICIOS DE EMERGENCIA</h2>
    <div id="dialog-datos" title="Buscar Orden de Salida de Medicamentos" class="col_04">


        <table class="style1">
        <tr>
            <td class="style3">
                Tipo Atención</td>
            <td class="style4" colspan="3">
                <table class="style7">
                    <tr>
                        <td class="style8">
                            <asp:RadioButton ID="rbdni" GroupName="A" Text="DNI" runat="server" />
                        </td>
                        <td class="style9">
                            <asp:RadioButton ID="rbpaciente" GroupName="A" Text="Cod Paciente" runat="server" /></td>
                        <td>
                            <asp:RadioButton ID="rbatencion" GroupName="A" Text="Atención Medica" runat="server" /></td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Codigo</td>
            <td class="style4">
                <asp:TextBox ID="txtcodigo" runat="server" Width="110px"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:Button ID="btnbuscar"  runat="server" Text="Buscar" 
                    onclick="btnbuscar_Click" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                Nro.Atención</td>
            <td>
                <asp:TextBox ID="txtnroatencion" runat="server" Width="107px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Nombre</td>
            <td class="style4">
                <asp:TextBox ID="txtnombre" runat="server" Width="110px" Enabled="False"></asp:TextBox>
            </td>
            <td class="style10">
                Apellidos</td>
            <td class="style5">
                <asp:TextBox ID="txtapellido" runat="server" Width="200px" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                DNI</td>
            <td class="style4">
                <asp:TextBox ID="txtdni" runat="server" Width="110px" Enabled="False"></asp:TextBox>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Examenes</td>
            <td class="style4" colspan="2">
                <asp:DropDownList ID="cboExamen" runat="server" Height="18px" Width="183px">
                </asp:DropDownList>
            </td>
            <td class="style5">
                <asp:Button ID="btnagregar" runat="server" Text="Agregar"  OnClientClick="javascript:return fc_AgregaExamen();"
                    onclick="btnagregar_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" colspan="6">
          <asp:GridView ID="grvExamen" runat="server" BackColor="White" Width="90%" BorderColor="#999999"
                        Font-Size="10px" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                           OnRowDataBound="grvExamen_RowDataBound"
                                OnPageIndexChanging="grvExamen_PageIndexChanging"
                                AllowPaging="True"        
                                  OnRowDeleting="grvExamen_RowDeleting"                                              
                                  OnSorting="grvExamen_Sorting"  PageSize="10" AllowSorting="true"
                        GridLines="Vertical"  AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>                           
          
                            <asp:BoundField DataField="ID_EXAMEN" HeaderText="Codigo">
                                <ItemStyle Width="50px" HorizontalAlign="Center"/>
                            </asp:BoundField>
                        <asp:BoundField DataField="Descripcion" HeaderText="Nombre">
                                <ItemStyle Width="100px" HorizontalAlign="Center"/>
                            </asp:BoundField>
                                     <asp:BoundField DataField="DescripcionGeneral" HeaderText="Descripción">
                                <ItemStyle Width="150px" HorizontalAlign="Center"/>
                            </asp:BoundField>

                                                 <asp:CommandField  ItemStyle-Width="40px" HeaderText="Eliminar"                                                
                                                            DeleteImageUrl="~/css/images/quitar.gif"  
                                                            
                                                             ShowDeleteButton="True"  ShowHeader="True" ButtonType="Image"  
                                                            
                                                             ItemStyle-HorizontalAlign="Center">                                   
                                                             <ItemStyle Width="50px"></ItemStyle>
                            </asp:CommandField>
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
                
                
                </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Medicamento</td>
            <td class="style4" colspan="2">
                <asp:DropDownList ID="cbomedicamento" runat="server" Height="18px" Width="183px">
                </asp:DropDownList>
            </td>
            <td class="style5">
                <asp:Button ID="btnagregar0" runat="server" Text="Agregar" ToolTip="Agregar Medicamento" OnClientClick="javascript:return fc_AgregaMedicamento();"
                    onclick="btnagregar0_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" colspan="6">
                <asp:HiddenField ID="txhIDMedicamento" runat="server" />
                <asp:HiddenField ID="txhIdpaciente" runat="server" />
          <asp:GridView ID="grvMedicamentos" runat="server" BackColor="White" Width="90%" BorderColor="#999999"
                        Font-Size="10px" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                        GridLines="Vertical" 
                               OnRowDataBound="grvMedicamentos_RowDataBound"
                                OnPageIndexChanging="grvMedicamentos_PageIndexChanging" AllowSorting="true"
                                AllowPaging="True"        
                                  OnRowDeleting="grvMedicamentos_RowDeleting"                                              
                                  OnSorting="grvMedicamentos_Sorting"  PageSize="10" AutoGenerateColumns="False" >
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>  
                        
                          <asp:BoundField DataField="ID_MEDICAMENTO" HeaderText="Codigo">
                                <ItemStyle Width="50px" HorizontalAlign="Center"/>
                            </asp:BoundField>
                        <asp:BoundField DataField="GE_NombreMedicamento" HeaderText="Nombre">
                                <ItemStyle Width="100px" HorizontalAlign="Center"/>
                            </asp:BoundField>
                                     <asp:BoundField DataField="Descripcion" HeaderText="Descripción">
                                <ItemStyle Width="150px" HorizontalAlign="Center"/>
                            </asp:BoundField>                         
                            <asp:TemplateField HeaderText="Cantidad" >
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCantidad" MaxLength="4"  Width="30px" Text='<%# Eval("cantidad") %>' runat="server"></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="30px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                                  <asp:CommandField  ItemStyle-Width="40px" HeaderText="Eliminar"                                                
                                                            DeleteImageUrl="~/css/images/quitar.gif"  
                                                            
                                                             ShowDeleteButton="True"  ShowHeader="True" ButtonType="Image"  
                                                            
                                                             ItemStyle-HorizontalAlign="Center">                                   
                                                             <ItemStyle Width="50px"></ItemStyle>
                            </asp:CommandField>
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
                
                
                </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style10">
                <asp:Button ID="btngrabar" runat="server" Text="Guardar" onclick="btngrabar_Click" 
                     />
            </td>
            <td class="style5">
                <asp:Button ID="btnbuscar1" runat="server" Text="Cancelar" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>


    </div>


    <script type="text/javascript">

        function fc_ValidaSoloNumeros(event) {
            if ((event.keyCode < 48) || (event.keyCode > 57))
                return false;
        }
        function fc_ValidaCantidad(obj) {
            var intCantidad = parseFloat(document.getElementById(obj).value);
               if (intCantidad == "" || isNaN(intCantidad)) intCantidad = 0;

            if (intCantidad <= 0) {
                alert('Ingrese una Cantidad valida');
                document.getElementById(obj).focus();
                return false;
            }
        }

        function fc_AgregaExamen() {
            var msjError = "";

            if (document.getElementById("<%=this.cboExamen.ClientID %>").value == "")
                msjError += "- Debe seleccionar el Examen\n";

            if (msjError != "") {
                alert(msjError)
                msjError = "";
                return false;
            }
            return true;


        }

        function fc_AgregaMedicamento() {
            var msjError = "";

            if (document.getElementById("<%=this.cbomedicamento.ClientID %>").value == "")
                msjError += "- Debe seleccionar el medicamento\n";

            if (msjError != "") {
                alert(msjError)
                msjError = "";
                return false;
            }
            return true;


        }

    </script>
</asp:Content>


    
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">

</asp:Content>

