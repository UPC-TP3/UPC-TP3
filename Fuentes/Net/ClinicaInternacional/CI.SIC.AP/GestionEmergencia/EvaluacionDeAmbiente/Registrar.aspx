<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="Registrar.aspx.cs" Inherits="ModuloEmergenciasRegistrarEvaluacionDeInstalacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">
    <asp:HiddenField runat="server" ID="hdnEvaluacion"/>
    <table style="width: 100%">
        <colgroup>
            <col style="width: 30%;"/>
            <col style="width: 10px;"/>
            <col style="width: 70%;"/>
        </colgroup>
        <tr>
            <td>
                Fecha
            </td>
            <td>
                :
            </td>
            <td>
                <%= DateTime.Now.ToShortDateString() %>
            </td>
        </tr>
        <tr>
            <td>
                Nombre del Enfermero Auxiliar
            </td>
            <td>
                :
            </td>
            <td>
                <asp:TextBox ID="txtNombreEnfermeroAuxiliar" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Ambiente a Evaluar
            </td>
            <td>
                :
            </td>
            <td>
                <asp:DropDownList ID="ddlInstalacion" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlInstalacion_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:UpdatePanel ID="updDatos" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grvLista" runat="server" BackColor="White" Width="100%" BorderColor="#999999"
                            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"
                            AutoGenerateColumns="False" DataKeyNames="IdVerificacion,IdEvaluacionDetalle">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:BoundField DataField="Item" HeaderText="Item" />
                                <asp:TemplateField HeaderText="Conforme">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chkConforme" Checked='<%# Eval("Conformidad") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="60px" HorizontalAlign="Center" />
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
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
                Estado de Evaluación
            </td>
            <td>
                :
            </td>
            <td>
                <asp:DropDownList ID="ddlEstado" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Resultado
            </td>
            <td>
                :
            </td>
            <td>
                <asp:DropDownList ID="ddlResultado" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
           <tr>
            <td>
                Observaciones(*)
            </td>
            <td>
                :
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtObservaciones" Rows="4" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                (*) Campo Opcional
            </td>
        </tr>
            <tr>
            <td colspan="3">
                <asp:Button runat="server" ID="btnGuardar" onclick="btnGuardar_Click" 
                    Text="Guardar Información"/>
                <asp:Button runat="server" ID="btnCancelar" onclick="btnCancelar_Click" 
                    Text="Cancelar Evaluación"/>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
