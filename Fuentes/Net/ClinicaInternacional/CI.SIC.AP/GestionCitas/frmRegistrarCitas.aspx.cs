using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL; 
using CI.SIC.BE;

public partial class GestionCitas_frmRegistrarCitas : System.Web.UI.Page
{

    

    protected void Page_Load(object sender, EventArgs e)
    {
        //DateTime thisDay = DateTime.Today;

        //lblFechaCita.Text = thisDay.ToString("dd/MM/yyyy");

        

        if (!IsPostBack)
        {
            ObtenerCita();
        }
    }


    private void ObtenerCita()
    {

        String codigo = Request.QueryString["codigo"];

        var cita = new BCita().Obtener(Convert.ToInt32(codigo));
        if (cita != null)
        {
            hdnCodigoCita.Value = codigo; 
            hdnCodigoPaciente.Value = cita.CodigoPaciente.ToString();
            lblNombresPaciente.Text = cita.NombrePaciente;
            lblApellidosPaciente.Text = cita.ApellidosPaciente;
            lblDni.Text = cita.Dni; 
            hdnCodigoAgenda.Value =  cita.CodigoAgenda.ToString();
            hdnCodigoMedico.Value = cita.CodigoMedico.ToString();
            lblNombresMedico.Text = cita.NombresMedico;
            lblApellidosMedico.Text = cita.ApellidosMedico;
            lblFechaCita.Text = cita.FechaAgenda.Value.ToString("dd/MM/yyyy");
            //lblHoraCita.Text = cita.HoraInicioAgenda.Value.ToString("HH:mm");
            lblHoraCita.Text = cita.Horario_Turno;
            lblEspecialidad.Text = cita.DescripcionEspecialidad;
            lblConsultorio.Text = cita.NumeroConsultorio;
            hdnIdEspecialidad.Value = cita.Id_Especialidad.ToString();  
            
        }
    }


    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        lblErrorPaciente.Visible = Convert.ToInt32(hdnCodigoPaciente.Value) == 0;
        lblErrorMedico.Visible = Convert.ToInt32(hdnCodigoMedico.Value) == 0;
        if (Convert.ToInt32(hdnCodigoPaciente.Value) == 0) return;
        if (Convert.ToInt32(hdnCodigoMedico.Value) == 0) return;
        if (Convert.ToInt32(hdnCodigoAgenda.Value) == 0) return;

        DateTime? fechaInicio = null;
        if (!string.IsNullOrEmpty(lblFechaCita.Text))
        {
            fechaInicio = new DateTime(
                Convert.ToInt32(lblFechaCita.Text.Substring(6, 4)),
                Convert.ToInt32(lblFechaCita.Text.Substring(3, 2)),
                Convert.ToInt32(lblFechaCita.Text.Substring(0, 2))
                );

            if (!string.IsNullOrEmpty(lblHoraCita.Text))
                fechaInicio = new DateTime(
                    Convert.ToInt32(lblFechaCita.Text.Substring(6, 4)),
                    Convert.ToInt32(lblFechaCita.Text.Substring(3, 2)),
                    Convert.ToInt32(lblFechaCita.Text.Substring(0, 2)),
                    Convert.ToInt32(lblHoraCita.Text.Substring(0, 2)),
                    Convert.ToInt32(lblHoraCita.Text.Substring(3, 2)), 0
                    );

        }

        if (hdnCodigoCita.Value == "0")
        {
            new BCita().Insertar(new ECita
            {
                FechaAgenda = fechaInicio,
                //HoraInicioAgenda = fechaInicio,
                CodigoPaciente = Convert.ToInt32(hdnCodigoPaciente.Value),
                CodigoMedico = Convert.ToInt32(hdnCodigoMedico.Value),
                CodigoAgenda = Convert.ToInt32(hdnCodigoAgenda.Value),
                Id_Especialidad = Convert.ToInt32(hdnIdEspecialidad.Value),
            });
            ClientScript.RegisterStartupScript(GetType(), "alert",
                                               "<script language=JavaScript>alert('El registro ha sido creado.');</script>");
            Limpiar();

            //grvMedico.DataSource = new BAgendaMedica().Listar(true);
            //grvMedico.DataBind();
        }
        else
        {
            new BCita().Actualizar(new ECita
            {
                CodigoCita = Convert.ToInt32(hdnCodigoCita.Value),
                FechaAgenda = fechaInicio,
                //HoraInicioAgenda = fechaInicio,
                CodigoPaciente = Convert.ToInt32(hdnCodigoPaciente.Value),
                CodigoMedico = Convert.ToInt32(hdnCodigoMedico.Value),
                CodigoAgenda = Convert.ToInt32(hdnCodigoAgenda.Value),
                Id_Especialidad = Convert.ToInt32(hdnIdEspecialidad.Value),
            });
            ClientScript.RegisterStartupScript(GetType(), "alert",
                                               "<script language=JavaScript>alert('El registro ha sido actualizado.');</script>"); 
        }
        Response.Redirect("ReprogramarCitas.aspx", true);
    }

    private void Limpiar()
    {
        hdnCodigoCita.Value = "0";
        hdnCodigoMedico.Value = "0";
        hdnCodigoPaciente.Value = "0";
        hdnCodigoAgenda.Value = "0";
        hdnIdEspecialidad.Value = "0"; 
        lblNombresMedico.Text = lblApellidosMedico.Text = lblEspecialidad.Text = lblFechaCita.Text = lblHoraCita.Text = string.Empty;
        lblNombresPaciente.Text = lblApellidosPaciente.Text = string.Empty;
        lblConsultorio.Text = string.Empty; 
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
     //   ClientScript.RegisterStartupScript(GetType(), "alert", "<script language=JavaScript>alert(" + hdnCodigoPaciente.Value  + ");</script>");

        ObtenerPacientes();
    }

    private void ObtenerPacientes()
    {
        var paciente = new BPaciente().Obtener(Convert.ToInt32(hdnCodigoPaciente.Value));
        if (paciente != null)
        {

            hdnCodigoPaciente.Value = paciente.CodigoPaciente.ToString();
            lblNombresPaciente.Text = paciente.Nombres;
            lblApellidosPaciente.Text = paciente.ApellidoPat;
            lblDni.Text = paciente.Dni;
            lblTelefono.Text = paciente.TelefonoCasa; 
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        ObtenerAgenda();

    }

    private void ObtenerAgenda()
    {
        var agenda = new BAgendaMedica().Obtener(Convert.ToInt32(hdnCodigoAgenda.Value));
        if (agenda != null)
        {

            hdnCodigoAgenda.Value = agenda.CodigoAgenda.ToString();
            hdnCodigoMedico.Value = agenda.CodigoMedico.ToString();
            lblNombresMedico.Text = agenda.NombresMedico;
            lblApellidosMedico.Text = agenda.ApellidosMedico;
            lblFechaCita.Text = agenda.Fecha.Value.ToString("dd/MM/yyyy");
           // lblHoraCita.Text = agenda.HoraInicio.Value.ToString("HH:mm");
            lblHoraCita.Text = agenda.Horario_Turno;
            lblEspecialidad.Text = agenda.DescripcionEspecialidad;
            lblConsultorio.Text = agenda.NumeroConsultorio;
            lblColegiatura.Text = agenda.NumeroColegiatura;
            hdnIdEspecialidad.Value  = agenda.Id_Especialidad.ToString(); 

        }    
    }

}