<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="frmRegistrarConsulta.aspx.cs" Inherits="GestionCitas_frmRegistrarConsulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 299px;
        }
        .style2
        {
            width: 403px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<%--<script language="javascript" type="text/javascript">



    function UpdateMedicina(elemValue) {

        document.getElementById("<%= hdnCodigoPaciente.ClientID %>").value = elemValue;

        var boton = document.getElementById("<%= Button1.ClientID %>");
        boton.click();



    }

    

    function btnBuscarMedicina_onclick() {

        window.open('BuscarPaciente.aspx', null, 'left=400, top=100, height=450, width= 500, status=no, resizable=no, scrollbars=no, location= no');


    }

    --%>
  

</script>


 
    <fieldset>
        <legend style="font-size: medium">Registrar Consulta Medica</legend>
                <table style="width: 100%;">
                    <tr>
                        <td class="style2">
                            <fieldset style="height: 120px;">
                                <legend style="font-size: small">Paciente</legend>
                                &nbsp;<table class="formulario">
                                    <colgroup>
                                        <col style="width: 20%;" />
                                        <col style="width: 5%; text-align: center;" />
                                        <col style="width: 75%;" />
                                    </colgroup>
                                    <tr>
                                        <td class="style1">
                                            Nombres
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblNombresPaciente"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                            Apellidos
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblApellidosPaciente"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                            DNI
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblDni"></asp:Label>
                                        </td>
                                    </tr>
                                    
                                </table>
                                <asp:HiddenField ID="hdnCodigoPaciente" runat="server" />
                                <asp:HiddenField ID="hdnIdConsultorio" runat="server"  />
                            </fieldset>
                            <br />
                        </td>
                        <td>
                            <fieldset style="height: 120px;">
                                <legend style="font-size: small">Médico</legend>
                                &nbsp;<table class="formulario">
                                    <colgroup>
                                        <col style="width: 20%;" />
                                        <col style="width: 5%; text-align: center;" />
                                        <col style="width: 75%;" />
                                    </colgroup>
                                    <tr>
                                        <td>
                                            Nombres
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblNombresMedico"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Apellidos
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblApellidosMedico"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Especialidad
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblEspecialidad"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Colegiatura
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblColegiatura"></asp:Label>
                                            <asp:HiddenField ID="hdnCodigoConsulta" runat="server" />
                                            <asp:HiddenField ID="hdnCodigoMedico" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <fieldset>
                                <legend style="font-size: small">Cita</legend>
                                <table class="formulario">
                                    <colgroup>
                                        <col style="width: 20%;" />
                                        <col style="width: 5%; text-align: center;" />
                                        <col style="width: 75%;" />
                                    </colgroup>
                                    <tr>
                                        <td>
                                            Codigo Cita
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="lblCodigoCita" runat="server" 
                                                Enabled="False" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Fecha
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="lblFechaCita" runat="server" 
                                                Enabled="False" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Hora Cita
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="lblHoraCita" type="time" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            Consultorio
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="lblConsultorio" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            Diagnostico</td>
                                        <td>
                                            :</td>
                                        <td>
                                            <asp:TextBox ID="lblDiagnostico" runat="server" TextMode="MultiLine" 
                                                Width="401px"></asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Observaciones</td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="lblObservaciones" TextMode="MultiLine" 
                                                Width="401px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnRecetar" runat="server" 
                                                Text="Recetar Medicina" onclick="btnRecetar_Click" Visible="False" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                         
                            <asp:GridView ID="grvMedicamentos" runat="server" AutoGenerateColumns="False" 
                                Font-Size="Small">
                                <Columns>
                                    <asp:BoundField DataField="NombreMedicamento" HeaderText="Medicamento" />
                                    <asp:BoundField DataField="Dosis" HeaderText="Dosis" />
                                    <asp:BoundField DataField="Frecuencia" HeaderText="Frecuencia" />
                                    <asp:BoundField DataField="Observacion" HeaderText="Observacion" />
                                </Columns>
                            </asp:GridView>
                         
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button runat="server" ID="btnConfirmar" Text="Grabar Consulta" CssClass="button"
                                OnClick="btnConfirmar_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;<a href="frmConsultaMedica.aspx" class="button">Cancelar</a>
                            </td>
                    </tr>
                </table>
        
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

