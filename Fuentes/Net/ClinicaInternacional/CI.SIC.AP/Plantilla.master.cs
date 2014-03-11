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
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/RegistrarGestionAmbulatoria.aspx", "Ambulatoria");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmEmergencia.aspx", "Emergencia");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmHospitalizacion.aspx", "Hospitalizacion");
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Gestion de Citas");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionCitas/ReprogramarCitas.aspx", "Mantenimiento de Citas");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionCitas/frmAgendaMedica.aspx", "Registrar Consulta Medica");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionCitas/frmCitaDomicilio.aspx", "Generar Consulta Domiciliaria");
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Citas");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionImagenes/requisitosExamen.aspx", "Requisitos Exámenes");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionImagenes/programacionImagenes.aspx", "Programación Exámenes");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionImagenes/generarOrdenPago.aspx", "Ordenes de Pago");
        menu += "</ul></li>";
        lstMenu.Text = menu;
    }
}
