<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="ConsultaRecursosDisponibles.aspx.cs" Inherits="GestionMantenimiento_ConsultaRecursosDisponibles" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/GestionMantenimiento/Mensaje.ascx" TagName="ucMensajeOk" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 16px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div class="col_04">
        <asp:Panel ID="pnlListado" runat="server" Width="98%">
            <table border="0" width="100%">
                <tr>
                    <td class="stlTituloPagina">
                        Consulta Disponibilidad de Recursos
                    </td>
                </tr>
                <tr>
                    <td class="Linea">
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table border="0" width="100%" class="stlPanelBusqueda">
                <tr>
                    <td class="stlCabecera" style="height: 15px">
                        Busqueda
                    </td>
                </tr>
                <tr>
                    <td>
                                <table class="stlPanelBusqueda" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td class="style1">
                                Lista&nbsp;de&nbsp;Empleados&nbsp;por&nbsp;Especialidad
                            </td>
                            <td class="style1">
                                :
                            </td>
                            <td class="style1">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" 
                                    CssClass="stlComboBox" Width="300px" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Text="--Todos--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Servicio General" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Electronica" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Electricidad" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Mecanica" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                Lista&nbsp;de&nbsp;Empleados&nbsp;por&nbsp;Disponibilidad
                            </td>
                            <td class="style1">
                                :
                            </td>
                            <td class="style1">
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" 
                                    CssClass="stlComboBox" Width="300px" 
                                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Text="--Todos--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Disponible" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No Disponible" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
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
                            <td align="right">
                                <asp:Button ID="ibBuscar" runat="server" OnClick="ibBuscarEmp_Click" 
                                    Text="Buscar" />
                                &nbsp;
                            </td>
                        </tr>
            </table>

                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 15px">
                        <asp:Label ID="lbContadorEmp" runat="server">&nbsp;</asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <div class="HeaderGV" style="height: 300px; overflow: auto; width: 99%">
                <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" SkinID="GridZX11"
                    onrowdatabound="gvEmpleados_RowDataBound"
                    Style="font-size: 10px" Width="100%"
                    >
                    <Columns>
                        <asp:BoundField DataField="E_Apellido_Paterno" HeaderText="Apellido Paterno">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="E_Apellido_Materno" HeaderText="Apellido Materno">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="E_Nombre" HeaderText="Nombre">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="E_Telefono" HeaderText="Telefono Celular">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ID_Especialidad" HeaderText="Especialidad">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Estado" HeaderText="Estado">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Seleccionar">
                            <ItemTemplate>
                                <asp:ImageButton ID="ibSeleccionar" imageurl="~/Imagenes/GM_check.png" runat="server" CausesValidation="False"
                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID_Empleado") %>'
                                    OnCommand="Seleccionar" CommandName="Seleccionar" SkinID="Selecccionar" ToolTip="Seleccionar" />
                            </ItemTemplate>
                            <HeaderStyle Height="15px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            &nbsp;
                            <td align="right">
                                &nbsp;
                            </td>
            <%--<table border="0" width="100%">
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
            </table>--%>
            <asp:Button ID="ibAgregar" runat="server" onclick="ibAgregar_Click" Text="Agregar" visible="false"
                              Width="78px" />
        </asp:Panel>
        <asp:Panel ID="pnlActSM" runat="server" Style="width: 700px;padding:20px;" CssClass="cuadrodes">
            <table border="0" width="100%">
                <tr>
                    <td class="stlTituloPagina">
                        Servicios de Mantenimiento Asignado a Empleado 
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
                        N° de Informe
                    </td>
                    <td>
                        :
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtid" runat="server" CssClass="stlCajaTexto" MaxLength="60" Enabled="False" Value="1"/>
                    </td>
                    <td style="width: 20%">
                        N° de OT
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
                        Fecha&nbsp;Informe
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
                <tr>--%>
                </tr>
                <tr>
                    <td style="width: 20%">
                        Descripción de Actividades
                    </td>
                    <td>
                        :
                    </td>
                    <td colspan="4" style="width: 80%">
                        <asp:TextBox ID="txtdetalleserv" runat="server" CssClass="stlCajaTexto" 
                            Width="80%" TextMode="MultiLine"
                            Rows="4" Height="50px" />
                    </td>
                    <tr ID="tr1" runat="server">
                        <td style="width: 20%">
                            Observación
                        </td>
                        <td>
                            :
                        </td>
                        <td colspan="4" style="width: 80%">
                            <asp:TextBox ID="txtobs" runat="server" CssClass="stlCajaTexto" Height="50px" 
                                Rows="4" TextMode="MultiLine" Width="80%" />
                        </td>
                    </tr>
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
                        <asp:Button ID="ibGuardar" runat="server" Text="Cerrar OT" OnClick="ibGuardar_Click" />
                        <asp:Button ID="ibAnular" runat="server" Text="Anular" Visible="false" onclick="ibAnular_Click" />
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

