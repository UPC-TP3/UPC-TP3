using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Plantilla : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Menu_load();
    }
    private void Menu_load()
    {
        string menu = string.Empty;
        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Admisión");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmAmbulatoria.aspx", "Ambulatoria");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmEmergencia.aspx", "Emergencia");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmHospitalizacion.aspx", "Hospitalizacion");
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Citas");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionCitas/ReprogramarCitas.aspx", "Citas");
        menu += "</ul></li>";

        lstMenu.Text = menu;
    }
}
