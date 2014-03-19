<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="FrmAgendaRegistro.aspx.cs" Inherits="GestionCitas_FrmAgendaRegistro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
    <fieldset>
        <legend>Registrar Agenda Medica</legend>
        <asp:HiddenField runat="server" ID="hdnCodigoAgenda" Value="0" />
        <asp:HiddenField runat="server" ID="hdnCodigoMedico" Value="0" />
        <asp:HiddenField ID="hdnIdEspecialidad" runat="server" />
        <table class="formulario">                
                <colgroup>                    
                    <col style="width: 20%;"/>
                    <col style="width: 5%;text-align: center;"/>
                    <col style="width: 75%;"/>
                </colgroup>
                  <tr>
                <td>
                    Nombres
                </td>
                <td>
                    :
                </td>
                <td>
                 <asp:Label runat="server" ID="lblNombres"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Apellidos
                </td>
                <td>
                    :
                </td>
                <td>
                 <asp:Label runat="server" ID="lblApellidos"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Especialidad
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:Label runat="server" ID="lblEspecialidad"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Colegiatura</td>
                <td>
                    :</td>
                <td>
                    <asp:Label runat="server" ID="lblColegiatura"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Celular</td>
                <td>
                    :</td>
                <td>
                    <asp:Label runat="server" ID="lblCelular"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
        <table class="formulario">
            <tr>
                <td>
                    Fecha
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtFecha" runat="server" Type="date"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * Campo obligatorio"
                        ControlToValidate="txtFecha" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>

            <tr>
                <td class="style1">
                    Turno</td>
                <td class="style1">
                    :</td>
                <td class="style1">
                    <asp:DropDownList ID="cboTurnos" runat="server" 
                        onselectedindexchanged="cboTurnos_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            
           
            <tr>
                <td>
                    Número Consultorio
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:DropDownList ID="cboConsultorio" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>

             <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>

            <tr>
                <td>
                    Activo 
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:CheckBox ID="chkEstado" runat="server" Checked="True" />
                </td>
            </tr>

             <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="btnGrabar" runat="server" Text="Grabar Agenda" CssClass="button" 
                        onclick="btnGrabar_Click" />
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnCancelar" runat="server" 
                        Text="Cancelar" CssClass="button" onclick="btnCancelar_Click" 
                        />
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>