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

<%--     <script type="text/javascript">
         $(document).ready(function () {

             $('#btnConsultar').click(function () {
                 return confirm("Seguro de Anular Contrato");
             })
         });
    </script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
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
                                CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Estado</td>
                        <td>
                            <asp:TextBox ID="txtEstado_orden_examen" runat="server" Width="95px" 
                                ReadOnly="True" CssClass="caja_texto_enabled"></asp:TextBox>
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
                                ReadOnly="True" CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                        <td>
                            Tipo atención</td>
                        <td>
                            <asp:TextBox ID="txtTipo_atencion" runat="server" Width="142px" ReadOnly="True" 
                                CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Historia clínica</td>
                        <td>
                            <asp:TextBox ID="txtId_historia" runat="server" Width="84px" ReadOnly="True" 
                                CssClass="caja_texto_enabled"></asp:TextBox>
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
                                CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                        <td>
                            Médico</td>
                        <td>
                            <asp:TextBox ID="txtMedico" runat="server" Width="223px" ReadOnly="True" 
                                CssClass="caja_texto_enabled"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tipo examen</td>
                        <td>
                            <asp:DropDownList ID="cboTipo_examen" runat="server" Enabled="False" 
                                CssClass="caja_texto_enabled">
                            </asp:DropDownList>
                        </td>
                        <td>
                            Examen</td>
                        <td>
                            <asp:TextBox ID="txtExamen" runat="server" ReadOnly="True" Width="216px" 
                                CssClass="caja_texto_enabled"></asp:TextBox>
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
                        <td colspan="3">
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
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>