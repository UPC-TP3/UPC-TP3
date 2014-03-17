using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GestionMantenimiento_Mensaje : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (ShowCloseButton)
            {
                CloseButton.Attributes.Add("onclick", "document.getElementById('" + MessageBox.ClientID + "').style.display = 'none'");
            }
        }
        catch (Exception)
        {
        }
    }

    public bool ShowCloseButton
    {
        get { return true; }
        set { }
    }

    public void ShowError(string message, int height, int width)
    {
        Show(1, message.ToUpper(), 150, 400);
    }

    public void ShowInfo(string message, int height, int width)
    {
        Show(2, message.ToUpper(), 150, 400);
    }

    public void ShowSuccess(string message, int height, int width)
    {
        Show(3, message.ToUpper(), 150, 400);
    }

    public void ShowWarning(string message, int height, int width)
    {
        Show(4, message.ToUpper(), 150, 400);
    }

    public void Show(int messageType, string message, int height, int width)
    {
        pnlCabecera.CssClass = "messageheader" + fr_GetCss(messageType.ToString().ToLower());
        litMessage.Text = message;
        MessageBox.Height = height;
        MessageBox.Width = width;
        MessageBox.CssClass = fr_GetCss(messageType.ToString().ToLower());
        ModalPopupExtenderMessage.Show();
    }

    public String fr_GetCss(string p_cCss)
    {
        if (p_cCss == "1") { return "error"; }
        else if (p_cCss == "2") { return "info"; }
        else if (p_cCss == "3") { return "success"; }
        else if (p_cCss == "4") { return "warning"; }
        else return "";
    }

    public enum MessageType
    {
        Error = 1,
        Info = 2,
        Success = 3,
        Warning = 4
    }
}