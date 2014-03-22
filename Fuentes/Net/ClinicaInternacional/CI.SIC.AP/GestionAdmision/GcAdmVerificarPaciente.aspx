<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" ClientIDMode="Static" AutoEventWireup="true" CodeFile="GcAdmVerificarPaciente.aspx.cs" Inherits="GestionAdmision_GcAdmVerificarPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
.botonCentral 
{
    position:relative;
    overflow:hidden;
    background:#fff url(../css/images/bg_formulario.png) bottom left repeat-x;
    border-bottom:1px solid #BDBCBD;
    border-left:1px solid #BDBCBD;
    border-right:1px solid #BDBCBD;
    vertical-align:bottom; float: none;
    padding: 0px 0px 10px 320px;
    outline:0;
}  
.botonCentral input[type='submit']{ width:85px;   color: #FFFFFF;   border: 1px solid #CED5D7; font-size:1.1em;    box-shadow:0 0 0 3px #EEF5F7;    padding: 3px 6px;    
                                   border-radius: 10px; height:28px;    font-weight: bold;    text-shadow: 1px 1px 0px white;     background: #1871A8;    
                                   background: -moz-linear-gradient(top, #e4f1f6 0%, #cfe6ef 100%);    
                                   background: -webkit-linear-gradient(top, #e4f1f6 0%,#cfe6ef 100%);}

.botonCentral input[type='submit']:hover{    background: #D7EDF5;  color: #003C69;   background: -moz-linear-gradient(top, #edfcff 0%, #cfe6ef 100%);    
                                         background: -webkit-linear-gradient(top, #edfcff 0%,#cfe6ef 100%);}
                                         
.botonCentral input[type='submit']:active{    background: #D7EDF5; color: #003C69;    background: -moz-linear-gradient(top, #cfe6ef 0%, #edfcff 100%);    
                                          background: -webkit-linear-gradient(top, #cfe6ef 0%,#edfcff 100%);}

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
     <div class="col_04">      
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 75%">
                        <div class="box_tit reg_title" id="div1" runat="server" style="width: 98%">
                            Datos del Paciente</div>
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                                <td style="width: 30%">
                                <div class="block_center">
                                    Tipo De documento:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                <div class="block_center">
                                    Nro. Documento:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                </td>
                            </tr>
                            <tr>                               
                                
                                <td style="width: 30%">
                                    <asp:DropDownList ID="ddlTipoDocumento"  runat="server"></asp:DropDownList>
                                </td>
                                <td style="width: 5%">
                                    &nbsp;
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtDocumento" MaxLength="12"   runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    
                                </td>
                                <td style="width: 30%">                                 
                                </td>
                            </tr>                                                       
                        </table>
                         <br />                        
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                             <td align="right" >        
                             <div class="botones">
                                <br />                     
                                    <asp:Button ID="btnVerificar" Width="78px" runat="server"  Text="BUSCAR"  />           
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
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

