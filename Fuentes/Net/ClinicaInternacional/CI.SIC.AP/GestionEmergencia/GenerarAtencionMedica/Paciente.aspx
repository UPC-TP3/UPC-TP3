<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="Paciente.aspx.cs" Inherits="GenerarAtencionMedica_Paciente" %>
        <%@ Register assembly="DatePickerControl" 
namespace="DatePickerControl" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
    <table style="width: 100%;">
        <tr>
            <td>
                DNI
            </td>
            <td>
                <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="txtApePaterno" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="txtApeMaterno" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Fecha de Nacimiento
            </td>
            <td>
                <%--<asp:Calendar ID="calFechaNacimiento" runat="server"></asp:Calendar>--%>
                <cc1:DatePicker ID="calFechaNacimiento" runat="server" />
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
             <td colspan="3">
                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GestionEmergencia/GenerarAtencionMedica/Listado.aspx">Inicio</asp:HyperLink>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
