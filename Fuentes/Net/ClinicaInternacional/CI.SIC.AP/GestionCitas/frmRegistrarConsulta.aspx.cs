using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class GestionCitas_frmRegistrarConsulta : System.Web.UI.Page
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
            lblCodigoCita.Text = codigo;
            hdnCodigoPaciente.Value = cita.CodigoPaciente.ToString();
            lblNombresPaciente.Text = cita.NombrePaciente;
            lblApellidosPaciente.Text = cita.ApellidosPaciente;
            lblDni.Text = cita.Dni;
            //hdnCodigoAgenda.Value = cita.CodigoAgenda.ToString();
            hdnCodigoMedico.Value = cita.CodigoMedico.ToString();
            lblNombresMedico.Text = cita.NombresMedico;
            lblApellidosMedico.Text = cita.ApellidosMedico;
            lblFechaCita.Text = cita.FechaAgenda.Value.ToString("dd/MM/yyyy");
            //lblHoraCita.Text = cita.HoraInicioAgenda.Value.ToString("HH:mm");
            lblHoraCita.Text = cita.Horario_Turno;
            lblEspecialidad.Text = cita.DescripcionEspecialidad;
            lblConsultorio.Text = cita.NumeroConsultorio;
            hdnIdConsultorio.Value = cita.Id_Consultorio.ToString();

            if (cita.Id_EstadoCita == 2)
            {
                 var consulta = new BConsulta().Obtener(Convert.ToInt32(codigo));
                 if (consulta != null)
                 {
                     lblDiagnostico.Text = consulta.Diagnostico;
                     lblObservaciones.Text = consulta.Observaciones;
                     hdnCodigoConsulta.Value = consulta.Id_Consulta.ToString();  
                     lblDiagnostico.Enabled = false;
                     lblObservaciones.Enabled = false;
                     btnConfirmar.Visible = false;

                     grvMedicamentos.DataSource = new BRecetaMedica().Listar(consulta.Id_Consulta);
                     grvMedicamentos.DataBind();

                 }
            }

        }
    }
    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        //lblErrorPaciente.Visible = Convert.ToInt32(hdnCodigoPaciente.Value) == 0;
        //lblErrorMedico.Visible = Convert.ToInt32(hdnCodigoMedico.Value) == 0;
        //if (Convert.ToInt32(hdnCodigoPaciente.Value) == 0) return;
        //if (Convert.ToInt32(hdnCodigoMedico.Value) == 0) return;
        //if (Convert.ToInt32(hdnCodigoAgenda.Value) == 0) return;

        DateTime? fechaInicio = null;
        if (!string.IsNullOrEmpty(lblFechaCita.Text))
        {
            fechaInicio = new DateTime(
                Convert.ToInt32(lblFechaCita.Text.Substring(6, 4)),
                Convert.ToInt32(lblFechaCita.Text.Substring(3, 2)),
                Convert.ToInt32(lblFechaCita.Text.Substring(0, 2))
                );

        //    if (!string.IsNullOrEmpty(lblHoraCita.Text))
        //        fechaInicio = new DateTime(
        //            Convert.ToInt32(lblFechaCita.Text.Substring(6, 4)),
        //            Convert.ToInt32(lblFechaCita.Text.Substring(3, 2)),
        //            Convert.ToInt32(lblFechaCita.Text.Substring(0, 2)),
        //            Convert.ToInt32(lblHoraCita.Text.Substring(0, 2)),
        //            Convert.ToInt32(lblHoraCita.Text.Substring(3, 2)), 0
        //            );

        }

        //if (hdnCodigoCita.Value == "0")
        //{
            new BConsulta().Insertar(new EConsulta
            {  
                FechaHoraInicio = fechaInicio,
                //HoraInicioAgenda = fechaInicio,
                Observaciones = lblObservaciones.Text, 
                Diagnostico = lblDiagnostico.Text,
                Id_Medico = Convert.ToInt32(hdnCodigoMedico.Value),
                Id_Cita  = Convert.ToInt32(lblCodigoCita.Text),
                Id_Consultorio = Convert.ToInt32(hdnIdConsultorio.Value),
                Id_Paciente = Convert.ToInt32(hdnCodigoPaciente.Value),
            });
            ClientScript.RegisterStartupScript(GetType(), "alert",
                                               "<script language=JavaScript>alert('El registro ha sido creado.');</script>");
            

            //grvMedico.DataSource = new BAgendaMedica().Listar(true);
            //grvMedico.DataBind();
        //}
        //else
        //{
        //    new BCita().Actualizar(new ECita
        //    {
        //        CodigoCita = Convert.ToInt32(hdnCodigoCita.Value),
        //        FechaAgenda = fechaInicio,
        //        //HoraInicioAgenda = fechaInicio,
        //        CodigoPaciente = Convert.ToInt32(hdnCodigoPaciente.Value),
        //        CodigoMedico = Convert.ToInt32(hdnCodigoMedico.Value),
        //        CodigoAgenda = Convert.ToInt32(hdnCodigoAgenda.Value),
        //        Id_Especialidad = Convert.ToInt32(hdnIdEspecialidad.Value),
        //    });
        //    ClientScript.RegisterStartupScript(GetType(), "alert",
        //                                       "<script language=JavaScript>alert('El registro ha sido actualizado.');</script>");
        //}
        Response.Redirect("frmConsultaMedica.aspx", true);
    }



    


    protected void btnRecetar_Click(object sender, EventArgs e)
    {
        String codigo = lblCodigoCita.Text;

        Response.Redirect("frmRegistrarReceta.aspx?codigo=" + codigo);
       
           
    }
    
}