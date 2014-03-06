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
        if (txtId_orden_examen.Text.Trim() != "")
        {
            Cargar();
        }
    }
}