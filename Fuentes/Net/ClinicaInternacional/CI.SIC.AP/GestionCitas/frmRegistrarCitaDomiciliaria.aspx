<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="frmRegistrarCitaDomiciliaria.aspx.cs" Inherits="GestionCitas_frmRegistrarCitaDomiciliaria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 144px;
        }
        .style2
        {
            width: 375px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
<script language="javascript" type="text/javascript">
   
   

    function UpdatePaciente(elemValue) {

        document.getElementById("<%= hdnCodigoPaciente.ClientID %>").value = elemValue;

        var boton = document.getElementById("<%= Button1.ClientID %>");
        boton.click();



    }

    function UpdateAgenda(elemValue) {

        document.getElementById("<%= hdnCodigoAgenda.ClientID %>").value = elemValue;

        var boton = document.getElementById("<%= Button2.ClientID %>");
        boton.click();
    }

    function btnBuscarPaciente_onclick() {

        window.open('BuscarPaciente.aspx', null, 'left=400, top=100, height=450, width= 500, status=no, resizable=no, scrollbars=no, location= no');


    }

    function btnBuscarMedico_onclick() {

        window.open('BuscarAgendaMedica.aspx', null, 'left=400, top=100, height=450, width= 750, status=no, resizable=si, scrollbars=si, location= no');


    }

  

</script>


 
    <fieldset>
        <legend>Registrar Cita Domiciliaria</legend>
        <asp:HiddenField runat="server" ID="hdnCodigoCita" Value="0" />
                <table style="width: 100%;">
                    <tr>
                        <td class="style2">
                            <fieldset style="height: 120px;">
                                <legend>Paciente</legend>
                                <asp:HiddenField runat="server" ID="hdnCodigoPaciente" Value="0" />
                                <input type="button" id="btnBuscarPaciente" value="Buscar"  onclick="return btnBuscarPaciente_onclick()" />
                                <table class="formulario">
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
                                    <tr>
                                        <td class="style1">
                                            Telefono Casa
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblTelefonoCasa"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                            Telefono Ref.
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblTelefonoReferencia"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                            Direccion
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblDireccion"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
        
                            <asp:Label ID="lblErrorPaciente" runat="server" Text="* Debe seleccionar un paciente" ForeColor="red" Visible="False"></asp:Label>
                            <br />
                        </td>
                        <td>
                            <fieldset style="height: 120px;">
                                <legend>Médico</legend>
                                <asp:HiddenField ID="hdnIdEspecialidad" runat="server" />
                                <asp:HiddenField runat="server" ID="hdnCodigoMedico" Value="0" />
                                <input type="button" id="btnBuscarMedico" value="Buscar" onclick="return btnBuscarMedico_onclick()" />
                                <table class="formulario">
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
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                            <asp:Label ID="lblErrorMedico" runat="server" Text="* Debe seleccionar un médico" ForeColor="red" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <fieldset>
                                <legend>Cita</legend>
                                <asp:HiddenField runat="server" ID="hdnCodigoAgenda" Value="0" />
                                <table class="formulario">
                                    <colgroup>
                                        <col style="width: 20%;" />
                                        <col style="width: 5%; text-align: center;" />
                                        <col style="width: 75%;" />
                                    </colgroup>
                                    <tr>
                                        <td>
                                            Fecha
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="lblFechaCita" runat="server" Text = "10/03/2014" 
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
                                            <asp:Label ID="Label1" runat="server" Text="Dirección Domicilio "></asp:Label>
                                        </td>
                                        <td>
                                            :</td>
                                        <td>
                                            <asp:TextBox ID="lblDomicilio" runat="server" Width="403px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Referencia"></asp:Label>
&nbsp;Domicilio</td>
                                        <td>
                                            :</td>
                                        <td>
                                            <asp:TextBox ID="lblReferencia" runat="server" TextMode="MultiLine" 
                                                Width="401px"></asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Sintomas
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="lblSintomas" TextMode="MultiLine" Width="401px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Aseguradora
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="lblAseguradora"></asp:TextBox>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button runat="server" ID="btnConfirmar" Text="Confirmar Cita" CssClass="button"
                                OnClick="btnConfirmar_Click" /><a href="frmCitaDomicilio.aspx" class="button">Cancelar</a>
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="." 
                                Width="16px" />
                            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="." 
                                        Width="16px" />
                        </td>
                    </tr>
                </table>
        
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

