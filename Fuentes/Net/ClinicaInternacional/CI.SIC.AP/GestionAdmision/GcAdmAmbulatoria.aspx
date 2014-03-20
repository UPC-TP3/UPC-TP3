<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="GcAdmAmbulatoria.aspx.cs" Inherits="GcAdmAmbulatoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .col_04 span
        {
            padding: 0px 0px 0px 0px;
            text-align: inherit;
        }
        .ValidacionMensaje
        {
            font-size: 11px;
            color: Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
        <h2 class="recibo_dig">
            Atención Ambulatoria</h2>
        <div class="box_tit">
            Registro | Actualización
        </div>
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 75%">
                        <div class="box_tit reg_title" id="divSpanDP" runat="server" style="width: 98%">
                            Datos del Paciente</div>
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                                <td style="width: 30%"><div class="block_center">
                                    Tipo De documento:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%"><div class="block_center">
                                    Nro. Documento:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                   <asp:TextBox ID="txtTipoDocumento" Enabled="false"  runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    &nbsp;
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtNroDoc" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    
                                </td>
                                <td style="width: 30%">                                 
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <div class="block_center">Nombre:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <div class="block_center">Apellido Paterno:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <div class="block_center">Apellido Materno:</div> 
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtNombre" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtApPat" Enabled="false"  runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtApMat" Enabled="false"  runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <div class="block_center">Sexo:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <div class="block_center">Teléfono:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <div class="block_center">Correo electrónico:</div> 
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtSexo" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtTelefono" Enabled="false"  runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtCorreo" Enabled="false"  runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <div class="block_center">Fecha Nacimiento:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    <div class="block_center">Dirección:</div> 
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtFecNac" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtDireccion" Enabled="false" runat="server" Style="width: 98%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <div class="block_center">Fecha Cita:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    <div class="block_center">Hora Cita:</div> 
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtFechaCita" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtHoraCita" Enabled="false" runat="server" Style="width: 98%"></asp:TextBox>
                                </td>
                            </tr>
                             
                        </table>
                         <br />
                         <div class="box_tit reg_title" id="div1" runat="server" style="width: 98%">
                            Monto a Pagar y Co-pago</div>
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                                <td style="width: 30%">
                                    <div class="block_center">Aseguradora:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    <div class="block_center">Co-pago:</div> 
                                </td>
                            </tr>
                            <tr>
                            <td style="width: 30%">
                                    <asp:TextBox ID="txtAseguradora" runat="server" Enabled="False">Rimac</asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtCobertura" runat="server" Style="width: 98%" 
                                        Enabled="False">Asegurado 90%</asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">
                                   <div class="block_center"> Monto a Pagar:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                   
                                </td>
                            </tr>
                            <tr>
                            <td style="width: 30%">
                                    <asp:TextBox ID="txtMontoPagar" runat="server" Enabled="False">32.5</asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                   
                                </td>
                            </tr>
                            <tr>
                             <td align="right" colspan="5">
                             <div class="botones">
                                <br />                     
                              <asp:Button ID="btnComprobantePago" Width="120px" runat="server" 
                                     Text="Grabar" onclick="btnComprobantePago_Click" />                             
                             </div> 
                             </td>
                             
                            </tr>

                        </table>
                                                        
                             
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
