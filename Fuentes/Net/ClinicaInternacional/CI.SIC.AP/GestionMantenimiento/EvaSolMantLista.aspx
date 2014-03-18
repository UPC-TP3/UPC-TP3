<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="EvaSolMantLista.aspx.cs" Inherits="GestionMantenimiento_EvaSolMantLista" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<div class="col_04">
    <asp:Panel ID="pnlListado" runat="server" Width="98%">
            <table border="0" width="100%">
                <tr>
	                <td class="stlTituloPagina">
	                    Lista de Evaluar Solicitud de Mantenimiento</td>
                </tr>
                <tr>
	                <td class="Linea"></td>
                </tr>
            </table>
            <br/>
            <table class="stlPanelBusqueda" cellspacing="0" border="0" width="100%">
                <tr>
                    <td>
                        Número de Solicitud</td>
                    <td>
                        :</td>
                    <td>
                        <asp:TextBox ID="txtNroSolicitud" runat="server" CssClass="stlCajaTexto" 
                            ontextchanged="txtNroSolicitud_TextChanged"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddltiposervicio" runat="server" AutoPostBack="True" 
                            CssClass="stlComboBox" 
                            Enabled="False" Visible="False" >
                        <asp:ListItem Text="--Seleccionar--" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Equipo Mecanico" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Infraestructura" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                     <td>Fecha Inicio</td>
                     <td>:</td>
                     <td>
                         <asp:TextBox ID="txtfechaini" runat="server" CssClass="stlCajaTexto"></asp:TextBox>
                         <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/App_Themes/EstilosHO/calendar.gif" Width="16px" />
                         <ajaxtoolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtfechaini"
                                PopupButtonID="btnFecInicial" Enabled="True" Format="dd/MM/yyyy" >
                            </ajaxtoolkit:CalendarExtender>
                            <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" MaskType="Number"
                                Mask="99/99/9999" TargetControlID="txtfechaini" >
                            </ajaxtoolkit:MaskedEditExtender>
                     </td>
                     <td>Fecha Fin</td>
                     <td>:</td>
                     <td>
                         <asp:TextBox ID="txtfechafin" runat="server" CssClass="stlCajaTexto"></asp:TextBox>
                         <asp:ImageButton ID="ImageButton1" runat="server" 
                             ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                         <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfechafin"
                                PopupButtonID="btnFecInicial" Enabled="True" Format="dd/MM/yyyy" >
                            </ajaxtoolkit:CalendarExtender>
                            <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Number"
                                Mask="99/99/9999" TargetControlID="txtfechafin" >
                            </ajaxtoolkit:MaskedEditExtender>
                      </td>
                      <td align="right">
                        <asp:Button ID="btnBuscarPresupuesto" runat="server" OnClick="ibBuscar_Click" 
                            Text="Consultar" />
                      </td>
                 </tr>
            </table>
            <br />
            <table border="0" width="100%" class="stlPanelBusqueda" >
                <tr>
                    <td class="stlCabecera" style="height: 15px">
                    Resultados de la Busqueda</td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 16px">
                        <asp:Label ID="lbContador" runat="server"></asp:Label>                    
                    </td>
                </tr>
             </table><br/>
             <div class="HeaderGV" style="HEIGHT: 300px ; overflow:auto; width : 99%  ">
                <asp:GridView ID="gvEvaluarSolicitudes" runat="server" AutoGenerateColumns="False" 
                     SkinID="GridZX11" style=" font-size:10px" Width="100%" >
                    <Columns>
                        <asp:TemplateField HeaderText="Aceptar/Anular">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                            <HeaderStyle HorizontalAlign="Center" Width="80px" />
                            <ItemTemplate>
                                <asp:ImageButton ID="ibModificar" runat="server" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Nrosolicitud") %>' OnCommand="Modificar" CommandName="Modificar" SkinID="Modificar" ToolTip="Modificar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nrosolicitud" HeaderText="N° Solicitud" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fechacreacion" HeaderText="Fec.Creación" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaIncidencia" HeaderText="Fecha de Incidencia" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>                            
                        <asp:BoundField DataField="Tiposerviciodesc" HeaderText="Tipo Servicio" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tipomantenimiento" HeaderText="Tipo Mantenimiento" 
                            Visible="False" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Observaciones" HeaderText="Observación" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" Visible="False" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Estadodesc" HeaderText="Estado" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <br />
            <table border="0" width="100%">
                <tr>
	                <td class="Linea"> </td>
                </tr>
                <tr>
	                <td align="right">
                        <asp:Button ID="ibSalir" runat="server" Text="Salir" />                       
	                </td>
                </tr>
            </table>
        </asp:Panel>
</div>
</asp:Content>
