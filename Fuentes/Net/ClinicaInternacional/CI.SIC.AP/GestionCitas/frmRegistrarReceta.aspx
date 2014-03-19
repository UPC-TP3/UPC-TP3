<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.master" AutoEventWireup="true" CodeFile="frmRegistrarReceta.aspx.cs" Inherits="GestionCitas_frmRegistrarReceta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" Runat="Server">
 <fieldset>
        <legend>Registrar Receta de Medicamentos</legend>
        <asp:HiddenField ID="hdnCodigoCita" runat="server" />
        <asp:HiddenField runat="server" ID="hdnCodigoConsulta" Value="0" />
        <asp:HiddenField runat="server" ID="hdnCodigoMedico" Value="0" />
        <asp:HiddenField ID="hdnCodigoPaciente" runat="server" 
             />
        <table class="formulario">                
                <colgroup>                    
                    <col style="width: 20%;"/>
                    <col style="width: 5%;text-align: center;"/>
                    <col style="width: 75%;"/>
                </colgroup>
                 
           
            </table>
        <table class="formulario">
            <tr>
                <td>
                    Medicamento</td>
                <td>
                    :
                </td>
                <td>
                    <asp:DropDownList ID="cboMedicamento" runat="server" >
                    </asp:DropDownList>
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
                <td class="style1">
                    Dosis</td>
                <td class="style1">
                    :</td>
                <td class="style1">
                    <asp:TextBox ID="txtDosis" runat="server"  ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    </td>
            </tr>
            
           
            <tr>
                <td>
                    Frecuencia</td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtFrecuencia" runat="server" ></asp:TextBox>
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
                    Observación 
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                    <asp:Button ID="btnGrabar" runat="server" Text="Grabar" CssClass="button" 
                        onclick="btnGrabar_Click" />
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnCancelar" runat="server" 
                        Text="Cancelar" CssClass="button" onclick="btnCancelar_Click" 
                        />
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PaginaActual" Runat="Server">
</asp:Content>

