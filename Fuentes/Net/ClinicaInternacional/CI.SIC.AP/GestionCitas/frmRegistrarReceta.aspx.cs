using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class GestionCitas_frmRegistrarReceta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarCombo();

            if (Request.QueryString["codigo"] != null)
            {
                var codigoConsulta = Convert.ToString(Request.QueryString["codigo"]);
                hdnCodigoCita.Value = codigoConsulta;
                var consultaMedica = new BConsulta().Obtener(Convert.ToInt32(codigoConsulta));
                if (consultaMedica != null)
                {
                    hdnCodigoMedico.Value = consultaMedica.Id_Medico.ToString();
                    hdnCodigoPaciente.Value = consultaMedica.Id_Paciente.ToString();
                    hdnCodigoConsulta.Value = consultaMedica.Id_Consulta.ToString();
                   
                }
            }
            ////else
            ////{
            ////    var codigoMedico = Convert.ToString(Request.QueryString["CodigoMedico"]);
            ////    var medico = new BMedico().Obtener(Convert.ToInt32(codigoMedico));
            ////    if (medico != null)
            ////    {
            ////        hdnCodigoMedico.Value = codigoMedico;
            ////        lblNombres.Text = medico.Nombres;
            ////        lblApellidos.Text = medico.Apellidos;
            ////        lblEspecialidad.Text = medico.DescripcionEspecialidad;
            ////        lblColegiatura.Text = medico.NumeroColegiatura;
            ////        hdnIdEspecialidad.Value = medico.Id_Especialidad.ToString();
            ////    }
            ////}
        }
    }



    protected void btnGrabar_Click(object sender, EventArgs e)
    {
        

        //if (hdnCodigoConsulta.Value == "0")
        //{
        new BRecetaMedica().Insertar(new ERecetaMedica
        {
            Observacion = txtObservacion.Text,
            //HoraInicioAgenda = fechaInicio,
            Id_Paciente = Convert.ToInt32(hdnCodigoPaciente.Value),
            Id_Medico = Convert.ToInt32(hdnCodigoMedico.Value),
            Id_Consulta  = Convert.ToInt32(hdnCodigoConsulta.Value),
            Id_Medicamento = Convert.ToInt32(cboMedicamento.SelectedValue),
            Dosis = txtDosis.Text,
            Frecuencia = txtFrecuencia.Text, 
        });

        //}
        //else
        //{
        //    new BAgendaMedica().Actualizar(new EAgendaMedica
        //    {
        //        CodigoAgenda = Convert.ToInt32(hdnCodigoConsulta.Value),
        //        Fecha = fechaInicio,
        //        HoraInicio = fechaInicio,
        //        HoraFin = fechaFin,
        //        // NumeroConsultorio = txtConsultorio.Text, 
        //        Estado = chkEstado.Checked,
        //        CodigoMedico = Convert.ToInt32(hdnCodigoMedico.Value),
        //        Id_Turno = Convert.ToInt32(cboTurnos.SelectedValue),
        //        Id_consultorio = Convert.ToInt32(cboConsultorio.SelectedValue),
        //        Id_Especialidad = Convert.ToInt32(hdnCodigoPaciente.Value)
        //    });
        //}

        ClientScript.RegisterStartupScript(GetType(), "alert",
                                         "<script language=JavaScript>alert('El registro ha sido creado.');</script>");
        // Response.Redirect("frmAgendaMedica.aspx", true);


        Response.Redirect("frmRegistrarConsulta.aspx?codigo=" + hdnCodigoCita.Value);
        

        //Limpiar();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmRegistrarConsulta.aspx?codigo=" + hdnCodigoConsulta.Value);
    }

    private void CargarCombo()
    {

       BMedicamento medicina = new BMedicamento();
       cboMedicamento.DataSource = medicina.Listar();
       cboMedicamento.DataTextField = "NombreMedicamento";
       cboMedicamento.DataValueField = "Id_Medicamento";
       cboMedicamento.DataBind();

     


    }


}