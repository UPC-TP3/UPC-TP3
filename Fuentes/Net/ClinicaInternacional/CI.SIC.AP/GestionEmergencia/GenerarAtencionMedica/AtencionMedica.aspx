<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="AtencionMedica.aspx.cs" Inherits="GenerarAtencionMedica_AtencionMedica" %>

<%@ Register Assembly="DatePickerControl" Namespace="DatePickerControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
    <asp:HiddenField ID="hdnAtencion" runat="server" />
    <asp:HiddenField ID="hdnMedico" runat="server" />
    <asp:HiddenField ID="hdnPaciente" runat="server" />

    <table style="width: 100%;">
        <tr>
            <td>
                DNI
            </td>
            <td>
                <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GestionEmergencia/GenerarAtencionMedica/Paciente.aspx">Nuevo Paciente</asp:HyperLink>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Nombre
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Apellido paterno
            </td>
            <td>
                <asp:TextBox ID="txtApePaterno" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Apellido materno
            </td>
            <td>
                <asp:TextBox ID="txtApeMaterno" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Edad
            </td>
            <td>
                <asp:TextBox ID="txtEdad" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Asigne un medico de la lista
            </td>
            <td>
                <asp:DropDownList ID="ddlMedicos" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Cama
            </td>
            <td>
                <asp:DropDownList ID="ddlCama" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Fecha de Ingreso
            </td>
            <td>
                <cc1:DatePicker ID="calFechaIngreso" runat="server" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Descripcion u observaciones
            </td>
            <td>
                <asp:TextBox ID="txtObservaciones" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblMensaje" runat="server" Text=" "></asp:Label>
            </td>
        </tr>
        <td colspan="3">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/GestionEmergencia/GenerarAtencionMedica/Listado.aspx">Inicio</asp:HyperLink>
        </td>
    </table>
    </div>
</asp:Content>
