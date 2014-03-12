<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="OrdHospitalizacion.aspx.cs" Inherits="Ordenes_OrdHospitalizacion" %>

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
            Orden de Hospitalización
        </h2>
        <div class="box_tit">
            Datos Paciente
        </div>
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 100%">
                        <table border="0" cellspacing="3" cellpadding="0" class="Tabla_filtro_txt" style="width: 100%">
                            <tr>
                                <td style="width: 20%">
                                    Tipo Doc.:
                                </td>
                                <td style="width: 15%">
                                    <asp:DropDownList ID="ddlTipoDoc" runat="server" Style="width: 99%">
                                        <asp:ListItem Value="1" Text="DNI"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Carnet Extranjería"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%">
                                    Documento:
                                </td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txtNroDoc" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 20%">
                                    Sexo:
                                </td>
                                <td style="width: 15%">
                                    <asp:DropDownList ID="ddlSexo" runat="server" Style="width: 99%">
                                        <asp:ListItem Value="M" Text="Masculino"></asp:ListItem>
                                        <asp:ListItem Value="F" Text="Femenino"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    Nombre:
                                </td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txtNombres" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 20%">
                                    Ap. Paterno:
                                </td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txtPaterno" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 20%">
                                    Ap. Materno:
                                </td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txtMaterno" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="box_tit">
            Datos Orden
        </div>
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 100%">
                        <table border="0" cellspacing="3" cellpadding="0" class="Tabla_filtro_txt" style="width: 100%">
                            <tr>
                                <td style="width: 15%">
                                    Fecha Hospita.:
                                </td>
                                <td style="width: 20%">
                                    <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 10%">
                                    Sede:
                                </td>
                                <td style="width: 20%">
                                    <asp:DropDownList ID="dllSede" runat="server" Style="width: 98%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%">
                                    Días Hospita.:
                                </td>
                                <td style="width: 20%">
                                    <asp:TextBox ID="txtNroDias" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td style="width: 15%">
                                    Motivo:
                                </td>
                                <td style="width: 20%">
                                    <asp:DropDownList ID="ddlMotivo" runat="server" Style="width: 98%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 10%">
                                    Motivo:
                                </td>
                                <td style="width: 55%" colspan="3">
                                    <asp:TextBox ID="Notivo" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 15%">
                                    Médico Tratante:
                                </td>
                                <td style="width: 20%">
                                    <asp:DropDownList ID="ddlMedTratante" runat="server" Style="width: 98%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 10%">
                                    Médico Turno:
                                </td>
                                <td style="width: 20%">
                                    <asp:DropDownList ID="ddlMedTurno" runat="server" Style="width: 98%">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%">
                                </td>
                                <td style="width: 20%">
                                </td>
                            </tr>

                            
                            <tr>
                                <td style="width: 15%">
                                   Fecha Alta:
                                </td>
                                <td style="width: 20%">
                                    <asp:TextBox ID="txtFecAlta" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 10%">
                                    Cod. Consulta:
                                </td>
                                <td style="width: 20%">
                                  <asp:TextBox ID="txtIdConsulta" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 15%">
                                </td>
                                <td style="width: 20%">
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center">
            <asp:Button ID="btnRegistrar" runat="Server" Text="Registrar" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
