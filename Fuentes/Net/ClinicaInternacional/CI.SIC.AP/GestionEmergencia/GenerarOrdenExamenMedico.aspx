<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="GenerarOrdenExamenMedico.aspx.cs" Inherits="GestionEmergenciaGenerarOrdenExamenMedico" %>
<%@ Import Namespace="CI.SIC.CC" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">

        var myVar = setInterval(function () { myTimer(); }, 1000);
        function myTimer() {            
            document.getElementById("demo").innerHTML = document.getElementById("demo").innerHTML - 1;
            if (document.getElementById("demo").innerHTML == 0) {
                document.getElementById('Contenido_btnListar').click();
                document.getElementById("demo").innerHTML = '<%= Configuraciones.TiempoRecarga %>';
            }
        }

        $(document).ready(function () {
            $('input[type=radio]').click(function () {
                $('input[type=radio]').removeAttr('checked');
                $(this).attr('checked', 'checked');
            });

            $('#Contenido_btnAsignar').click(function (e) {
                if ($('input[type=radio]:checked').length == 0) {
                    e.preventDefault();
                    alert('Seleccione algún registro');
                }
            });
        });

        function mostrarDatos() {
            $('input[type=radio]').click(function () {
                $('input[type=radio]').removeAttr('checked');
                $(this).attr('checked', 'checked');
            });

            $('#Contenido_txtFecha').datepicker('destroy');
            $('#Contenido_txtFecha').datepicker({
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
                dateFormat: 'dd/mm/yy'
            });

            $('#dialog-datos').dialog({
                resizable: false,
                height: 'auto',
                width: '400px',
                modal: true,
                buttons: {
                    'Aceptar': function () {
                        document.getElementById('Contenido_btnAceptar').click();
                        $(this).dialog('close');
                    },
                    'Cancelar': function () {
                        $(this).dialog('close');
                    }
                },
                open: function () {
                    $(this).parent().appendTo("form");
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
        <table>
            <tr>
                <td>
                    Próxima carga en
                </td>
                <td>                    
                    <p id="demo"><%= Configuraciones.TiempoRecarga %></p>
                </td>
                <td>
                    seg.
                </td>
            </tr>
        </table>
        <asp:UpdatePanel runat="server" ID="updDatos">
            <ContentTemplate>
                <asp:GridView ID="grvLista" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
                    Font-Size="10px" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                    GridLines="Vertical" DataKeyNames="IdAtencion,IdExamen,IdPaciente,IdServicio,IdMedico"
                    AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="IdServicio" HeaderText="Orden Médica" DataFormatString="{0:000000}">
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Medico" HeaderText="Médico de Turno">
                            <ItemStyle Width="180px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaIngreso" HeaderText="Fecha Atención" DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:RadioButton runat="server" ID="rbtEstado" />
                            </ItemTemplate>
                            <ItemStyle Width="40px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <div id="dialog-datos" title="Datos Exámen" style="display: none;">
                    <table>
                        <tr>
                            <td>
                                Atención Médica
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblAtencion" Font-Bold="True"></asp:Label>
                                <asp:HiddenField runat="server" ID="hdnAtencion" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Fecha Solicitud
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtFecha"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Paciente
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlPaciente">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Médico a cargo
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlMedico">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tipo Exámen
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlExamen">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Estado
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlEstado">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Detalle
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtDetalle" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click"
                        Style="display: none;" />
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAsignar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnListar" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:Button ID="btnAsignar" runat="server" Text="Asignar" OnClick="btnAsignar_Click" />
        <asp:Button ID="btnListar" runat="server" Text="Listar" Style="display: none;" 
            onclick="btnListar_Click" />
    </div>
</asp:Content>
