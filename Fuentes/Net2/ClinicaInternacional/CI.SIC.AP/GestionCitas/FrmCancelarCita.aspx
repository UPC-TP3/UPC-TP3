<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeFile="FrmCancelarCita.aspx.cs" Inherits="GestionCitas_FrmCancelarCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Citas</legend>
        <asp:GridView ID="grvCita" runat="server" Width="97%" CssClass="datos" AutoGenerateColumns="False"
            DataKeyNames="CodigoCita" OnRowCommand="grvCita_RowCommand" 
            onrowdatabound="grvCita_RowDataBound">
            <Columns>
                <asp:BoundField DataField="FechaAgenda" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="HoraInicioAgenda" HeaderText="H. Inicio" DataFormatString="{0:t}">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="HoraFinAgenda" HeaderText="H. Inicio" DataFormatString="{0:t}">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="NombrePaciente" HeaderText="Paciente">
                    <HeaderStyle HorizontalAlign="Center" />                    
                </asp:BoundField>
                <asp:BoundField DataField="NombreMedico" HeaderText="Medico">
                    <HeaderStyle HorizontalAlign="Center" />                    
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                       
                        <asp:ImageButton ID="imbCancelar" runat="server" AlternateText="Cancelar" ImageUrl="~/Imagenes/Iconos/Delete.png"
                            CommandName="Cancelar" ToolTip="Cancelar" CommandArgument="<%#(short)Container.DataItemIndex%>" />
                    </ItemTemplate>
                    <ItemStyle Width="45px" HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </fieldset><br />
    <br />
    <asp:Button ID="btnRegresar" runat="server" onclick="btnRegresar_Click" 
        Text="Retornar" />
</asp:Content>
