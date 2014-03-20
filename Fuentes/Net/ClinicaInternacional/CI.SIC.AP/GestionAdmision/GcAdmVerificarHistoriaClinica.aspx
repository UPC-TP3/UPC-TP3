<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" ClientIDMode="Static" CodeFile="GcAdmVerificarHistoriaClinica.aspx.cs" Inherits="GestionAdmision_GcAdmVerificarHistoriaClinica" %>

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
<div class="cab">
   <h2>Historia Clínica</h2>
</div>
<div class="filtro" style="margin-bottom:0px;">
<div class="block_center">
<p>
    <asp:Label ID="lblTipoDocumento" runat="server" Text="Tipo de Documento:"></asp:Label>&nbsp&nbsp<asp:DropDownList ID="ddlTipoDocumento"  runat="server"></asp:DropDownList>
</p>
<p> 
    <asp:Label ID="lblDocumento" runat="server" Text="Documento de Identidad:"></asp:Label>&nbsp&nbsp<asp:TextBox ID="txtDocumento" MaxLength="12"   runat="server"></asp:TextBox>
</p>
<br />
</div>
</div>
<div class="botonCentral">
<br />
            <asp:Button ID="btnVerificar" Width="115px"  
        runat="server"  Text="BUSCAR" />
 </div>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

