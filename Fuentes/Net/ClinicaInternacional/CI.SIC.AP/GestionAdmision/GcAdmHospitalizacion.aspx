<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="GcAdmHospitalizacion.aspx.cs" Inherits="GestionAdmision_GcAdmHospitalizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .col_04 span
        {
            padding: 0px 0px 0px 0px;
            text-align: inherit;
        }
        .ValidacionMensaje
        {
            font-size: 11px;
            color: Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
        <h2 class="recibo_dig">
            Admisión de Hospitalización
        </h2>
        <div class="box_tit">
            Registro | Actualización
        </div>
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 75%">
                        <div class="box_tit reg_title" id="divSpanDP" runat="server" style="width: 98%">
                            Datos del Paciente</div>
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                                <td style="width: 30%">
                                    Tipo De documento:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Nro. Documento:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:DropDownList ID="ddlTipoDoc" runat="server" Style="width: 98%">
                                        <asp:ListItem Value="0" Text="DNI"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="CE"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5%">
                                    &nbsp;
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtNroDoc" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    
                                </td>
                                <td style="width: 30%">                                 
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    Nombre:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Apellido Paterno:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Apellido Materno:
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtApPat" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtApMat" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    Sexo:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Teléfono:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    Correo electrónico:
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:DropDownList ID="ddlSexo" runat="server" Style="width: 98%">
                                        <asp:ListItem Value="0" Text="Masculino"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Femenino"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    Fecha Nacimiento:
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    Dirección:
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtFecNac" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtDireccion" runat="server" Style="width: 98%"></asp:TextBox>
                                </td>
                            </tr>
                             
                        </table>
                         <br />
                         <div class="box_tit reg_title" id="div1" runat="server" style="width: 98%">
                            Datos de la Orden</div>
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
