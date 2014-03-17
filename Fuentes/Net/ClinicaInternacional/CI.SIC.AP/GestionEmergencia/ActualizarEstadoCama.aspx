<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="ActualizarEstadoCama.aspx.cs" Inherits="EmergenciasActualizarEstadoCama" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.setComment').click(function () {
                var destino = $(this).parent().find('textarea');
                $('#input-observacion').val($(this).parent().find('textarea').val());
                $('#dialog-comment').dialog({
                    resizable: false,
                    height: 'auto',
                    width: '400px',
                    modal: true,
                    buttons: {
                        'Aceptar': function () {
                            destino.val($('#input-observacion').val());
                            $('#dialog-comment').dialog('close');
                        },
                        'Cancelar': function () {
                            $('#dialog-comment').dialog('close');
                        }
                    }
                });
            });

            $('.getHistory').click(function () {
                $(this).parent().find('.dialog-history').dialog({
                    resizable: false,
                    height: 'auto',
                    width: '600px',
                    modal: true,
                    buttons: {
                        'Aceptar': function () {
                            $('.dialog-history').dialog('close');
                        }
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
        Bienvenido : (Enfermero)
        <%= Session["Enfermero"] %>
        <asp:UpdatePanel runat="server" ID="updDatos">
            <ContentTemplate>
                <asp:GridView ID="grvLista" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
                    Font-Size="10px" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                    GridLines="Vertical" DataKeyNames="ID_Cama" AutoGenerateColumns="False" OnRowDataBound="grvLista_RowDataBound">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="FechaActualizacion" HeaderText="F. Actualización">
                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GA_NroCama" HeaderText="# Cama">
                            <ItemStyle HorizontalAlign="Center" Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GA_Ubicacion" HeaderText="Ubicación">
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Tipo">
                            <ItemTemplate>
                                <asp:DropDownList runat="server" ID="ddlTipoCama" Width="100%" />
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:DropDownList runat="server" ID="ddlEstado_" Style="display: none;" />
                                <asp:DropDownList runat="server" ID="ddlEstado" Width="100%" />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="EnfermeroActualizador" HeaderText="Actualizador">
                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <div>
                                                <img src="../Imagenes/edit.png" alt="Ingresar Observación" class="setComment" title="Editar Observación" />
                                                <asp:TextBox runat="server" ID="txtObservacion" TextMode="MultiLine" Style="display: none;"
                                                    Text='<%# Eval("Observacion") %>'></asp:TextBox>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <img src="../Imagenes/ver.png" alt="Ver Historial" class="getHistory" title="Ver Historial" />
                                                <div class="dialog-history" style="display: none;" title="Historial">
                                                    <asp:GridView ID="grvHistoria" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
                                                        Font-Size="10px" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                                                        GridLines="Vertical" DataKeyNames="ID_Cama" AutoGenerateColumns="False">
                                                        <AlternatingRowStyle BackColor="#CCCCCC" />
                                                        <Columns>
                                                            <asp:BoundField DataField="FechaActualizacion" HeaderText="F. Actualización">
                                                                <ItemStyle HorizontalAlign="Center" Width="160px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="EnfermeroActualizador" HeaderText="Actualizador">
                                                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Observacion" HeaderText="Observación">
                                                                <ItemStyle HorizontalAlign="Justify" Width="200px" />
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
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
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
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
    </div>
    <div id="dialog-comment" title="Observación" style="display: none;">
        <textarea id="input-observacion" rows="4" cols="1" style="width: 100%;"></textarea>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
