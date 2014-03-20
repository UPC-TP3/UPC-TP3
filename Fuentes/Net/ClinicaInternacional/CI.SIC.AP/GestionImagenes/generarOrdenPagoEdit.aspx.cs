using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class GestionImagenes_generarOrdenPagoEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMensaje.Text = "";

        if (!IsPostBack)
        {

            Tipo_ExamenBL oTipo_examen = new Tipo_ExamenBL();
            cboTipo_examen.DataSource = oTipo_examen.Listado("");
            cboTipo_examen.DataTextField = "Descripcion";
            cboTipo_examen.DataValueField = "Id_tpo_examen";
            cboTipo_examen.DataBind();

            LocalBL oLocal = new LocalBL();
            cboLocal.DataSource = oLocal.Listado("S");
            cboLocal.DataTextField = "Nombre";
            cboLocal.DataValueField = "Id_local";
            cboLocal.DataBind();

            Carga_Consultorio();
            Carga_Horario();
            Carga_Especialista();

            if (Request["id"] != null)
            {
                Programacion_ExamenBL oProgramacion = new Programacion_ExamenBL();
                Programacion_ExamenBE eProgramacion;
                eProgramacion = oProgramacion.Registro(Convert.ToInt32(Request["id"].ToString().Trim()), 0);

                if (eProgramacion != null)
                {
                    txtId_orden_examen.Text = eProgramacion.Id_orden_examen.ToString();
                    CargaOrden();
                    //txtId_orden_examen.Enabled = false;

                    cboLocal.SelectedValue = eProgramacion.Id_local.ToString();
                    Carga_Consultorio();
                    cboConsultorio.SelectedValue = eProgramacion.Id_consultorio.ToString();
                    Carga_Horario();
                    cboHorario.SelectedValue = eProgramacion.Id_horario.ToString();
                    txtEstado_programacion.Text = eProgramacion.Estado;
                    txtEspecialista.Text = eProgramacion.Especialista;
                }
                else
                {
                    cboLocal.SelectedValue = "";
                    cboConsultorio.SelectedValue = "";
                    //cboHorario.SelectedValue = "";
                    txtEstado_programacion.Text = "";
                    txtEspecialista.Text = "";

                    lblMensaje.Text = "Programación no existe";
                }
            }

            //if (Request["accion"] != null)
            //{
            //    hidAccion.Value = Request["accion"].ToString();
                //if (hidAccion.Value == "A")
                //{
                //    lblTitulo.Text = "Anulación de Programación de exámenes";
                //    btnOrden_pago.Visible = false;
                //    btnProgramar.Visible = false;
                //    btnReProgramar.Visible = false;
                //    btnAnular.Visible = true;
                //    btnConsultar.Visible=false;

                //    cboLocal.Enabled = false;
                //    cboConsultorio.Enabled = false;
                //    cboHorario.Enabled = false;
                //}
                
                btnProgramar.Visible = false;
                btnReProgramar.Visible = false;
                btnAnular.Visible = false;
                //btnConsultar.Visible = false;
                cboLocal.Enabled = false;
                cboConsultorio.Enabled = false;
                cboHorario.Enabled = false;

                //if (hidAccion.Value == "M")
                //{
                    lblTitulo.Text = "Generación Orden de Pago";
                    btnOrden_pago.Visible = true;
                    btnProgramar.Visible = false;
                    btnReProgramar.Visible = false;
                    btnAnular.Visible = false;
                    //btnConsultar.Visible=false;
             //   }
            //}


            //if (txtEstado_orden_examen.Text.Substring(0,1) == "C")
            //{
            //    btnOrden_pago.Visible = false;
            //}
        }
    }

    protected void CargaOrden()
    {
        if (txtId_orden_examen.Text.Trim() != "")
        {
            Orden_ExamenBL oOrden_examen = new Orden_ExamenBL();
            Orden_ExamenBE eOrden_examen;
            eOrden_examen = oOrden_examen.Registro(Convert.ToInt32(txtId_orden_examen.Text));

            txtFecha_examen.Text = "";
            txtId_orden_atencion.Text = "";
            txtId_historia.Text = "";
            txtPaciente.Text = "";
            txtMedico.Text = "";
            cboTipo_examen.SelectedValue = "1";
            txtExamen.Text = "";
            txtPrecio.Text = "";
            txtTipo_atencion.Text = "";
            txtEstado_orden_examen.Text = "";

            if (eOrden_examen != null)
            {
                txtFecha_examen.Text = eOrden_examen.Fecha.ToString("dd/MM/yyyy");
                txtId_orden_atencion.Text = eOrden_examen.Id_orden_atencion.ToString();
                txtId_historia.Text = eOrden_examen.Id_historia.ToString();
                txtPaciente.Text = eOrden_examen.Paciente;
                txtMedico.Text = eOrden_examen.Medico;
                cboTipo_examen.SelectedValue = eOrden_examen.Id_tpo_examen.ToString();
                txtExamen.Text = eOrden_examen.Examen;
                txtPrecio.Text = eOrden_examen.Precio.ToString();
                txtTipo_atencion.Text = eOrden_examen.Tipo_atencion;
                txtEstado_orden_examen.Text = eOrden_examen.Estado;
                hidId_orden_pago.Value = eOrden_examen.Id_orden_pago.ToString();

                CargaProgramacion();
            }
            else
            {
                cboLocal.SelectedValue = "0";
                cboConsultorio.SelectedValue = "0";
                cboHorario.SelectedValue = "0";
                txtEstado_programacion.Text = "";
                txtEspecialista.Text = "";
                lblMensaje.Text = "Orden de examen no existe";
            }
        }
    }

    protected void txtId_orden_examen_TextChanged(object sender, EventArgs e)
    {
        //btnConsultar_Click(null,null);
    }
    protected void cboLocal_SelectedIndexChanged(object sender, EventArgs e)
    {
        Carga_Consultorio();
        Carga_Horario();
        Carga_Especialista();
    }

    protected void Carga_Consultorio()
    {
        ConsultorioBL oConsultorio = new ConsultorioBL();
        cboConsultorio.DataSource = oConsultorio.Listado("S", Convert.ToInt32(cboLocal.SelectedValue), Convert.ToInt32(cboTipo_examen.SelectedValue));
        cboConsultorio.DataTextField = "Nro_consultorio";
        cboConsultorio.DataValueField = "Id_consultorio";
        cboConsultorio.DataBind();
    }

    protected void cboConsultorio_SelectedIndexChanged(object sender, EventArgs e)
    {
        Carga_Horario();
        Carga_Especialista();
    }

    protected void Carga_Horario()
    {
        HorarioBL oHorario = new HorarioBL();
        cboHorario.DataSource = oHorario.Listado("S",cboConsultorio.SelectedValue==""?0: Convert.ToInt32(cboConsultorio.SelectedValue), txtId_orden_examen.Text=="" ? 0: Convert.ToInt32(txtId_orden_examen.Text));
        cboHorario.DataTextField = "Fecha";
        cboHorario.DataValueField = "Id_horario";
        cboHorario.DataBind();
    }

    protected void cboHorario_SelectedIndexChanged(object sender, EventArgs e)
    {
        Carga_Especialista();
    }

    protected void Carga_Especialista()
    {
        HorarioBL oHorario = new HorarioBL();
        HorarioBE eHorario;
        eHorario = oHorario.Registro(cboHorario.SelectedValue==""? 0: Convert.ToInt32(cboHorario.SelectedValue));

        if (eHorario != null)
            txtEspecialista.Text = eHorario.Medico;
        else
            txtEspecialista.Text = "";

    }
    protected void btnProgramar_Click(object sender, EventArgs e)
    {
        if (txtId_orden_examen.Text.Trim() == "")
        {
            lblMensaje.Text = "Ingrese Orden de Examen";
            txtId_orden_examen.Focus();
            return;
        }

        if (cboLocal.SelectedValue == "")
        {
            lblMensaje.Text = "Seleccione Local";
            cboLocal.Focus();
            return;
        }
        if (cboConsultorio.SelectedValue == "")
        {
            lblMensaje.Text = "Seleccione Consultorio";
            cboConsultorio.Focus();
            return;
        }
        if (cboHorario.SelectedValue == "")
        {
            lblMensaje.Text = "Seleccione Horario";
            cboHorario.Focus();
            return;
        }
        if (txtEstado_programacion.Text != "")
        {
            lblMensaje.Text = "Ya se ha programado Examen";
            return;
        }

        Programacion_ExamenBL oProgramacion_Examen = new Programacion_ExamenBL();
        Programacion_ExamenBE eProgramacion_Examen = new Programacion_ExamenBE();

        eProgramacion_Examen.Id_orden_examen = Convert.ToInt32(txtId_orden_examen.Text);
        eProgramacion_Examen.Id_horario = Convert.ToInt32(cboHorario.SelectedValue);
        eProgramacion_Examen.Estado = "G";

        if (oProgramacion_Examen.Nuevo(eProgramacion_Examen) == true)
            Response.Redirect("programacionImagenes.aspx");
        else
            lblMensaje.Text = "No se pudo registrar Programación";

    }
    protected void btnCerrar_Click(object sender, EventArgs e)
    {
        Response.Redirect("gestionImagenes.aspx");
    }
    protected void btnOrden_pago_Click(object sender, EventArgs e)
    {
        if (txtId_orden_examen.Text.Trim() == "")
        {
            lblMensaje.Text = "Ingrese Orden de Examen";
            txtId_orden_examen.Focus();
            return;
        }

        Orden_PagoBL oOrden_Pago = new Orden_PagoBL();
        Orden_PagoBE eOrden_Pago = new Orden_PagoBE();

        eOrden_Pago.Id_orden_examen = Convert.ToInt32(txtId_orden_examen.Text);
        eOrden_Pago.Estado = "G";
        eOrden_Pago.Importe = Convert.ToDecimal(txtPrecio.Text);

        if (oOrden_Pago.Nuevo(eOrden_Pago) == true)
        {
            int nCorr = oOrden_Pago.Correlativo();

            lblMensaje.Text = "Se generó Orden de Pago: " + nCorr.ToString();
            //Response.Redirect("gestionImagenes.aspx");
            btnOrden_pago.Visible = false;
        }
        else
            lblMensaje.Text = "No se puedo generar Orden de Pago";

    }
    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        CargaOrden();
        //CargaProgramacion();

        if (txtEstado_programacion.Text != "")
            //if (txtEstado_orden_examen.Text.Substring(0, 1) == "C")
            if (txtEstado_programacion.Text.Substring(0, 1) != "G")
            {
                if (hidId_orden_pago.Value=="")
                    hidId_orden_pago.Value = "0";

                if (txtEstado_programacion.Text.Substring(0, 1) == "R" && hidId_orden_pago.Value == "0")
                    btnOrden_pago.Visible = true;
                else
                    btnOrden_pago.Visible = false;
            }
    }

    protected void CargaProgramacion()
    {
        Programacion_ExamenBL oProgramacion = new Programacion_ExamenBL();
        Programacion_ExamenBE eProgramacion;
        eProgramacion = oProgramacion.Registro(0, txtId_orden_examen.Text == "" ? 0 : Convert.ToInt32(txtId_orden_examen.Text));

        if (eProgramacion != null)
        {
            cboLocal.SelectedValue = eProgramacion.Id_local.ToString();
            Carga_Consultorio();
            cboConsultorio.SelectedValue = eProgramacion.Id_consultorio.ToString();
            Carga_Horario();
            cboHorario.SelectedValue = eProgramacion.Id_horario.ToString();
            txtEstado_programacion.Text = eProgramacion.Estado;
            txtEspecialista.Text = eProgramacion.Especialista;

            btnOrden_pago.Visible = true;
        }
        else
        {
            cboLocal.SelectedValue = "0";
            cboConsultorio.SelectedValue = "0";
            cboHorario.SelectedValue = "0";
            txtEstado_programacion.Text = "";
            txtEspecialista.Text = "";
            btnOrden_pago.Visible = false;

            lblMensaje.Text = "La Orden de Examen aún no se ha programado";
        }
 
    }
}