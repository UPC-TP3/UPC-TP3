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
                <td class="style1">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
                <td class="style1">
                    <asp:DropDownList ID="cboTurnos" runat="server" 
                        onselectedindexchanged="cboTurnos_SelectedIndexChanged" Visible="False">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Hora de Inicio
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtHoraInicio" runat="server" Type="time" 
                        ontextchanged="txtHoraInicio_TextChanged"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server" ErrorMessage=" * Campo obligatorio"
                        ControlToValidate="txtHoraInicio" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Hora de Fin
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtHoraFin" runat="server" Type="time" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Numero Consultorio
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtConsultorio" runat="server" Enabled="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Estado 
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
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnGrabar" runat="server" Text="Grabar" CssClass="button" 
                        onclick="btnGrabar_Click" /><asp:Button ID="btnCancelar" runat="server" 
                        Text="Cancelar" CssClass="button" onclick="btnCancelar_Click" 
                        />
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>