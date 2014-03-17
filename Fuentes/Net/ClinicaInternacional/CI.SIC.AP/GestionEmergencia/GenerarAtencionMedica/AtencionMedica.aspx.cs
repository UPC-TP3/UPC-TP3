using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BL.GenerarAtencionMedica.BL;
using CI.SIC.BE.GenerarAtencionMedica.BE;
using PacienteBL = CI.SIC.BL.GenerarAtencionMedica.BL.PacienteBL;

public partial class GenerarAtencionMedica_AtencionMedica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Params["ID"] != null)
                hdnAtencion.Value = Request.Params["ID"].ToString();
            else
                hdnAtencion.Value = "0";

            ListarMedicos();

            lblMensaje.Text = "";

            ddlCama.DataSource = new CamaBL().Listar().Where(f => f.GA_Estado.Equals("1"));
            ddlCama.DataTextField = "GA_NroCama";
            ddlCama.DataValueField = "ID_Cama";
            ddlCama.DataBind();

            if (hdnAtencion.Value != "0")
            {
                var id = int.Parse(hdnAtencion.Value.ToString());

                var atencionBL = new AtencionMedicaBL();

                var atencion = atencionBL.Listar(id, "").FirstOrDefault();

                txtDNI.Text = atencion.DNIPaciente;
                calFechaIngreso.CalendarDate = atencion.fechaIngreso;
                txtObservaciones.Text = atencion.Observaciones;
                ddlMedicos.SelectedValue = atencion.idMedico.ToString();

                ddlCama.DataSource = new CamaBL().Listar().Where(f => f.GA_Estado.Equals("1") || f.ID_Cama == atencion.idCama);
                ddlCama.DataTextField = "GA_NroCama";
                ddlCama.DataValueField = "ID_Cama";
                ddlCama.DataBind();

                ddlCama.SelectedValue = atencion.idCama.ToString();
                BuscarPaciente();
            }
        }
    }

    private void ListarMedicos()
    {
        ddlMedicos.DataSource = new TurnoBL().ListarMedicosPorTurno("M");
        ddlMedicos.DataTextField = "nombrecompleto";
        ddlMedicos.DataValueField = "id";
        ddlMedicos.DataBind();

       
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        BuscarPaciente();
    }

    private void BuscarPaciente()
    {
        var dni = txtDNI.Text;

        var pacienteBL = new PacienteBL();

        var paciente = pacienteBL.Buscar(dni);

        if (paciente != null)
        {
            txtNombre.Text = paciente.nombre;
            txtApePaterno.Text = paciente.apellidoPaterno;
            txtApeMaterno.Text = paciente.apellidoMaterno;
            txtEdad.Text = (Math.Floor((DateTime.Now - paciente.fechaNacimiento).TotalDays / 360)).ToString();
            hdnPaciente.Value = paciente.id.ToString();
        }
        else
        {
            lblMensaje.Font.Bold = true;
            lblMensaje.Text = "No se encuentra un paciente con DNI " + dni;
        }
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        var atencionBL = new AtencionMedicaBL();

        var atencion = new AtencionMedicaBE
        {
            id = (hdnAtencion.Value == "0" ? 0 : int.Parse(hdnAtencion.Value.ToString())),
            fechaIngreso = calFechaIngreso.CalendarDate,
            medico = int.Parse(ddlMedicos.SelectedValue),
            idCama = int.Parse(ddlCama.SelectedValue),
            paciente = int.Parse(hdnPaciente.Value),
            observaciones = txtObservaciones.Text
        };

        if (hdnAtencion.Value == "0")
        {
            atencionBL.Crear(atencion);
            lblMensaje.Font.Bold = true;
            lblMensaje.Text = "Se creo nuevo registro de Atencion Medica " + atencion.id;
        }
        else
        {
            atencionBL.Actualizar(atencion);
            lblMensaje.Font.Bold = true;
            lblMensaje.Text = "Se actualizo registro de Atencion Medica " + atencion.id;
        }

    }
}