<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="GcAdmOrdenProcedimiento.aspx.cs" Inherits="GcAdmOrdenProcedimiento" %>

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
        Registrar Orden de Procedimiento
          </h2>
       <%-- <div class="box_tit">
            Registro | Actualización
        </div>--%>
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 75%">
                        <div class="box_tit reg_title" id="divSpanBP" runat="server" style="width: 98%">
                            Buscar Paciente</div>
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
                                   <asp:DropDownList ID="ddlTipoDocumento" DataValueField="Codigo" DataTextField="Descripcion" runat="server"></asp:DropDownList>
                                </td>
                                <td style="width: 5%">
                                    &nbsp;
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtNroDocBus" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    
                                </td>
                                <td style="width: 30%">                                 
                             <asp:Button CssClass="botonesIndividual" ToolTip="Buscar Paciente" ID="Buscar"  Width="100px" runat="server" Text="Buscar" OnClick="btnGetOrden_Click" />                                                      
                                                                       
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
                                    <asp:TextBox ID="txtNombreBus" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtApPatBus"  runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtApMatBus" runat="server"></asp:TextBox>
                                </td>
                            </tr>                          
                             
                        </table>
                         <br />
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
                             
                        </table>
                                                        
                         <br />
                         <div class="box_tit reg_title" id="div1" runat="server" style="width: 98%">
                            Orden de Procedimiento</div>
                         <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                                <td style="width: 30%"><div class="block_center">
                                    Código Orden:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%"><div class="block_center">
                                    Fecha:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                   <asp:TextBox ID="txtOrdenProc" Enabled="false"  runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    &nbsp;
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtFechaOrdenProc" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    
                                </td>
                                <td style="width: 30%">                                 
                                </td>
                            </tr>
                            

                             <tr>
                                <td style="width: 30%"><div class="block_center">
                                    Especialidad:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%"><div class="block_center">
                                    Médico:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                   <asp:DropDownList ID="ddlEspecialidad" AutoPostBack="true" runat="server" DataTextField="descripcion" DataValueField="ID_Especialidad" 
                                        onselectedindexchanged="ddlEspecialidad_SelectedIndexChanged"></asp:DropDownList>
                                </td>
                                <td style="width: 5%">
                                    &nbsp;
                                </td>
                                <td style="width: 30%">
                                    <asp:DropDownList ID="ddlMedico" DataTextField="nom_medico" DataValueField="ID_Medico" runat="server"></asp:DropDownList>
                                </td>
                                <td style="width: 5%">
                                    
                                </td>
                                <td style="width: 30%">                                 
                                </td>
                            </tr>



                            <tr>
                                <td style="width: 30%">
                                    <div class="block_center">Descripción:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <div class="block_center"></div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <div class="block_center"></div> 
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:TextBox ID="txtDescripcion" Width="450px" Height="40px" 
                                        TextMode="MultiLine" runat="server"></asp:TextBox>
                                </td>
                            </tr>    
                            
                            </table>

                            <table border="0" cellpadding="0" cellspacing="0" width="400px">
                            <tr>
                             <td align="right">
                             <div class="botones">
                                <br />                     
                              <asp:Button ID="btnComprobantePago" Width="220px" runat="server" 
                                     Text="Registrar Orden Procedimiento" onclick="btnComprobantePago_Click" />                             
                             </div> 
                             </td>
                             
                            </tr>                     
                             
                        
                            </table>


                        <asp:HiddenField ID="hdfPacienteId" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
