<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true"
    CodeFile="GcAdmConsultaCita.aspx.cs" Inherits="GcAdmAmbulatoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .col_04 span
        {
            padding: 0px 0px 0px 0px;
            text-align: inherit;
        }
        .ValidacionMensaje
        {
            font-size: 11px;
            color: Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="Server">
    <div class="col_04">      
        <div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 75%">
                        <div class="box_tit reg_title" id="divSpanDP" runat="server" style="width: 98%">
                            Datos del Paciente</div>
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                                <td style="width: 30%">
                                <div class="block_center">
                                    Nro. Documento:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                <div class="block_center">
                                    Tipo De documento:</div> 
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 30%">
                                </td>
                            </tr>
                            <tr>                               
                                
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtNroDoc" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    &nbsp;
                                </td>
                                <td style="width: 30%">
                                    <asp:DropDownList ID="ddlTipoDoc" DataValueField="Codigo" DataTextField="Descripcion" runat="server" Style="width: 98%">
                                       
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5%">
                                    
                                </td>
                                <td style="width: 30%">                                 
                                </td>
                            </tr>                                                       
                        </table>
                         <br />                        
                        <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                            <tr>
                             <td align="right" >        
                             <div class="botones">
                                <br />                     
                                 <asp:Button ID="btnAceptar" Width="80px" runat="server" 
                                     Text="Aceptar" onclick="btnAceptar_Click" />            
                                     </div>
                                                      
                             </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" runat="Server">
</asp:Content>
