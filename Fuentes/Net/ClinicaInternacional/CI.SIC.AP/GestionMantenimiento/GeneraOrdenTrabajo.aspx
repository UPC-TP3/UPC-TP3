<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="GeneraOrdenTrabajo.aspx.cs" Inherits="GestionMantenimiento_MISolicitudMantenimiento" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 30%;
            height: 17px;
        }
        .style4
        {
            height: 18px;
        }
        .style5
        {
            width: 30px;
            height: 18px;
        }
        .style6
        {
            width: 20%;
            height: 18px;
        }
        .style7
        {
            height: 18px;
        }
        .style8
        {
            width: 30px;
            height: 17px;
        }
        .style9
        {
            width: 20%;
            height: 17px;
        }
        .style10
        {
            height: 17px;
        }
        .style11
        {
            width: 30%;
            height: 19px;
        }
        .style12
        {
            width: 30px;
            height: 19px;
        }
        .style13
        {
            width: 20%;
            height: 19px;
        }
        .style14
        {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<div class="col_04">
<asp:Panel ID="pnlListado" runat="server" Width="98%">
            <table border="0" width="100%">
                <tr>
	                <td class="stlTituloPagina">
	                    Ordenes de Trabajo</td>
                </tr>
                <tr>
	                <td class="Linea"></td>
                </tr>
            </table>
            <br/>
            <table class="stlPanelBusqueda" cellspacing="0" border="0" width="100%">
                <tr>
                    <td>
                        Fecha&nbsp;Inicio</td>
                    <td>
                        :</td>
                    <td>
                        <asp:TextBox ID="txtfechaini" CssClass="stlCajaTexto" runat="server" ></asp:TextBox>
                          <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                            <ajaxtoolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtfechaini"
                                PopupButtonID="btnFecInicial" Enabled="True" Format="ddMMyyyy" >
                            </ajaxtoolkit:CalendarExtender>
                            <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" MaskType="Number"
                                Mask="99999999" TargetControlID="txtfechaini" >
                            </ajaxtoolkit:MaskedEditExtender>
                    </td>
                    <td>
                        Fecha&nbsp;Fin</td>
                    <td>
                        :</td>
                    <td>
                        <asp:TextBox ID="txtfechafin" CssClass="stlCajaTexto" runat="server" ></asp:TextBox>
                          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                            <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfechafin"
                                PopupButtonID="btnFecInicial" Enabled="True" Format="ddMMyyyy" >
                            </ajaxtoolkit:CalendarExtender>
                            <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Number"
                                Mask="99999999" TargetControlID="txtfechafin" >
                            </ajaxtoolkit:MaskedEditExtender>
                    </td>
                </tr>
                 <tr>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                     <td>&nbsp;</td>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                     <td align="right">
                     <asp:Button ID="btnBuscarPresupuesto" runat="server" OnClick="ibBuscar_Click" 
                            Text="Buscar" />
                         &nbsp;</td>
                        
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
                 <asp:GridView ID="gvOrdenTrabajo" runat="server" AutoGenerateColumns="False" 
                     SkinID="GridZX11" style=" font-size:10px" Width="100%" 
                     onselectedindexchanged="gvOrdenTrabajo_SelectedIndexChanged">
                     <Columns>
                         <asp:TemplateField HeaderText="Modificar">
                             <ItemStyle HorizontalAlign="Center" Width="80px" />
                             <HeaderStyle HorizontalAlign="Center" Width="80px" />
                             <ItemTemplate>
                                <asp:ImageButton ID="ibModificar" runat="server" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "GM_NroOrden") %>'
                                    OnCommand="Modificar" CommandName="Modificar" SkinID="Modificar" ToolTip="Modificar" />
                            </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Eliminar">
                             <ItemTemplate>
                                <asp:ImageButton ID="imbEliminar" runat="server" OnClientClick="return confirm('¿Esta seguro de eliminar este registro?');"
                                    OnCommand="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "GM_NroOrden") %>'
                                    SkinID="Eliminar" ToolTip="Eliminar"></asp:ImageButton>
                            </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" Width="80px" />
                             <HeaderStyle HorizontalAlign="Center" Width="80px" />
                         </asp:TemplateField>
                         <asp:BoundField DataField="GM_NroOrden" HeaderText="Nro. Orden">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="GM_NroSolicitud" HeaderText="Nro.Solicitud">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="GM_Fecha_Creacion" HeaderText="Fec. Creacion">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="GM_Estado" HeaderText="Estado">
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
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" 
                            onclick="btnNuevo_Click" />
                        <asp:Button ID="txtSalirOT" runat="server" Text="Salir" />
	                </td>
                </tr>
            </table>
        </asp:Panel>


    <asp:Panel ID="pnlActSM" runat="server" Style="width:700px;" CssClass="cuadrodes" >
            <table border="0" width="100%">
                <tr><td class="stlTituloPagina">Ordenes de Trabajo</td></tr>	                	                	                                
                <tr><td class="Linea"></td></tr>	                                
            </table>
              <table cellpadding="2" cellspacing="2" border="0" width="100%" class="stlPanelBusqueda"  >
                <tr>
                    <td class="style1">Solicitud</td>
                    <td class="style8">:</td>
                    <td class="style1">
                        <asp:DropDownList ID="ddlSolicitud" runat="server" Height="16px" Width="181px" 
                            onselectedindexchanged="ddlSolicitud_SelectedIndexChanged">
                            <asp:ListItem Value="1">Mant. Electrocardiograma</asp:ListItem>
                            <asp:ListItem Value="2">Mant. Sala Parto</asp:ListItem>
                            <asp:ListItem Value="3">Mant. Neumologia</asp:ListItem>
                        </asp:DropDownList>
                    </td>      
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style10">:</td>
                    <td class="style1">
                    </td>      
                </tr>
                <tr>
                      <td class="style11">
                          Area</td>
                      <td class="style12">
                          :</td>
                      <td class="style11">
                          <asp:TextBox ID="TextBox1" runat="server" BackColor="#CCCCCC" 
                              Width="177px" ReadOnly="True"></asp:TextBox>
                      </td>
                      <td class="style13">
                      </td>
                      <td class="style14">
                      </td>
                      <td class="style11">
                      </td>
                  </tr>
                  <tr>
                      <td class="style4">
                          &nbsp;</td>
                      <td class="style5">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                      <td class="style6">
                          &nbsp;</td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style11">
                          Numero de Orden de Trabajo</td>
                      <td class="style12">
                          :</td>
                      <td class="style11">
                          <asp:TextBox ID="txtOrdendeTrabajo" runat="server" BackColor="#CCCCCC" 
                              Width="177px" ReadOnly="True"></asp:TextBox>
                      </td>
                      <td class="style13">
                      </td>
                      <td class="style14">
                      </td>
                      <td class="style11">
                      </td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Fecha Creación</td>
                      <td class="style5">
                          :</td>
                      <td class="style4">
                          <asp:TextBox ID="txtFecCreacion" runat="server" BackColor="White" 
                              Width="177px"></asp:TextBox>
                      </td>
                      <td class="style6">
                          &nbsp;</td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Creado por</td>
                      <td class="style5">
                          :</td>
                      <td class="style4">
                          <asp:TextBox ID="txtCreadoX" runat="server" Width="177px"></asp:TextBox>
                      </td>
                      <td class="style6">
                          &nbsp;</td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Fecha Inicio</td>
                      <td class="style5">
                          :</td>
                      <td class="style4">
                          <asp:TextBox ID="txtFecInicio" runat="server" Width="177px"></asp:TextBox>
                      </td>
                      <td class="style6">
                          &nbsp;</td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Fecha Fin</td>
                      <td class="style5">
                          :</td>
                      <td class="style4">
                          <asp:TextBox ID="txtFecFin" runat="server" Width="177px"></asp:TextBox>
                      </td>
                      <td class="style6">
                      </td>
                      <td class="style7">
                      </td>
                      <td class="style4">
                      </td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Personal Asociado</td>
                      <td class="style5">
                          :</td>
                      <td class="style4">
                          <asp:DropDownList ID="ddlPersonal" runat="server" Height="16px" Width="181px" 
                              onselectedindexchanged="ddlPersonal_SelectedIndexChanged">
                              <asp:ListItem Value="Luis Sanchez">Luis Sanchez</asp:ListItem>
                              <asp:ListItem Value="Juan Perez">Juan Perez</asp:ListItem>
                              <asp:ListItem Value="Pedro Garcia">Pedro Garcia</asp:ListItem>
                          </asp:DropDownList>
                      </td>
                      <td class="style6">
                          <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Agregar" 
                              Width="78px" />
                      </td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
                          &nbsp;</td>
                      <td class="style5">
                          &nbsp;</td>
                      <td class="style4" colspan="4">
                          <asp:TextBox ID="txtPersonal" runat="server" Height="52px" TextMode="MultiLine" 
                              Width="304px"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Prioridad</td>
                      <td class="style5">
                          :</td>
                      <td class="style4">
                          <asp:DropDownList ID="ddlPrioridad" runat="server" Height="16px" Width="181px">
                              <asp:ListItem>Alta</asp:ListItem>
                              <asp:ListItem>Media</asp:ListItem>
                              <asp:ListItem>Baja</asp:ListItem>
                          </asp:DropDownList>
                      </td>
                      <td class="style6">
                          &nbsp;</td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Comentarios</td>
                      <td class="style5">
                          :</td>
                      <td class="style4" colspan="4">
                          <asp:TextBox ID="txtComentarios" runat="server" Height="53px" 
                              TextMode="MultiLine" Width="303px"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Estado</td>
                      <td class="style5">
                          :</td>
                      <td class="style4">
                          <asp:DropDownList ID="ddlEstado" runat="server" Height="16px" Width="181px">
                              <asp:ListItem Value="PENDIENTE">Pendiente</asp:ListItem>
                              <asp:ListItem Value="ATENDIDO">Atendido</asp:ListItem>
                              <asp:ListItem Value="RECHAZADO">Rechazado</asp:ListItem>
                          </asp:DropDownList>
                      </td>
                      <td class="style6">
                          &nbsp;</td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
                          &nbsp;</td>
                      <td class="style5">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                      <td class="style6">
                          &nbsp;</td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                <%--<tr>
                    <td style="width: 20%">Correo</td>
                    <td>:</td>
                    <td style="width: 80%" colspan="4" >
                    <asp:TextBox ID="txtcorreo" runat="server" CssClass="stlCajaTexto" MaxLength="80" Width="80%"/>
                    </td>      
                </tr>--%>
        </table>
        <br/>   
        <table border="0" width="100%">
            <tr><td class="Linea"> 
            
            </td></tr>	                        
            <tr>
	            <td align="right">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" 
                        onclick="btnGuardar_Click" />  
                    <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" 
                        onclick="btnCerrar_Click" />
	            </td>
            </tr>
            <tr>
                <td align="right">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Button ID="btnTabla" runat="server" Style="display: none" />
    <ajaxtoolkit:ModalPopupExtender ID="mpeActSM" runat="server" BehaviorID="bmpActSM" PopupControlID="pnlActSM"
                    TargetControlID="btnTabla" BackgroundCssClass="modalBackground" DropShadow="true"  CancelControlID="btnTabla" >
    </ajaxtoolkit:ModalPopupExtender>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>
