<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Mensaje.ascx.cs" Inherits="GestionMantenimiento_Mensaje" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link href="../App_Themes/EstilosHO/Default.css" rel="stylesheet" type="text/css" />
<asp:LinkButton ID="LinkButtonTargetControl" runat="server"></asp:LinkButton>

<asp:Panel ID="MessageBox" runat="server" Style="display: none;background-color:White;height:180px;"  >
    <asp:Panel ID="pnlCabecera" runat="server" style="color: white;background-color: #6699CC;font-weight: bold;text-align:center" 
        Height="25px">
        <asp:Label ID="LabelPopupHeader" runat="server" style="color:white;font-weight: bold;" 
            Text="Mensaje del Sistema"  />
        <asp:HyperLink ID="CloseButton" runat="server" style="float:right">
        </asp:HyperLink>
    </asp:Panel>
    <div style="height:110px; overflow:auto;padding:10px">
        <p>
            <asp:Literal ID="litMessage" runat="server"></asp:Literal>
        </p>
        
    </div>
    <div style="height:25px;" align="center" >
        <asp:Button ID="iButtonOK" runat="server" CssClass="button" Text="Cerrar" />
    </div>
</asp:Panel>
<cc1:ModalPopupExtender ID="ModalPopupExtenderMessage" runat="server" 
    BackgroundCssClass="modalBackground" CancelControlID="CloseButton" 
    OkControlID="iButtonOK" PopupControlID="MessageBox" DropShadow="true" 
    TargetControlID="LinkButtonTargetControl">
</cc1:ModalPopupExtender>