<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="GcAdmRegistrarHistoriaClinica.aspx.cs" Inherits="GestionAdmision_GcAdmRegistrarHistoriaClinica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script language="javascript" type="text/javascript" src="../js/jquery-1.7.1.js" ></script>
    <script language="javascript" type="text/javascript" src="GcAdmRegistrarHistoriaClinica.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
  
<div class="cab">
   <h2>Admisión Emergencia</h2>
</div>
 <div class="filtro">
    <div class="columna"> 
        <div>
         <asp:Label ID="lblNroHistoria" runat="server" Text="Nro de Historia Clínica:"></asp:Label><asp:HiddenField
             ID="hddIDPaciente" runat="server" />
         <p><asp:TextBox ID="txtNroHistoria"  runat="server" MaxLength="20"></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="lblTipoDocumentoN" runat="server" Text="Tipo de Documento:"></asp:Label>
            <p><asp:DropDownList ID="ddlTipoDocumentoN" Enabled="false" runat="server"></asp:DropDownList></p> 
        </div>
       <div>
            <asp:Label ID="lblNombre" runat="server" Text="Nombres:"></asp:Label>
            <p><asp:TextBox ID="txtNombre"  ReadOnly="true" runat="server" MaxLength="20" ></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoP" runat="server" Text="Apellido Paterno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoP"  ReadOnly="true" runat="server" MaxLength="20"></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="lblApellidoM" runat="server" Text="Apellido Materno:"></asp:Label>
            <p><asp:TextBox ID="txtApellidoM" ReadOnly="true"  runat="server" MaxLength="20"></asp:TextBox></p> 
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Alergias:"></asp:Label>
            <p><asp:DropDownList ID="ddlAlergias" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlAlergias_SelectedIndexChanged">
            <asp:ListItem Text="NO" Value="0"></asp:ListItem>
            <asp:ListItem Text="SI" Value="1"></asp:ListItem>
            </asp:DropDownList></p>
            <asp:TextBox ID="txtAlergias" ReadOnly="true"  runat="server" MaxLength="20"></asp:TextBox> 
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Tipo Admisión:"></asp:Label>
            <p><asp:DropDownList ID="ddlTipoAdmin" runat="server">
            </asp:DropDownList></p> 
        </div>
        <div>
        <p></p>
        </div>
    </div>

    <div class="columna"> 
        <div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br /><br /><br /><br />
        </div>
        <div>
            <asp:Label ID="lblNroDocumento" runat="server" Text="Nro de Documento:"></asp:Label>
            <p><asp:TextBox ID="txtNroDocumento" ReadOnly="true"   MaxLength="12"  runat="server" ></asp:TextBox></p>
        </div> 
                <div>
          <asp:Label ID="lblFechaNac" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
        <p><asp:TextBox ID="txtFechaNac" ReadOnly="true"  MaxLength="10"  runat="server" ></asp:TextBox></p>
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
            <asp:Label ID="lblDireccionN" runat="server" Text="Dirección del Paciente:"></asp:Label>
            <p><asp:TextBox ID="txtDireccionN" ReadOnly="true"  runat="server" MaxLength="200" TextMode="SingleLine"></asp:TextBox></p>
        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Intervención Quirúrgica:"></asp:Label>
            <p><asp:DropDownList ID="ddlInterv" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlInterv_SelectedIndexChanged">
            <asp:ListItem Text="NO" Value="0"></asp:ListItem>
            <asp:ListItem Text="SI" Value="1"></asp:ListItem>
            </asp:DropDownList></p> 
            <asp:TextBox ID="txtInterv"   ReadOnly="true"  runat="server" MaxLength="20"></asp:TextBox> 
        </div>
        <div>
            <asp:Label ID="Label5" runat="server" Text="Grupo Sanguineo:"></asp:Label>
            <p><asp:DropDownList ID="ddlGrupo" runat="server">
            <asp:ListItem Text="-Seleccione-" Value="-1"></asp:ListItem>
            <asp:ListItem Text="RH O+" Value="1"></asp:ListItem>
            <asp:ListItem Text="RH O-" Value="2"></asp:ListItem>
            <asp:ListItem Text="RH A+" Value="3"></asp:ListItem>
            <asp:ListItem Text="RH A-" Value="4"></asp:ListItem>
            </asp:DropDownList></p> 
        </div>
        <div>
        <p><asp:Button ID="Button1" runat="server" Text="Registrar" 
                onclick="Button1_Click" /></p>
        </div>

        </div>
</div>
<div id="divCargas" class="tabla">
   <asp:GridView ID="gvDetHistoriaCli" runat="server" ShowHeaderWhenEmpty="true" ClientIDMode="Static"
            AutoGenerateColumns="false" Width="100%"   >
        <EmptyDataTemplate>No se Encontraron Registros</EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="" ItemStyle-Width="20px" ItemStyle-CssClass="TextCenter">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Procedencia" DataField="Procedencia" ItemStyle-Width="10px" />
                <asp:BoundField HeaderText="Diagnostico" DataField="Diagnostico" ItemStyle-Width="30px" />
                <asp:BoundField HeaderText="Tratamiento" DataField="Tratamiento" ItemStyle-Width="30px" ItemStyle-CssClass="TextCenter" />
                <asp:BoundField HeaderText="Fecha" DataField="FechaAtencion"  DataFormatString="{0:dd-MM-yyyy}"  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" ItemStyle-CssClass="TextCenter" />
            </Columns>
            <RowStyle CssClass="row" />
    </asp:GridView>
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

