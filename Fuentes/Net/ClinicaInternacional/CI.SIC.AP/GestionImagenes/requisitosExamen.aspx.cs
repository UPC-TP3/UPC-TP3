using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class GestionImagenes_requisitosExamen : System.Web.UI.Page
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
            //Carga_Especialista();
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
            //txtPrecio.Text = "";
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
                //txtPrecio.Text = eOrden_examen.Precio.ToString();
                txtTipo_atencion.Text = eOrden_examen.Tipo_atencion;
                txtEstado_orden_examen.Text = eOrden_examen.Estado;

                CargaProgramacion();
            }
            else
            {
                lblMensaje.Text = "Orden de examen no existe";
                grvListado.Visible = false;
                cboLocal.SelectedValue = "0";
                cboConsultorio.SelectedValue = "0";
                cboHorario.SelectedValue = "0";
                txtEstado_programacion.Text = "";
                txtEspecialista.Text = "";
                btnVerificar.Visible = false;
            }
        }
    }

    protected void Carga_Horario()
    {
        HorarioBL oHorario = new HorarioBL();
        cboHorario.DataSource = oHorario.Listado("S", cboConsultorio.SelectedValue == "" ? 0 : Convert.ToInt32(cboConsultorio.SelectedValue), txtId_orden_examen.Text == "" ? 0 : Convert.ToInt32(txtId_orden_examen.Text));
        cboHorario.DataTextField = "Fecha";
        cboHorario.DataValueField = "Id_horario";
        cboHorario.DataBind();
    }

    protected void Carga_Consultorio()
    {
        ConsultorioBL oConsultorio = new ConsultorioBL();
        cboConsultorio.DataSource = oConsultorio.Listado("S", Convert.ToInt32(cboLocal.SelectedValue), Convert.ToInt32(cboTipo_examen.SelectedValue));
        cboConsultorio.DataTextField = "Nro_consultorio";
        cboConsultorio.DataValueField = "Id_consultorio";
        cboConsultorio.DataBind();
    }

    protected void CargaProgramacion()
    {
        Programacion_ExamenBL oProgramacion = new Programacion_ExamenBL();
        Programacion_ExamenBE eProgramacion;
        eProgramacion = oProgramacion.Registro(0, txtId_orden_examen.Text == "" ? 0 : Convert.ToInt32(txtId_orden_examen.Text));

        if (eProgramacion != null)
        {
            hidProgramacion.Value = eProgramacion.Id_programacion.ToString();
            cboLocal.SelectedValue = eProgramacion.Id_local.ToString();
            Carga_Consultorio();
            cboConsultorio.SelectedValue = eProgramacion.Id_consultorio.ToString();
            Carga_Horario();
            cboHorario.SelectedValue = eProgramacion.Id_horario.ToString();
            txtEstado_programacion.Text = eProgramacion.Estado;
            txtEspecialista.Text = eProgramacion.Especialista;

            btnVerificar.Visible = true;

            Catalogo_ExamenBL oCatalogo_examen = new Catalogo_ExamenBL();

            grvListado.Visible = true;
            grvListado.DataSource = oCatalogo_examen.ListadoRequisitos(Convert.ToInt32(txtId_orden_examen.Text));
            grvListado.DataBind();

            if (grvListado.Rows.Count == 0)
            {
                lblMensaje.Text = "No hay requisitos para este examen";
            }

        }
        else
        {
            cboLocal.SelectedValue = "0";
            cboConsultorio.SelectedValue = "0";
            cboHorario.SelectedValue = "0";
            txtEstado_programacion.Text = "";
            txtEspecialista.Text = "";
            btnVerificar.Visible = false;

            lblMensaje.Text = "La Orden de Examen aún no se ha programado";
        }

    }


    protected void Cargar()
    {
        Catalogo_ExamenBL oCatalogo_examen = new Catalogo_ExamenBL();

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
        txtTipo_atencion.Text = "";

        if (eOrden_examen != null)
        {
            txtFecha_examen.Text = eOrden_examen.Fecha.ToString("dd/MM/yyyy");
            txtId_orden_atencion.Text = eOrden_examen.Id_orden_atencion.ToString();
            txtId_historia.Text = eOrden_examen.Id_historia.ToString();
            txtPaciente.Text = eOrden_examen.Paciente;
            txtMedico.Text = eOrden_examen.Medico;
            cboTipo_examen.SelectedValue = eOrden_examen.Id_tpo_examen.ToString();
            txtExamen.Text = eOrden_examen.Examen;
            txtTipo_atencion.Text = eOrden_examen.Tipo_atencion;

            grvListado.Visible = true;
            grvListado.DataSource = oCatalogo_examen.ListadoRequisitos(eOrden_examen.Id_examen);
            grvListado.DataBind();

            if (grvListado.Rows.Count == 0)
            {
                lblMensaje.Text = "No hay requisitos para este examen";
            }
        }
        else
        {
            grvListado.Visible = false;
            lblMensaje.Text = "Orden de examen no existe";
            cboLocal.SelectedValue = "0";
            cboConsultorio.SelectedValue = "0";
            cboHorario.SelectedValue = "0";
            txtEstado_programacion.Text = "";
            txtEspecialista.Text = "";
            btnVerificar.Visible = false;
        }   
    }

    protected void txtId_orden_examen_TextChanged(object sender, EventArgs e)
    {
        //if (txtId_orden_examen.Text.Trim() != "")
        //{
        //    Cargar();
        //}
    }
    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        CargaOrden();
        //CargaProgramacion();

        btnVerificar.Visible = false;

        if (txtEstado_orden_examen.Text != "")
            if (txtEstado_orden_examen.Text.Substring(0, 1) == "C")
            {
                btnVerificar.Visible = true;
            }
    }
    protected void cboConsultorio_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnVerificar_Click(object sender, EventArgs e)
    {
        bool bCumple = true;
        string cCumple = "";

        foreach (GridViewRow item in grvListado.Rows)
        {
            CheckBox chkOk = (CheckBox)item.FindControl("chkCumple");

            if (chkOk.Checked == false)
            {
                bCumple = false;
                cCumple = cCumple + chkOk.Text + ", ";
            }
        }

        Programacion_ExamenBL oProgramacion = new Programacion_ExamenBL();
        Programacion_ExamenBE eProgramacion = new Programacion_ExamenBE();

        eProgramacion.Id_programacion =  Convert.ToInt32(hidProgramacion.Value);

        if (bCumple)
        {
            eProgramacion.Estado = "V";
            eProgramacion.Comentarios = "cumple requisitos";

            if (oProgramacion.Modificar(eProgramacion))
            {
                lblMensaje.Text = "Paciente cumple los requisitos. Examen puede ser realizado.";
                btnVerificar.Visible = false;
            }
            else
                lblMensaje.Text = "No se pudo realizar Verificación";
        }
        else {
            eProgramacion.Estado = "O";
            eProgramacion.Comentarios = "No cumple requisitos: " + cCumple;

            if (oProgramacion.Modificar(eProgramacion))
            {
                btnVerificar.Visible = false;
                lblMensaje.Text = "Paciente no cumple los requisitos. Examen debe ser reprogramado.";
            }
            else
                lblMensaje.Text = "No se pudo realizar Verificación";
        }
    }
}