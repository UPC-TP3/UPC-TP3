<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="registrarResultadosEdit.aspx.cs" Inherits="GestionImagenes_registrarResultadosEdit" %>

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
        .caja_texto_enabled
        {}
    
.caja_texto
{
    border: 1px solid #BBBBFF;
    background-color: #EDF1FE;
    font-family: Verdana;
    font-size: 11px;
            width: 346px;
        }

        </style>

    <script language="javascript" type="text/javascript" src="../js/jquery-1.7.1.js" ></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">

<script type="text/javascript">
            $(document).ready(function () {

                $('#<%= btnGrabar.ClientID %>').click(function () {
                    if ($('#<%= txtId_orden_examen.ClientID %>').val() == "") {
                        alert("Ingrese Orden de Examen");
                        $('#<%= txtId_orden_examen.ClientID %>').focus();
                        return false;
                    }
                    if ($('#<%= txtId_historia.ClientID %>').val() == "") {
                        alert("Orden de Examen Inválido");
                        $('#<%= txtId_orden_examen.ClientID %>').focus();
                        return false;
                    }


                    if ($('#<%= txtResultado.ClientID %>').val() == "") {
                        alert("Ingrese Resultados");
                        $('#<%= txtResultado.ClientID %>').focus();
                        return false;
                    }

                    if ($('#<%= txtObservaciones.ClientID %>').val() == "") {
                        alert("Ingrese Observaciones");
                        $('#<%= txtObservaciones.ClientID %>').focus();
                        return false;
                    }
                    //e.preventDefault();
                    return confirm("Seguro de Registrar Resultado?");

                })


            });
    </script>
    <div class="col_04">
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="False" 
                    CssClass="recibo_dig" Font-Italic="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td colspan="4">
                            <div class="divSpanDP">
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Orden de examen</td>
                        <td>
                            <asp:TextBox ID="txtId_orden_examen" runat="server" Width="85px"> 
                                </asp:TextBox>
                        &nbsp;
                            <asp:Button ID="btnConsultar" runat="server" Text="Consultar" 
                                onclick="btnConsultar_Click" />
                        </td>
                        <td>
                            Fecha orden</td>
                        <td>
                            <asp:TextBox ID="txtFecha_examen" runat="server" Width="83px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Estado</td>
                        <td>
                            <asp:TextBox ID="txtEstado_orden_examen" runat="server" Width="95px" 
                                ReadOnly="True" CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Orden atención</td>
                        <td>
                            <asp:TextBox ID="txtId_orden_atencion" runat="server" Width="84px" 
                                ReadOnly="True" CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            Tipo atención</td>
                        <td>
                            <asp:TextBox ID="txtTipo_atencion" runat="server" Width="142px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Historia clínica</td>
                        <td>
                            <asp:TextBox ID="txtId_historia" runat="server" Width="84px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Paciente</td>
                        <td>
                            <asp:TextBox ID="txtPaciente" runat="server" Width="300px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                        <td>
                            Médico</td>
                        <td>
                            <asp:TextBox ID="txtMedico" runat="server" Width="223px" ReadOnly="True" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tipo examen</td>
                        <td>
                            <asp:DropDownList ID="cboTipo_examen" runat="server" Enabled="False" 
                                CssClass="no_edit">
                            </asp:DropDownList>
                        </td>
                        <td>
                            Examen</td>
                        <td>
                            <asp:TextBox ID="txtExamen" runat="server" ReadOnly="True" Width="216px" 
                                CssClass="no_edit"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="box_tit">
                                Resultados</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Fecha</td>
                        <td>
                            <asp:TextBox ID="txtFecha_resultado" runat="server" Width="83px" ReadOnly="True" 
                                CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                        <td>
                            Estado</td>
                        <td>
                            <asp:TextBox ID="txtEstado_resultado" runat="server" Width="83px" ReadOnly="True" 
                                CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Resultado</td>
                        <td colspan="3">
                            <asp:TextBox ID="txtResultado" runat="server" Width="500px" 
                                CssClass="caja_texto_enabled" Rows="3" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Observaciones</td>
                        <td colspan="3">
                            <asp:TextBox ID="txtObservaciones" runat="server" Width="500px" 
                                CssClass="caja_texto_enabled" Rows="3" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Imágen</td>
                        <td colspan="3">
                            <asp:FileUpload ID="fupImagen" runat="server" Width="274px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3" >
 
                            <asp:Image ID="Image1" runat="server" />
  
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                            <asp:Button ID="btnGrabar" runat="server" 
                                Text="Grabar" onclick="btnProgramar_Click" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnAnular" runat="server" Text="Anular" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            onclick="btnCerrar_Click" Text="Cancelar" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:HiddenField ID="hidAccion" runat="server" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <asp:RangeValidator 
                    ID="RangeValidator1" runat="server" ControlToValidate="txtId_orden_examen" 
                    ErrorMessage="Debe ser numérico" Font-Bold="True" ForeColor="Red" 
                    MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>