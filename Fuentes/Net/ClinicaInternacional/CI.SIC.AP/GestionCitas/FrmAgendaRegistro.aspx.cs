using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;


public partial class GestionCitas_FrmAgendaRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

          
          
            if (!IsPostBack)
            {
                CargarCombo();

                if (Request.QueryString["CodigoAgenda"] != null)
                {
                    var codigoAgenda = Convert.ToString(Request.QueryString["CodigoAgenda"]);
                    hdnCodigoAgenda.Value = codigoAgenda;
                    var agendaMedica = new BAgendaMedica().Obtener(Convert.ToInt32(codigoAgenda));
                    if (agendaMedica != null)
                    {
                        hdnCodigoMedico.Value = agendaMedica.CodigoMedico.ToString();
                        lblNombres.Text = agendaMedica.NombresMedico;
                        lblApellidos.Text = agendaMedica.ApellidosMedico;
                        lblEspecialidad.Text = agendaMedica.DescripcionEspecialidad;
                        txtFecha.Text = agendaMedica.Fecha.Value.ToString("yyyy-MM-dd");
                        //txtHoraInicio.Text = agendaMedica.HoraInicio.Value.ToString("HH:mm");
                        //txtHoraFin.Text = agendaMedica.HoraFin.Value.ToString("HH:mm");
                        //txtConsultorio.Text = agendaMedica.NumeroConsultorio;
                        chkEstado.Checked = agendaMedica.Estado;
                        cboTurnos.SelectedValue = agendaMedica.Id_Turno.ToString();
                        cboConsultorio.SelectedValue = agendaMedica.Id_consultorio.ToString();
                        hdnIdEspecialidad.Value = agendaMedica.Id_Especialidad.ToString();  
                    }
                }
                else
                {
                    var codigoMedico = Convert.ToString(Request.QueryString["CodigoMedico"]);
                    var medico = new BMedico().Obtener(Convert.ToInt32(codigoMedico));
                    if (medico != null)
                    {
                        hdnCodigoMedico.Value = codigoMedico;
                        lblNombres.Text = medico.Nombres;
                        lblApellidos.Text = medico.Apellidos;
                        lblEspecialidad.Text = medico.DescripcionEspecialidad;
                        lblColegiatura.Text = medico.NumeroColegiatura;
                        hdnIdEspecialidad.Value = medico.Id_Especialidad.ToString(); 
                    }
                }
            }
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            DateTime? fechaInicio = null;
            DateTime? fechaFin = null;

            //if (!string.IsNullOrEmpty(txtFecha.Text))
            //{
            //    fechaInicio = new DateTime(
            //        Convert.ToInt32(txtFecha.Text.Substring(0, 4)),
            //        Convert.ToInt32(txtFecha.Text.Substring(5, 2)),
            //        Convert.ToInt32(txtFecha.Text.Substring(8, 2))
            //        );

               
            //}

            fechaInicio = Convert.ToDateTime(txtFecha.Text); 
            DateTime thisDay = DateTime.Today;

            if (fechaInicio < thisDay)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "La fecha es menor a la fecha actual";
                return; 
            }


            if (hdnCodigoAgenda.Value == "0")
            {

                //VALIAR SI EXISTE EL TURNO YA INGRESADO//////
                if (Buscar(fechaInicio.Value,Convert.ToInt32(hdnCodigoMedico.Value),Convert.ToInt32(cboTurnos.SelectedValue)) == true )
                {
                    lblMensaje.Visible = true; 
                    lblMensaje.Text = "Este turno ya fue asignado a este medico";
                    return; 
                }

                ///////////////////////////////////////////////


                hdnCodigoAgenda.Value = new BAgendaMedica().Insertar(new EAgendaMedica
                    {
                        Fecha = fechaInicio,
                        //HoraInicio = fechaInicio,
                        //HoraFin = fechaFin,
                       // NumeroConsultorio = txtConsultorio.Text, 
                        Estado = chkEstado.Checked,
                        CodigoMedico = Convert.ToInt32(hdnCodigoMedico.Value),
                        Id_Turno = Convert.ToInt32(cboTurnos.SelectedValue),
                        Id_consultorio = Convert.ToInt32(cboConsultorio.SelectedValue),
                        Id_Especialidad = Convert.ToInt32(hdnIdEspecialidad.Value)
                    }).ToString();
            }
            else
            {
                new BAgendaMedica().Actualizar(new EAgendaMedica
                    {
                        CodigoAgenda = Convert.ToInt32(hdnCodigoAgenda.Value),
                        Fecha = fechaInicio,
                        HoraInicio = fechaInicio,
                        HoraFin = fechaFin,
                       // NumeroConsultorio = txtConsultorio.Text, 
                        Estado = chkEstado.Checked,
                        CodigoMedico = Convert.ToInt32(hdnCodigoMedico.Value),
                        Id_Turno = Convert.ToInt32(cboTurnos.SelectedValue),
                        Id_consultorio = Convert.ToInt32(cboConsultorio.SelectedValue),
                        Id_Especialidad = Convert.ToInt32(hdnIdEspecialidad.Value)
                    });
            }
           
            ClientScript.RegisterStartupScript(GetType(), "alert",
                                             "<script language=JavaScript>alert('El registro ha sido creado.');</script>");
           // Response.Redirect("frmAgendaMedica.aspx", true);

            Response.Redirect("FrmAgendaDetalle.aspx?CodigoMedico=" + hdnCodigoMedico.Value);

            //Limpiar();

        }

        protected void txtHoraInicio_TextChanged(object sender, EventArgs e)
        {        
            if (!string.IsNullOrEmpty(txtFecha.Text))
            {
                var fecha = new DateTime(
                           Convert.ToInt32(txtFecha.Text.Substring(0, 4)),
                           Convert.ToInt32(txtFecha.Text.Substring(5, 2)),
                           Convert.ToInt32(txtFecha.Text.Substring(8, 2))
                           );

                //if (!string.IsNullOrEmpty(txtHoraInicio.Text))
                //{
                //    var inicio = new DateTime(fecha.Year, fecha.Month, fecha.Day,
                //                              Convert.ToInt32(txtHoraInicio.Text.Substring(0, 2)),
                //                              Convert.ToInt32(txtHoraInicio.Text.Substring(3, 2)), 0
                //        );
                //    txtHoraFin.Text = inicio.AddMinutes(30.0).ToString("HH:mm");
                //}
                //else
                //    txtHoraFin.Text = string.Empty;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {            
            Response.Redirect("FrmAgendaDetalle.aspx?CodigoMedico=" + Request.QueryString["CodigoMedico"]);
        }

        private void Limpiar()
        {
            hdnCodigoAgenda.Value = "0";
            txtFecha.Text = string.Empty;
            //txtHoraInicio.Text = string.Empty;
            //txtHoraFin.Text = string.Empty;
            //txtConsultorio.Text = string.Empty;
            chkEstado.Checked = true;
        }

        private void CargarCombo()
        {

            BTurnoCita turnos = new BTurnoCita();
            cboTurnos.DataSource = turnos.Listar();
            cboTurnos.DataTextField = "Horario_Turno";
            cboTurnos.DataValueField = "Id_Turno";
            cboTurnos.DataBind();

            BConsultorio consultorio = new BConsultorio();
            cboConsultorio.DataSource = consultorio.Listar();
            cboConsultorio.DataTextField = "Nro_Consultorio";
            cboConsultorio.DataValueField = "Id_Consultorio";
            cboConsultorio.DataBind();


        }

        private static Boolean Buscar(DateTime fecha, int idmedico, int idturno ) 
        {
            Boolean resul = false;
            BAgendaMedica turnos = new BAgendaMedica();
            if (turnos.Buscar(fecha,idmedico,idturno).Count()>0   )
            {
                resul = true; 
            }

            return resul;
        }


        protected void cboTurnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void txtFecha_TextChanged(object sender, EventArgs e)
        {

           
            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", "validarFechaMenorActual(" + txtFecha.Text + ")", false);

        }
}
