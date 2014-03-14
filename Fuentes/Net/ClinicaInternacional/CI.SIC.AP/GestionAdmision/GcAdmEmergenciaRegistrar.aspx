<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" ClientIDMode="Static" CodeFile="GcAdmEmergenciaRegistrar.aspx.cs" Inherits="GestionAdmision_GcAdmEmergenciaRegistrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript" src="../js/jquery-1.7.1.js" ></script>
    <script language="javascript" type="text/javascript" src="GcAdmEmergenciaRegistrar.js" ></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">

<h1>
<asp:Literal ID="ltlTitulo" runat="server">Título</asp:Literal>
</h1>
<div class="cab">
   <h2>Datos Generales</h2>
</div>
 <div class="filtro">
    <div class="columna"> 
        <div>
            <asp:Label ID="lblTipoDocumentoN" runat="server" Text="Tipo de Documento:"></asp:Label>
            <p><asp:DropDownList ID="ddlTipoDocumentoN" runat="server"></asp:DropDownList>
                <asp:CompareValidator ID="cv1" runat="server"  
        ControlToValidate="ddlTipoDocumentoN" ErrorMessage="*"  ValueToCompare="0" 
        Operator="NotEqual"></asp:CompareValidator>
            </p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoP" runat="server" Text="Apellido Paterno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoP"  ValidationGroup="vg1" runat="server" MaxLength="20"></asp:TextBox><asp:RequiredFieldValidator ID="rf1" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtApellidoP"></asp:RequiredFieldValidator></p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoM" runat="server" Text="Apellido Materno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoM"  ValidationGroup="vg1" runat="server" MaxLength="20"></asp:TextBox><asp:RequiredFieldValidator ID="rf7" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtApellidoM"></asp:RequiredFieldValidator></p> 
        </div>
        <div>
            <asp:Label ID="lblNombre" runat="server" Text="Nombres:"></asp:Label>
            <p><asp:TextBox ID="txtNombre" ValidationGroup="vg1" runat="server" MaxLength="20" ></asp:TextBox><asp:RequiredFieldValidator
                    ID="rf2" runat="server" ControlToValidate="txtNombre" ErrorMessage="*"></asp:RequiredFieldValidator></p> 
        </div>
        <div>
            <asp:Label ID="lblDireccionN" runat="server" Text="Dirección del Paciente:"></asp:Label>
            <p><asp:TextBox ID="txtDireccionN" ValidationGroup="vg1" runat="server" MaxLength="200" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rf3" runat="server" ControlToValidate="txtDireccionN" ErrorMessage="*"></asp:RequiredFieldValidator></p>
        </div>
    </div>

    <div class="columna"> 
        <div>
            <asp:Label ID="lblNroDocumento" runat="server" Text="Nro de Documento:"></asp:Label>
            <p><asp:TextBox ID="txtNroDocumento" ValidationGroup="vg1"  MaxLength="12"  runat="server" ></asp:TextBox><asp:RequiredFieldValidator
                    ID="rf4" runat="server" ControlToValidate="txtNroDocumento" ErrorMessage="*"></asp:RequiredFieldValidator></p>
        </div>            
        <div>
            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:"></asp:Label>
            <p><asp:TextBox ID="txtTelefono"  ValidationGroup="vg1" MaxLength="12"  runat="server" ></asp:TextBox><asp:RequiredFieldValidator
                    ID="rf5" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*"></asp:RequiredFieldValidator></p>
        </div>  
        <div>
            <asp:Label ID="lblCelular" runat="server" Text="Celular:"></asp:Label>
            <p><asp:TextBox ID="txtCelular" ValidationGroup="vg1" MaxLength="10"  runat="server" ></asp:TextBox><asp:RequiredFieldValidator
                    ID="rf6" runat="server" ControlToValidate="txtCelular" ErrorMessage="*"></asp:RequiredFieldValidator> </p> 
        </div>
        <div>
            <asp:Label ID="lblSexo" runat="server" Text="Sexo:"></asp:Label>
            <p><asp:DropDownList ID="ddlSexo" runat="server">
            <asp:ListItem Text="-Seleccione-" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
            <asp:ListItem Text="Femenino" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <asp:CompareValidator ID="cv2" runat="server"  
        ControlToValidate="ddlSexo" ErrorMessage="*"  ValueToCompare="-1" 
        Operator="NotEqual"></asp:CompareValidator>
            </p> 
        </div>
        <div>
          <asp:Label ID="lblFechaNac" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
        <p><asp:TextBox ID="txtFechaNac" ValidationGroup="vg1" MaxLength="10"  runat="server" ></asp:TextBox><asp:RequiredFieldValidator
                    ID="rf8" runat="server" ControlToValidate="txtFechaNac" ErrorMessage="*"></asp:RequiredFieldValidator> 
            </p>
        </div>
        </div>
        <asp:Button ID="btnGuardar" BackColor="#1871A8" ForeColor="#FFFFFF" Width="68px" runat="server" Text="Registrar" 
         onclick="btnGuardar_Click"  />
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

