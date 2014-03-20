<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" EnableEventValidation="false" ClientIDMode="Static" AutoEventWireup="true" CodeFile="GcAdmActualizarPaciente.aspx.cs" Inherits="GestionAdmision_GcAdmActualizarPaciente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ext" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
    
<div class="cab">
   <h2>Actualizar Paciente</h2>
</div>
 <div class="filtro">
    <div class="columna"> 
        <div>
            <asp:Label ID="lblTipoDocumentoN" runat="server" Text="Tipo de Documento:"></asp:Label><asp:HiddenField
                ID="hddIDPaciente" runat="server" />
            <p><asp:TextBox ID="txtTipoDocumento" ReadOnly="true"  runat="server" ></asp:TextBox> 
                <asp:HiddenField ID="hddIdTipoDoc" runat="server" /><asp:HiddenField
                ID="hddAccion" runat="server" /></p> 
        </div>
        <div>
            <asp:Label ID="lblNroDocumento" runat="server" Text="Nro de Documento:"></asp:Label>
            <p><asp:TextBox ID="txtNroDocumento"  ReadOnly="true" MaxLength="12"  runat="server" ></asp:TextBox></p>
        </div>    
       <div>
            <asp:Label ID="lblNombre" runat="server" Text="Nombres:"></asp:Label>
            <p><asp:TextBox ID="txtNombre"   runat="server" MaxLength="20" ></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoP" runat="server" Text="Apellido Paterno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoP"   runat="server" MaxLength="30"></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoM" runat="server" Text="Apellido Materno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoM"  runat="server" MaxLength="30"></asp:TextBox></p> 
        </div>
        <div>
          <asp:Label ID="lblFechaNac" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
        <p><asp:TextBox ID="txtFechaNac"  MaxLength="10"  runat="server" ></asp:TextBox>
           <ext:MaskedEditExtender ID="meeFechaNac" runat="server" TargetControlID="txtFechaNac"
                                        Mask="99/99/9999" MessageValidatorTip="true" MaskType="Date"  ErrorTooltipEnabled="True"
                                        CultureName="es-PE" /></p>
        </div>
        <div>
            <asp:Label ID="lblDireccionN" runat="server" Text="Dirección del Paciente:"></asp:Label>
            <p><asp:TextBox ID="txtDireccionN"  runat="server" MaxLength="500" ></asp:TextBox></p>
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Estado Civil:"></asp:Label>
            <p><asp:DropDownList ID="ddlEstadoCivil" runat="server"></asp:DropDownList></p>
        </div>
        <div>
           <asp:Label ID="Label3" runat="server" Text="Correo:"></asp:Label>
           <p><asp:TextBox ID="txtCorreo"  runat="server" MaxLength="100" ></asp:TextBox></p> 
        </div>

    </div>

    <div class="columna"> 
        
        <div>
            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:"></asp:Label>
            <p><asp:TextBox ID="txtTelefono"  MaxLength="10"  runat="server" ></asp:TextBox></p>
        </div>  
        <div>
            <asp:Label ID="lblCelular" runat="server" Text="Celular:"></asp:Label>
            <p><asp:TextBox ID="txtCelular"  MaxLength="12"  runat="server" ></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="lblSexo" runat="server" Text="Sexo:"></asp:Label>
            <p><asp:DropDownList ID="ddlSexo" runat="server"></asp:DropDownList></p> 
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
           <asp:Label ID="Label2" runat="server" Text="Ocupación:"></asp:Label>
           <p><asp:TextBox ID="txtOcupacion"  runat="server" MaxLength="150" ></asp:TextBox></p> 
        </div>
        <div>
        <br />
        <asp:Button ID="btnGuardar" BackColor="#1871A8" ForeColor="#FFFFFF" Width="108px" runat="server" Text="Registrar" /> <asp:Button ID="btnSalir" BackColor="#1871A8" ForeColor="#FFFFFF" Width="108px" runat="server" Text="SALIR" />               
        </div>
        </div>
        

</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

