<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="MISolicitudMantenimiento.aspx.cs" Inherits="GestionMantenimiento_MISolicitudMantenimiento" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/GestionMantenimiento/Mensaje.ascx" TagName="ucMensajeOk" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div class="col_04">
        <asp:Panel ID="pnlListado" runat="server" Width="98%">
            <table border="0" width="100%">
                <tr>
                    <td class="stlTituloPagina">
                        Lista de Solicitudes
                    </td>
                </tr>
                <tr>
                    <td class="Linea">
                    </td>
                </tr>
            </table>
            <br />
            <table class="stlPanelBusqueda" cellspacing="0" border="0" width="100%">
                <tr>
                    <td>
                        Fecha&nbsp;Inicio
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <asp:TextBox ID="txtfechaini" CssClass="stlCajaTexto" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                        <ajaxtoolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtfechaini"
                            PopupButtonID="btnFecInicial" Enabled="True" Format="ddMMyyyy">
                        </ajaxtoolkit:CalendarExtender>
                        <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" MaskType="Number"
                            Mask="99999999" TargetControlID="txtfechaini">
                        </ajaxtoolkit:MaskedEditExtender>
                    </td>
                    <td>
                        Fecha&nbsp;Fin
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <asp:TextBox ID="txtfechafin" CssClass="stlCajaTexto" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                        <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfechafin"
                            PopupButtonID="btnFecInicial" Enabled="True" Format="ddMMyyyy">
                        </ajaxtoolkit:CalendarExtender>
                        <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Number"
                            Mask="99999999" TargetControlID="txtfechafin">
                        </ajaxtoolkit:MaskedEditExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td align="right">
                        <asp:Button ID="btnBuscarPresupuesto" runat="server" OnClick="ibBuscar_Click" Text="Buscar" />
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <table border="0" width="100%" class="stlPanelBusqueda">
                <tr>
                    <td class="stlCabecera" style="height: 15px">
                        Resultados de la Busqueda
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 16px">
                        <asp:Label ID="lbContador" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <div class="HeaderGV" style="height: 300px; overflow: auto; width: 99%">
                <asp:GridView ID="gvSolicitudes" runat="server" AutoGenerateColumns="False" SkinID="GridZX11"
                    Style="font-size: 10px" Width="100%" 
                    onselectedindexchanged="gvSolicitudes_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="Modificar">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                            <HeaderStyle HorizontalAlign="Center" Width="80px" />
                            <ItemTemplate>
                                <asp:ImageButton ID="ibModificar" runat="server" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Nrosolicitud") %>'
                                    OnCommand="Modificar" CommandName="Modificar" SkinID="Modificar" ToolTip="Modificar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Anular">
                            <ItemTemplate>
                                <asp:ImageButton ID="imbEliminar" runat="server" OnClientClick="return confirm('¿Esta seguro de eliminar este registro?');"
                                    OnCommand="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Nrosolicitud") %>'
                                    SkinID="Eliminar" ToolTip="Eliminar"></asp:ImageButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                            <HeaderStyle HorizontalAlign="Center" Width="80px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nrosolicitud" HeaderText="N° Solicitud">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fechacreacion" HeaderText="Fec.Creación">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NomTiposervicio" HeaderText="Tipo Servicio">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NomEstado" HeaderText="Estado">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <br />
            <table border="0" width="100%">
                <tr>
                    <td class="Linea">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="ibIngresar" runat="server" Text="Nuevo" OnClick="ibIngresar_Click" />
                        
                        <asp:Button ID="ibSalir" runat="server" Text="Salir" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlActSM" runat="server" Style="width: 700px;padding:20px;" CssClass="cuadrodes">
            <table border="0" width="100%">
                <tr>
                    <td class="stlTituloPagina">
                        Solicitud de Mantenimiento
                    </td>
                </tr>
                <tr>
                    <td class="Linea">
                    </td>
                </tr>
            </table>
            <table cellpadding="2" cellspacing="2" border="0" width="100%" class="stlPanelBusqueda">
                <tr>
                    <td style="width: 20%">
                        Id Solicitud
                    </td>
                    <td>
                        :
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtid" runat="server" CssClass="stlCajaTexto" MaxLength="60" Enabled="False" />
                    </td>
                    <td style="width: 20%">
                        Solicitado por
                    </td>
                    <td>
                        :
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtsolicitadopor" runat="server" CssClass="stlCajaTexto" Enabled="false" />
                        <asp:HiddenField ID="hfcodsolicitado" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        Área
                    </td>
                    <td>
                        :
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtarea" runat="server" CssClass="stlCajaTexto" 
                            Enabled="false" />
                    </td>
                    <td style="width: 20%">
                        Fecha&nbsp;Solicitud
                    </td>
                    <td>
                        :
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtfechacreacion" runat="server" CssClass="stlCajaTexto" MaxLength="60"
                            Enabled="False" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%">
                        &nbsp;
                    </td>
                </tr>
                <%--<tr>
                    <td style="width: 20%">Correo</td>
                    <td>:</td>
                    <td style="width: 80%" colspan="4" >
                    <asp:TextBox ID="txtcorreo" runat="server" CssClass="stlCajaTexto" MaxLength="80" Width="80%"/>
                    </td>      
                </tr>--%>
                <tr>
                    <td style="width: 20%">
                        Tipo de Servicio
                    </td>
                    <td>
                        :
                    </td>
                    <td style="width: 80%" colspan="4">
                        <asp:DropDownList ID="ddltiposervicio" runat="server" CssClass="stlComboBox" AutoPostBack="true"
                            OnSelectedIndexChanged="ddltiposervicio_SelectedIndexChanged" Width="80%">
                            <asp:ListItem Text="--Seleccionar--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Equipo Mecanico" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Infraestructura" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        Infraestructura/Equipo&nbsp;Médico
                    </td>
                    <td>
                        :
                    </td>
                    <td colspan="4" style="width: 80%">
                        <asp:DropDownList ID="ddlequipomedico" runat="server" AutoPostBack="false" CssClass="stlComboBox"
                            Width="80%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        Fecha de Incidencia
                    </td>
                    <td>
                        :
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtfechaincidencia" CssClass="stlCajaTexto" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                        <ajaxtoolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtfechaincidencia"
                            PopupButtonID="btnFecInicial" Enabled="True" Format="ddMMyyyy">
                        </ajaxtoolkit:CalendarExtender>
                        <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server" MaskType="Number"
                            Mask="99999999" TargetControlID="txtfechaincidencia">
                        </ajaxtoolkit:MaskedEditExtender>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        Detalle del Servicio
                    </td>
                    <td>
                        :
                    </td>
                    <td style="width: 80%" colspan="4">
                        <asp:TextBox ID="txtdetalleserv" runat="server" CssClass="stlCajaTexto" TextMode="MultiLine"
                            Width="80%" Rows="4" Height="50px" />
                    </td>
                </tr>
                <tr runat="server" id="tr1">
                    <td style="width: 20%">
                        Observación
                    </td>
                    <td>
                        :
                    </td>
                    <td colspan="4" style="width: 80%">
                        <asp:TextBox ID="txtobs" runat="server" CssClass="stlCajaTexto" Width="80%" TextMode="MultiLine"
                            Rows="4" Height="50px" />
                    </td>
                </tr>
            </table>
            <br />
            <table border="0" width="100%">
                <tr>
                    <td class="Linea">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="ibGuardar" runat="server" Text="Guardar" OnClick="ibGuardar_Click" />
                        <asp:Button ID="ibAnular" runat="server" Text="Anular" Visible="false" 
                            onclick="ibAnular_Click" />
                        <asp:Button ID="ibCerrar" runat="server" Text="Cerrar" OnClick="ibCerrar_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Button ID="btnTabla" runat="server" Style="display: none" />
        <ajaxtoolkit:ModalPopupExtender ID="mpeActSM" runat="server" BehaviorID="bmpActSM"
            PopupControlID="pnlActSM" TargetControlID="btnTabla" BackgroundCssClass="modalBackground"
            DropShadow="true" CancelControlID="btnTabla">
        </ajaxtoolkit:ModalPopupExtender>
        <uc1:ucMensajeOk ID="ucMOk" runat="server" /> 
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

