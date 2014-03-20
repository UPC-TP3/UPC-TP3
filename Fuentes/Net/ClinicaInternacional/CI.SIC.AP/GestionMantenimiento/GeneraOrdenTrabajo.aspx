﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="GeneraOrdenTrabajo.aspx.cs" Inherits="GestionMantenimiento_MISolicitudMantenimiento" %>
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
        .style15
        {
            background-color: #6699CC;
            height: 1px;
        }
        .style16
        {
            background-color: #6699CC;
            height: 24px;
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
	                <td class="style15"></td>
                </tr>
                <tr>
                    <td bgcolor="White" class="style16">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White" 
                            Text="BÚSQUEDA DE ORDEN DE TRABAJO"></asp:Label>
                    </td>
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
                        <asp:TextBox ID="txtfechaini" runat="server" CssClass="stlCajaTexto"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton2" runat="server" 
                            ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                        <ajaxtoolkit:CalendarExtender ID="CalendarExtender3" runat="server" 
                            Enabled="True" Format="ddMMyyyy" PopupButtonID="btnFecInicial" 
                            TargetControlID="txtfechaini">
                        </ajaxtoolkit:CalendarExtender>
                        <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" 
                            Mask="99999999" MaskType="Number" TargetControlID="txtfechaini">
                        </ajaxtoolkit:MaskedEditExtender>
                    </td>
                    <td>
                        Fecha&nbsp;Fin</td>
                    <td>
                        :</td>
                    <td>
                        <asp:TextBox ID="txtfechafin" runat="server" CssClass="stlCajaTexto"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                        <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                            Enabled="True" Format="ddMMyyyy" PopupButtonID="btnFecInicial" 
                            TargetControlID="txtfechafin">
                        </ajaxtoolkit:CalendarExtender>
                        <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" 
                            Mask="99999999" MaskType="Number" TargetControlID="txtfechafin">
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
                        RESULTADOS DE BÚSQUEDA</td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 16px">
                        <asp:Label ID="lbContador" runat="server" Visible="False"></asp:Label>                    
                    </td>
                </tr>
             </table><br/>
             <div class="HeaderGV" style="HEIGHT: 300px ; overflow:auto; width : 99%  ">
                 <asp:GridView ID="gvOrdenTrabajo" runat="server" AutoGenerateColumns="False" 
                     SkinID="GridZX11" style=" font-size:10px" Width="100%" 
                     onselectedindexchanged="gvOrdenTrabajo_SelectedIndexChanged">
                     <Columns>
                         <asp:BoundField DataField="GM_NroOrden1" HeaderText="Nro. Orden">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="GM_NroSolicitud1" 
                             HeaderText="Nro.Solicitud Asociada">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="GM_Fecha_Creacion" HeaderText="Fec. Creación">
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
                    <td class="style1">Número de Solicitud</td>
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
                      <td class="style4">
                          &nbsp;</td>
                      <td class="style5">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                      <td class="style6">
                          <asp:TextBox ID="txtOrdendeTrabajo" runat="server" BackColor="#CCCCCC" 
                              Height="16px" ReadOnly="True" Visible="False" Width="177px"></asp:TextBox>
                      </td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Fecha Creación</td>
                      <td class="style5">
                          :</td>
                      <td class="style4">
                          <asp:TextBox ID="txtFecCreacion" runat="server" Width="176px" 
                              BackColor="Silver" ReadOnly="True"></asp:TextBox>
                      </td>
                      <td class="style6">
                          <asp:TextBox ID="txtCreadoX" runat="server" BackColor="Silver" ReadOnly="True" 
                              Visible="False" Width="177px"></asp:TextBox>
                      </td>
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
                          <asp:TextBox ID="txtFecInicio" runat="server" CssClass="stlCajaTexto" 
                              Height="20px" Width="177px"></asp:TextBox>
                          <ajaxtoolkit:CalendarExtender ID="txtFecInicio_CalendarExtender" runat="server" 
                              Enabled="True" Format="ddMMyyyy" PopupButtonID="btnFecInicial" 
                              TargetControlID="txtFecInicio">
                          </ajaxtoolkit:CalendarExtender>
                          <ajaxtoolkit:MaskedEditExtender ID="txtFecInicio_MaskedEditExtender" 
                              runat="server" Mask="99999999" MaskType="Number" TargetControlID="txtFecInicio">
                          </ajaxtoolkit:MaskedEditExtender>
                          <asp:ImageButton ID="ImageButton4" runat="server" 
                              ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
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
                          <asp:TextBox ID="txtFecFin" runat="server" CssClass="stlCajaTexto" 
                              Height="20px" Width="177px"></asp:TextBox>
                          <ajaxtoolkit:CalendarExtender ID="txtFecFin_CalendarExtender" runat="server" 
                              Enabled="True" Format="ddMMyyyy" PopupButtonID="btnFecInicial" 
                              TargetControlID="txtFecFin">
                          </ajaxtoolkit:CalendarExtender>
                          <ajaxtoolkit:MaskedEditExtender ID="txtFecFin_MaskedEditExtender" 
                              runat="server" Mask="99999999" MaskType="Number" TargetControlID="txtFecFin">
                          </ajaxtoolkit:MaskedEditExtender>
                          <asp:ImageButton ID="ImageButton5" runat="server" 
                              ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                      </td>
                      <td class="style6">
                          &nbsp;</td>
                      <td class="style7">
                      </td>
                      <td class="style4">
                      </td>
                  </tr>
                  <tr>
                      <td class="style4">
                          Responsable</td>
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
                          &nbsp;</td>
                      <td class="style7">
                          &nbsp;</td>
                      <td class="style4">
                          &nbsp;</td>
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
                          <asp:TextBox ID="txtEstado" runat="server" BackColor="Silver" ReadOnly="True" 
                              Width="181px">Registrado</asp:TextBox>
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
