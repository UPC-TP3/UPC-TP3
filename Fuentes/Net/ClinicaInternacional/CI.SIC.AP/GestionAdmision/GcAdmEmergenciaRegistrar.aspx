<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" EnableEventValidation="false" ClientIDMode="Static" CodeFile="GcAdmEmergenciaRegistrar.aspx.cs" Inherits="GestionAdmision_GcAdmEmergenciaRegistrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript" src="../js/jquery-1.7.1.js" ></script>
    <script language="javascript" type="text/javascript" src="GcAdmEmergenciaRegistrar.js" ></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
    
<div class="cab">
   <h2>Admisión Emergencia</h2>
</div>
 <div class="filtro">
    <div class="columna"> 
        <div>
            <asp:Label ID="lblTipoDocumentoN" runat="server" Text="Tipo de Documento:"></asp:Label>
            <p><asp:DropDownList ID="ddlTipoDocumentoN" runat="server"></asp:DropDownList></p> 
        </div>
        <div>
            <asp:Label ID="lblNroDocumento" runat="server" Text="Nro de Documento:"></asp:Label>
            <p><asp:TextBox ID="txtNroDocumento"   MaxLength="12"  runat="server" ></asp:TextBox></p>
        </div>    
       <div>
            <asp:Label ID="lblNombre" runat="server" Text="Nombres:"></asp:Label>
            <p><asp:TextBox ID="txtNombre" ValidationGroup="vg1" runat="server" MaxLength="20" ></asp:TextBox>&nbsp&nbsp<asp:RequiredFieldValidator
                    ID="rf2" runat="server" ControlToValidate="txtNombre"   ErrorMessage="*" ></asp:RequiredFieldValidator></p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoP" runat="server" Text="Apellido Paterno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoP"   runat="server" MaxLength="20"></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoM" runat="server" Text="Apellido Materno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoM"  runat="server" MaxLength="20"></asp:TextBox></p> 
        </div>
        <div>
          <asp:Label ID="lblFechaNac" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
        <p><asp:TextBox ID="txtFechaNac"  MaxLength="10"  runat="server" ></asp:TextBox></p>
        </div>
        <div>
            <asp:Label ID="lblDireccionN" runat="server" Text="Dirección del Paciente:"></asp:Label>
            <p><asp:TextBox ID="txtDireccionN"  runat="server" MaxLength="200" TextMode="MultiLine"></asp:TextBox></p>
        </div>
        <div>
        </div>
    </div>

    <div class="columna"> 
        
        <div>
            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:"></asp:Label>
            <p><asp:TextBox ID="txtTelefono"  MaxLength="12"  runat="server" ></asp:TextBox></p>
        </div>  
        <div>
            <asp:Label ID="lblCelular" runat="server" Text="Celular:"></asp:Label>
            <p><asp:TextBox ID="txtCelular"  MaxLength="10"  runat="server" ></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="lblSexo" runat="server" Text="Sexo:"></asp:Label>
            <p><asp:DropDownList ID="ddlSexo" runat="server">
            <asp:ListItem Text="-Seleccione-" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
            <asp:ListItem Text="Femenino" Value="0"></asp:ListItem>
            </asp:DropDownList></p> 
        </div>
        <div>
           <asp:Label ID="lblPais" runat="server" Text="Pais:"></asp:Label>
           <p><asp:DropDownList ID="ddlPais" runat="server"></asp:DropDownList></p> 
        </div>
        <div>
           <asp:Label ID="lblDpto" runat="server" Text="Departamento:"></asp:Label>
           <p><asp:DropDownList ID="ddlDepartamento" runat="server"><asp:ListItem Text="-Seleccione-" Value="0"></asp:ListItem></asp:DropDownList></p> 
        </div>
        <div>
           <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
           <p><asp:DropDownList ID="ddlProvincia" runat="server"><asp:ListItem Text="-Seleccione-" Value="0"></asp:ListItem></asp:DropDownList></p> 
        </div>
        <div>
           <asp:Label ID="lblDistrito" runat="server" Text="Distrito:"></asp:Label>
           <p><asp:DropDownList ID="ddDistrito" runat="server"><asp:ListItem Text="-Seleccione-" Value="0"></asp:ListItem></asp:DropDownList></p> 
        </div>
        <div>
        <asp:Button ID="btnGuardar" BackColor="#1871A8" ForeColor="#FFFFFF" Width="78px" runat="server" Text="Registrar" 
         onclick="btnGuardar_Click"  />        
        </div>
        </div>
        

</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

