<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActualizarEvaSolMant.aspx.cs" Inherits="GestionMantenimiento_ActualizarEvaSolMant" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script language="javascript" type="text/javascript">
        function validar() {
            return true;
        }
</script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>

    <asp:Panel ID="pnlListado" runat="server" Width="98%">
            <table border="0" width="100%">
                <tr><td class="stlTituloPagina">Evaluar Solicitud de Mantenimiento</td></tr>	                	                	                                
                <tr><td class="Linea"></td></tr>	                                
            </table>
            <table cellpadding="2" cellspacing="2" border="0" width="100%" class="stlPanelBusqueda"  >
                <tr>
                    <td style="width: 20%">Número de Solicitud</td>
                    <td>:</td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtnrosolicitud" runat="server" CssClass="stlCajaTexto" 
                            Enabled="False" MaxLength="60" />
                    </td>                    
                    <td style="width: 20%">Tipo de Servicio</td>
                    <td>:</td>
                    <td style="width: 30%">
                        <asp:DropDownList ID="ddltiposervicio" runat="server" AutoPostBack="True" 
                            CssClass="stlComboBox" 
                            onselectedindexchanged="ddltiposervicio_SelectedIndexChanged" 
                            Enabled="False" >
                        <asp:ListItem Text="--Seleccionar--" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Equipo Mecanico" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Infraestructura" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>                  
                </tr>
                
                <tr>
                    <td style="width: 20%">Fecha de Creación</td>
                    <td>:</td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtfechacreacion" runat="server" CssClass="stlCajaTexto" 
                            Enabled="False" MaxLength="60" />
                    </td>
                    <td style="width: 20%">Fecha de Incidencia</td>
                    <td>:</td>
                    <td style="width: 30%">
                    <asp:TextBox ID="txtfechaincidencia" CssClass="stlCajaTexto" runat="server" 
                            Enabled="False" ></asp:TextBox>
                          <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/App_Themes/EstilosHO/calendar.gif" />
                            <ajaxtoolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtfechaincidencia"
                                PopupButtonID="btnFecInicial" Enabled="True" Format="ddMMyyyy" >
                            </ajaxtoolkit:CalendarExtender>
                            <ajaxtoolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" MaskType="Number"
                                Mask="99999999" TargetControlID="txtfechaincidencia" >
                            </ajaxtoolkit:MaskedEditExtender>
                    </td>
                        
                </tr>
                <tr runat="server" id="trem1" visible="false">
                    <td style="width: 20%">Equipo&nbsp;Médico</td>
                    <td>:</td>
                    <td colspan="4" style="width: 80%">
                    <asp:DropDownList ID="ddlequipomedico" runat="server" AutoPostBack="True" 
                            CssClass="stlComboBox"
                            onselectedindexchanged="ddlequipomedico_SelectedIndexChanged"
                            Enabled="False" >    
                        <asp:ListItem Text="--Seleccionar--" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Equipo Medico 1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Equipo Medico 2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Equipo Medico 3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Equipo Medico 4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Equipo Medico 5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Equipo Medico 6" Value="6"></asp:ListItem>
                    </asp:DropDownList>
                    </td>      
                </tr>
                <tr runat="server" id="trem2" visible="false">
                    <td style="width: 20%">Equipo&nbsp;Médico</td>
                    <td>:</td>
                    <td colspan="4" style="width: 80%">
                    <asp:TextBox ID="txtequipomedico" runat="server" CssClass="stlCajaTexto" 
                            Width="80%" Enabled="False" />
                    </td>      
                </tr>
                <tr>
                          
                    <td style="width: 20%">Detalle del Servicio</td>
                    <td>:</td>
                    <td colspan="4" style="width: 80%">
                    <asp:TextBox ID="txtdetalleserv" runat="server" CssClass="stlCajaTexto" 
                            Width="80%" Enabled="False" />
                    </td>
                    
                </tr>
                
        </table>
        <br/>
        <table border="0" width="100%">
                <tr><td class="stlTituloPagina">Evaluación</td></tr>	                	                	                                
                <tr><td class="Linea"></td></tr>
        </table>
        <table border="0" width="100%">
            <tr runat="server" id="tr1">
            <td style="width: 50%">
                <asp:RadioButton ID="rbtAceptado" runat="server" Checked="True" 
                    Text="Aceptado" AutoPostBack="True" 
                    oncheckedchanged="rbtAceptado_CheckedChanged" />
            </td>
            <td>
                &nbsp;</td>
            <td style="width: 50%">
                <asp:RadioButton ID="rbtRechazado" runat="server" Text="Anulado" 
                    AutoPostBack="True" oncheckedchanged="rbtRechazado_CheckedChanged" />
            </td>
            </tr>
            <tr runat="server" id="tr2">
                <td style="width: 20%">&nbsp;</td>
                <td>:</td>
                <td style="width: 80%">
                    <asp:DropDownList ID="ddlPrioridad" 
                                      runat="server" 
                                      AutoPostBack="True" 
                                      CssClass="stlComboBox" Visible="False">
                        <asp:ListItem Text="--Seleccionar--" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Alta" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Media" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Baja" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr runat="server" id="tr3">
                <td style="width: 20%">Observacion</td>
                <td>:</td>
                <td style="width: 80%">
                    <asp:TextBox ID="txtobs" runat="server" CssClass="stlCajaTexto" Width="96%" 
                        Height="59px" />
                </td>
            </tr>
        </table>
        <br/>
        <table border="0" width="100%">
            <tr><td class="Linea">
            </td></tr>	                        
            <tr>
	            <td align="right">
                    <asp:Button ID="ibGuardar" runat="server" Text="Guardar" OnClick="ibGuardar_Click" OnClientClick="return validar();" />  
                    <asp:Button ID="ibRegresar" runat="server" Text="Retornar" OnClick="ibRegresar_Click" />                  
	            </td>
            </tr>
        </table>
    </asp:Panel>
        <asp:HiddenField ID="hfns" runat="server" />
    </div>
    </form>
</body>
</html>
