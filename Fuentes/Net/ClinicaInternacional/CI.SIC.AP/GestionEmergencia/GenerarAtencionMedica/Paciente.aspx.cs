using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL.GenerarAtencionMedica.BL;
using CI.SIC.BE.GenerarAtencionMedica.BE;

public partial class GenerarAtencionMedica_Paciente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMensaje.Text = "";
        }
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        var paciente = new PacienteBE { 
            id = 0,
            nombre = txtNombre.Text,
            apellidoPaterno = txtApePaterno.Text,
            apellidoMaterno = txtApeMaterno.Text,
            dni = txtDNI.Text,
            fechaNacimiento = calFechaNacimiento.CalendarDate
        };

        new PacienteBL().Crear(paciente);

        lblMensaje.Font.Bold = true;
        lblMensaje.Text = "Se creo nuevo registro de Paciente " + paciente.id;
    }
}