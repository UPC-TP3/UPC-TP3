<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" EnableEventValidation="false" ClientIDMode="Static" CodeFile="GcAdmEmergenciaRegistrar.aspx.cs" Inherits="GestionAdmision_GcAdmEmergenciaRegistrar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ext" %>

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
            <asp:CompareValidator ValueToCompare="-1"  Operator="NotEqual"  ValidationGroup="vgEmergencia" 
                ID="rfvTipoDoc" runat="server" ErrorMessage="Seleccionar un Tipo de documento" 
                Text="*" ControlToValidate="ddlTipoDocumentoN" ></asp:CompareValidator>
        </div>
        <div>
            <asp:Label ID="lblNroDocumento" runat="server" Text="Nro. de Documento:"></asp:Label>
            <p><asp:TextBox ID="txtNroDocumento"   MaxLength="12"  runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="vgEmergencia" ID="rfvNroDoc" runat="server" ErrorMessage="Ingresar una Nro. de documento" Text="*" ControlToValidate="txtNroDocumento"></asp:RequiredFieldValidator>
            
            </p>
        </div>    
       <div>
            <asp:Label ID="lblNombre" runat="server" Text="Nombres:"></asp:Label>
            <p><asp:TextBox ID="txtNombre" ValidationGroup="vg1" runat="server" MaxLength="20" ></asp:TextBox>&nbsp&nbsp
            
             <asp:RequiredFieldValidator ValidationGroup="vgEmergencia" ID="rfvNombre" runat="server" ErrorMessage="Ingresar una Nombre" Text="*" ControlToValidate="txtNombre"></asp:RequiredFieldValidator></p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoP" runat="server" Text="Apellido Paterno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoP"   runat="server" MaxLength="20"></asp:TextBox>
            
            <asp:RequiredFieldValidator ValidationGroup="vgEmergencia" ID="rfvApePat" runat="server" ErrorMessage="Ingresar una Apellido Paterno" Text="*" ControlToValidate="txtApellidoP"></asp:RequiredFieldValidator>
            </p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoM" runat="server" Text="Apellido Materno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoM"  runat="server" MaxLength="20"></asp:TextBox>
            
            <asp:RequiredFieldValidator ValidationGroup="vgEmergencia" ID="rfvApeMat" runat="server" ErrorMessage="Ingresar una Apellido Materno" Text="*" ControlToValidate="txtApellidoM"></asp:RequiredFieldValidator>
            
            </p> 
        </div>
        <div>
          <asp:Label ID="lblFechaNac" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
        <p><asp:TextBox ID="txtFechaNac"  MaxLength="10"  runat="server" ></asp:TextBox>

        <ext:MaskedEditExtender ID="meeFecIngreso" runat="server" TargetControlID="txtFechaNac"
                                        Mask="99/99/9999" MessageValidatorTip="true" MaskType="Date" ErrorTooltipEnabled="True"
                                        CultureName="es-PE" />
                                    <ext:CalendarExtender ID="txtFechaNac_CalendarExtender" runat="server" TargetControlID="txtFechaNac"
                                        Format="dd/MM/yyyy" PopupPosition="BottomLeft" />

        
         <asp:RequiredFieldValidator ValidationGroup="vgEmergencia" ID="rfvFechaNacimiento" runat="server" ErrorMessage="Ingresar una Fecha Nacimiento" Text="*" ControlToValidate="txtFechaNac"></asp:RequiredFieldValidator>
           
        
        </p>
        </div>
        <div>
            <asp:Label ID="lblDireccionN" runat="server" Text="Dirección:"></asp:Label>
            <p><asp:TextBox ID="txtDireccionN"  runat="server" MaxLength="200" TextMode="MultiLine"></asp:TextBox></p>
        </div>
        <div>
            <asp:Label ID="lblObservacion" runat="server" Text="Observación:"></asp:Label>
            <p><asp:TextBox ID="txtObservacion"  runat="server" MaxLength="200" TextMode="MultiLine"></asp:TextBox></p>
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
           <%-- <asp:ListItem Text="-Seleccione-" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
            <asp:ListItem Text="Femenino" Value="0"></asp:ListItem>--%>
            </asp:DropDownList>
            
             <asp:CompareValidator ValidationGroup="vgEmergencia" ValueToCompare="-1"  Operator="NotEqual" ID="rfvSexo" runat="server" ErrorMessage="Seleccionar el sexo" Text="*" ControlToValidate="ddlSexo"></asp:CompareValidator>
         
            
            </p> 
        </div>

       <%-- <div>
            <asp:Label ID="Label1" runat="server" Text="Estado Civil:"></asp:Label>
            <p><asp:DropDownList ID="ddlEstadoCivil" runat="server"></asp:DropDownList>&nbsp&nbsp*</p>
        </div>--%>

        <div>
           <asp:Label ID="lblPais" runat="server" Text="Pais:"></asp:Label>
           <p><asp:DropDownList ID="ddlPais" runat="server" AutoPostBack="true" 
                   onselectedindexchanged="ddlPais_SelectedIndexChanged"></asp:DropDownList>
                   
                   <asp:CompareValidator ValidationGroup="vgEmergencia" ValueToCompare="0"  Operator="NotEqual" ID="cvPais" runat="server" ErrorMessage="Seleccionar el País" Text="*" ControlToValidate="ddlPais"></asp:CompareValidator>
         
                 </p> 
        </div>
        <div>
           <asp:Label ID="lblDpto" runat="server" Text="Departamento:"></asp:Label>
           <p><asp:DropDownList ID="ddlDepartamento" runat="server" AutoPostBack="true"
                   onselectedindexchanged="ddlDepartamento_SelectedIndexChanged"><asp:ListItem Text="-Seleccione-" Value="0"></asp:ListItem></asp:DropDownList>
                   
                   <asp:CompareValidator ValidationGroup="vgEmergencia" ValueToCompare="0"  Operator="NotEqual" ID="cvDepartamento" runat="server" ErrorMessage="Seleccionar el Departamento" Text="*" ControlToValidate="ddlDepartamento"></asp:CompareValidator>
         
                   
                   </p> 
        </div>
        <div>
           <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
           <p><asp:DropDownList ID="ddlProvincia" AutoPostBack="true" runat="server" 
                   onselectedindexchanged="ddlProvincia_SelectedIndexChanged"><asp:ListItem Text="-Seleccione-" Value="0"></asp:ListItem></asp:DropDownList></p> 
        
         <asp:CompareValidator ValidationGroup="vgEmergencia" ValueToCompare="0"  Operator="NotEqual" ID="cvProvincia" runat="server" ErrorMessage="Seleccionar la Provincia" Text="*" ControlToValidate="ddlProvincia"></asp:CompareValidator>
         
        
        </div>
        <div>
           <asp:Label ID="lblDistrito" runat="server" Text="Distrito:"></asp:Label>
           <p><asp:DropDownList ID="ddDistrito" runat="server"><asp:ListItem Text="-Seleccione-" Value="0"></asp:ListItem></asp:DropDownList>
           
            <asp:CompareValidator ValidationGroup="vgEmergencia" ValueToCompare="0"  Operator="NotEqual" ID="cvDistrito" runat="server" ErrorMessage="Seleccionar la Distrito" Text="*" ControlToValidate="ddDistrito"></asp:CompareValidator>
                    
           </p> 
        </div>
        <div>
        <asp:Button ID="btnGuardar" ValidationGroup="vgEmergencia" BackColor="#1871A8" ForeColor="#FFFFFF" Width="78px" runat="server" Text="Registrar" 
         onclick="btnGuardar_Click"  />        
        </div>
        </div>

        <asp:ValidationSummary ID="vsValidarPaciente" ValidationGroup="vgEmergencia" ShowMessageBox="true" ShowSummary="false" runat="server" />
        

</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

