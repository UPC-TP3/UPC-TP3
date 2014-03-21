<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="GcAdmConsultarPaciente.aspx.cs" Inherits="GcAdmConsultarPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
  
 <div class="col_04">
        <h2 class="recibo_dig">
          Consultar Paciente
          </h2>       
        <div>
<div>
            <div class="width_total">
                <div class="Espaciofiltro">
                    <div class="separador" style="width: 100%">
                        
                        <div class="box_tit reg_title" id="divSpanDP" runat="server" style="width: 98%">
                            Consultar Paciente</div>
                        <asp:UpdatePanel ID="updPaciente" runat="server">
                            <ContentTemplate>
                                <table border="0" cellspacing="0" cellpadding="0" class="Tabla_filtro_txt" style="width: 95%">
                                    <tr>
                                        <td style="width: 30%">
                                            <div class="block_center">
                                                Tipo De documento:</div>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <div class="block_center">
                                                Nro. Documento:</div>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <asp:DropDownList ID="ddlTipoDoc" runat="server" Style="width: 98%" >
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtNroDoc" runat="server" ></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <div class="block_center">
                                                Nombre:</div>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <div class="block_center">
                                                Apellido Paterno:</div>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <div class="block_center">
                                                Apellido Materno:</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtNombre" runat="server" ></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtApPat" runat="server" ></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 30%">
                                            <asp:TextBox ID="txtApMat" runat="server" ></asp:TextBox>
                                        </td>
                                    </tr>                                   
                                    <tr>
                                        <td style="width: 30%">
                                            <div class="block_center">
                                                Observación:</div>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td colspan="3">
                                            <div class="block_center">
                                               </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%" colspan="5">
                                            <asp:TextBox ID="txtObservacion" TextMode="MultiLine" Height="60px" Width="400px" runat="server" ></asp:TextBox>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="padding: 0  0  10px  0;">
                                            &nbsp;</td>
                                    </tr>

                                    <tr>
                                     <td align="center" colspan="5"  >
                                     
                                       <div class="botones">
                                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                                                onclick="btnBuscar_Click"  /></div>
                                     
                                     </td>
                                    
                                    </tr>

                                </table>

                                <div id="divCargas" class="tabla" style="width:100%">
   <asp:GridView ID="gvPaciente" runat="server" AutoGenerateColumns="false" Width="100%" 
                                        onrowdatabound="gvPaciente_RowDataBound">
        <EmptyDataTemplate>No se Encontraron Registros</EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="" ItemStyle-Width="20px" ItemStyle-CssClass="TextCenter">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Paciente" DataField="nombres" />
                <asp:BoundField HeaderText="Ocupación" DataField="Ocupacion" />                
                <asp:BoundField HeaderText="Tipo Documento" DataField="NombreTipoDocumento" />
                <asp:BoundField HeaderText="Nro.Documento" DataField="dni_paciente" />
                <asp:BoundField HeaderText="Anónimo" DataField="Anonimo" />
            </Columns>
            <RowStyle CssClass="row" />
    </asp:GridView>
</div>


                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                    </div>
                </div>
            </div>
        </div>
      

</div> 
 


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

