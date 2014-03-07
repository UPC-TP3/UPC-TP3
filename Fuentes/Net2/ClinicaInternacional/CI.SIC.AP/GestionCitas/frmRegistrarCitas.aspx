<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="frmRegistrarCitas.aspx.cs" Inherits="GestionCitas_frmRegistrarCitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language="javascript" type="text/javascript">
    function abrirModal(pagina) {
        var vReturnValue;
        vReturnValue = window.showModalDialog(pagina, "", "dialogHeight: 280px; dialogWidth: 300px; edge: Raised; center: Yes; help: No; resizable: No; status: No;");

        if (vReturnValue != null && vReturnValue == true) {
            __doPostBack('', '');
            return vReturnValue
        }
        else {
            return false;
        }
    }
//    function btnBuscarPaciente_onclick() {

//        abrirModal('BuscarPaciente.aspx');

//    }


//    function btnBuscarMedico_onclick() {

//        abrirModal('BuscarAgendaMedica.aspx');

//    }

//    function Seleccionar(sender, eventArgs) {

//       

//        var nombre =    form1.document.getElementById("hdnCodigoPaciente").value; 

//    }

//    function BuscarPaciente(fname1, fname2) {
//        val1 = document.getElementById(fname1).value;
//        val2 = document.getElementById(fname2).value;
//        hidden = window.open('/BuscarPaciente.aspx?Control1=' + fname1 + '&ControlVal1=' + val1 + '&Control2=' + fname2 + '&ControlVal2=' + val2, '_blank', 'top=300,left=350, width=600, height=450,status=yes,resizable=no,scrollbars=no');
    //    }

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

        window.open('BuscarPaciente.aspx',null,'left=400, top=100, height=450, width= 450, status=no, resizable=no, scrollbars=no, location= no');


    }

        function btnBuscarMedico_onclick() {

            window.open('BuscarAgendaMedica.aspx', null, 'left=400, top=100, height=450, width= 700, status=no, resizable=no, scrollbars=no, location= no');


        }

  

</script>


 
    <fieldset>
        <legend>Registrar Cita </legend>
        <asp:HiddenField runat="server" ID="hdnCodigoCita" Value="0" />
                <table style="width: 100%;">
                    <tr>
                        <td>
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
                                        <td>
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
                                        <td>
                                            Apellidos
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblApellidosPaciente"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
        
                            <asp:Label ID="lblErrorPaciente" runat="server" Text="* Debe seleccionar un paciente" ForeColor="red" Visible="False"></asp:Label>
                        </td>
                        <td>
                            <fieldset style="height: 120px;">
                                <legend>Médico</legend>
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
                                            <asp:TextBox runat="server" ID="lblConsultorio" type="time" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button runat="server" ID="btnConfirmar" Text="Confirmar Cita" CssClass="button"
                                OnClick="btnConfirmar_Click" /><a href="ReprogramarCitas.aspx" class="button">Cancelar</a>
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="." 
                                Width="16px" />
                            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="." 
                                Width="16px" />
                        </td>
                    </tr>
                </table>
        
    </fieldset>
    


   
</asp:Content>

