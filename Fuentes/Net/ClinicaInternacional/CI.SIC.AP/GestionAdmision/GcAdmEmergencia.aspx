<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"  ClientIDMode="Static" CodeFile="GcAdmEmergencia.aspx.cs" Inherits="GestionAdmision_GcAdmEmergencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script language="javascript" type="text/javascript" src="../js/jquery-1.7.1.js" ></script>
    <script language="javascript" type="text/javascript" src="GcAdmEmergencia.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<h1>
<asp:Literal ID="ltlTitulo" runat="server">Título</asp:Literal>
</h1>
<div class="cab">
   <h2>Datos Generales</h2>
</div>
<div class="filtro" style="margin-bottom:0px;">
<div class="block_center">
<p>
    <asp:Label ID="lblTipoDocumento" runat="server" Text="Tipo de Documento:"></asp:Label>&nbsp&nbsp<asp:DropDownList ID="ddlTipoDocumento" ValidationGroup="vg1" runat="server"></asp:DropDownList>
    <asp:CompareValidator ID="cv1" runat="server"  
        ControlToValidate="ddlTipoDocumento" ErrorMessage="*"  ValueToCompare="0" 
        Operator="NotEqual"></asp:CompareValidator>
</p>
<p> 
    <asp:Label ID="lblDocumento" runat="server" Text="Documento de Identidad:"></asp:Label>&nbsp&nbsp<asp:TextBox ID="txtDocumento" MaxLength="10" ValidationGroup="vg1"  runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="*" ControlToValidate="txtDocumento"></asp:RequiredFieldValidator>
    
</p>
<br />
</div>
</div>
<div class="botones">
<br />
            <asp:Button ID="btnVerificar" Width="108px"  
        runat="server"  Text="Verificar Paciente" 
        onclick="btnVerificar_Click"    />
 </div>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

