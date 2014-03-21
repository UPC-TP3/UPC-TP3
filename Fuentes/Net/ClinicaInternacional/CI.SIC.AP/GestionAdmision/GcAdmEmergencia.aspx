<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"  ClientIDMode="Static" CodeFile="GcAdmEmergencia.aspx.cs" Inherits="GestionAdmision_GcAdmEmergencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script language="javascript" type="text/javascript" src="../js/jquery-1.7.1.js" ></script>
    <script language="javascript" type="text/javascript" src="GcAdmEmergencia.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">


<div class="col_04">
        <h2 class="recibo_dig">
          Admisión Emergencia
          </h2>
 
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 100%">                   
                               <table border="0" cellpadding="0" cellspacing="0">
                               <tr>
                                 <td>
                                 <div class="box_tit reg_title" id="divSpanDP" runat="server" style="width: 98%">
                            Registrar Paciente</div>
                                 </td>
                               </tr>
                                <tr>
                                 <td>
                                        <table border="0" cellspacing="0" width="300px" cellpadding="0" class="Tabla_filtro_txt">
                                        <tr>
                                        <td style="width:110px" >
                                        <div class="block_center">
                                        Tipo de documento:</div>
                                        </td>                                       
                                        <td>
                                        <div class="block_center">
                                        Nro. Documento:</div>
                                        </td>                                  
                                        </tr>
                                        <tr>
                                        <td >
                                        <asp:DropDownList ID="ddlTipoDocumento" runat="server" ValidationGroup="vg1">
                                        </asp:DropDownList> <asp:CompareValidator ID="cv1" runat="server" ValidationGroup="vgValidacion"  
                                        ControlToValidate="ddlTipoDocumento"  ValueToCompare="0" ErrorMessage="Ingresar Tipo de Documento" Text="*"
                                        Operator="NotEqual"></asp:CompareValidator>
                                        </td>                                        
                                        <td style="width: 30%">
                                        <asp:TextBox ID="txtDocumento" runat="server" MaxLength="10" 
                                        ValidationGroup="vg1"></asp:TextBox><asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Ingresar una Nro.Documento" Text="*" ValidationGroup="vgValidacion" ControlToValidate="txtDocumento"></asp:RequiredFieldValidator>
                                        </td>                                        
                                        </tr>
                                        <tr>
                                        <td align="center" colspan="2"  >
                                     
                                        <div class="botones">
                                        <asp:Button ID="btnVerificar" ValidationGroup="vgValidacion" runat="server" onclick="btnVerificar_Click" 
                                        Text="Verificar Paciente" Width="140px" />
                                        </div>
                                     
                                        </td>
                                    
                                        </tr>
                                        </table>
                                 </td> 
                                 </tr>                                                                                             
                               </table>  
                               
                               <br />
                               
                                <table border="0" cellpadding="0" cellspacing="0">
                               <tr>
                                 <td>
                                 <div class="box_tit reg_title" id="div1" runat="server" style="width: 98%">
                            Registrar Paciente Anónimo</div>
                                 </td>
                               </tr>
                                <tr>
                                 <td>
                                        <table border="0" cellspacing="0" width="300px" cellpadding="0" class="Tabla_filtro_txt">
                                        <tr>
                                        <td >
                                        <div class="block_center">
                                        Observación:</div>
                                        </td>                                       
                                        <td>
                                        <div class="block_center">
                                        </div>
                                        </td>                                  
                                        </tr>
                                        <tr>
                                        <td colspan="2">
                                        <asp:TextBox ID="txtObservacion" Width="400px" Height="60px" runat="server" ></asp:TextBox><asp:RequiredFieldValidator ValidationGroup="vgAnonimo" ID="rfvObs" runat="server" ErrorMessage="Ingresar una observación" Text="*" ControlToValidate="txtDocumento"></asp:RequiredFieldValidator>
                                        </td>                                        
                                                                                
                                        </tr>
                                        <tr>
                                        <td align="center" colspan="2"  >
                                     
                                        <div class="botones">
                                        <asp:Button ID="btnRegistrarPaciente" ValidationGroup="vgAnonimo" runat="server" Text="Registrar Paciente" Width="140px" onclick="btnRegistrarPaciente_Click" />
                                        </div>
                                     
                                        </td>
                                    
                                        </tr>
                                        </table>
                                 </td> 
                                 </tr>                                                                                             
                               </table> 
                </div> 
                </div>
            </div>
 </div>

 <asp:ValidationSummary ID="vsValidarPaciente" ValidationGroup="vgValidacion" ShowMessageBox="true" ShowSummary="false" runat="server" />
 <asp:ValidationSummary ID="vsRegistroAnonimo" ValidationGroup="vgAnonimo" ShowMessageBox="true" ShowSummary="false" runat="server" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

