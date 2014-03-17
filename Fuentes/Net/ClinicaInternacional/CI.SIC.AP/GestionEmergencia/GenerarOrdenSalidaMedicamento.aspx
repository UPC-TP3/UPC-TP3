<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="GenerarOrdenSalidaMedicamento.aspx.cs" Inherits="GestionEmergencia_GenerarOrdenSalidaMedicamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type=radio]').click(function () {
                $('input[type=radio]').removeAttr('checked');
                $(this).attr('checked', 'checked');
            });

            $('#Contenido_btnCrear').click(function (e) {
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
        <asp:UpdatePanel runat="server" ID="updDatos">
            <ContentTemplate>
                <asp:GridView ID="grvLista" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
                    Font-Size="10px" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                    GridLines="Vertical" DataKeyNames="id" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="N° Atención Médica" DataFormatString="{0:000000}">
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="medico" HeaderText="Médico de Turno">
                            <ItemStyle Width="300px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaingreso" HeaderText="Fecha Atención" DataFormatString="{0:dd/MM/yyyy}">
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
                <asp:Button runat="server" ID="btnCrear" 
                    Text="Crear Orden de Salida de Medicamentos" onclick="btnCrear_Click"/>
                <div id="dialog-datos" title="Actualizar Orden de Salida de Medicamentos" style="display: none;">
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
                                Cama
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlCama">
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
                                Local
                            </td>
                            <td>
                                <asp:TextBox runat="server" id="txtLocal"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                N° Orden
                            </td>
                            <td>
                                <asp:TextBox runat="server" id="txtOrden"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Observación
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtObservacion" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="grvMedicamento" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
                                    Font-Size="10px" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                                    GridLines="Vertical" DataKeyNames="id" AutoGenerateColumns="False">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="N° Atención Médica" DataFormatString="{0:000000}">
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="medico" HeaderText="Médico de Turno">
                                            <ItemStyle Width="300px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fechaingreso" HeaderText="Fecha Atención" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        </asp:BoundField>
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
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click"
                        Style="display: none;" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
