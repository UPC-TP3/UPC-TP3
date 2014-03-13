using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class GestionImagenes_programacionImagenes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");

            LocalBL oLocal = new LocalBL();
            cboLocal.DataSource = oLocal.Listado("T");
            cboLocal.DataTextField = "Nombre";
            cboLocal.DataValueField = "Id_local";
            cboLocal.DataBind();
            
            btnBuscar_Click(null,null);

        }
    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        //if (txtFecha.Text.Trim() == "")
        //{
        //    lblMensaje.Text = "Indique fecha";
        //    txtFecha.Focus();
        //    return;
        //}

        Programacion_ExamenBL oProgramacion_Examen = new Programacion_ExamenBL();

        grvLista.DataSource = oProgramacion_Examen.Listado(txtId_orden_examen.Text == "" ? 0 : Convert.ToInt32(txtId_orden_examen.Text), cboConsultorio.SelectedValue == "" ? 0 : Convert.ToInt32(cboConsultorio.SelectedValue), txtFecha.Text, txtPaciente.Text.Trim(), 0, 0);
        grvLista.DataBind();
    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        Response.Redirect("programacionImagenesEdit.aspx");
    }
    protected void cboLocal_SelectedIndexChanged(object sender, EventArgs e)
    {
        ConsultorioBL oConsultorio = new ConsultorioBL();
        cboConsultorio.DataSource = oConsultorio.Listado("T", Convert.ToInt32(cboLocal.SelectedValue), 0);
        cboConsultorio.DataTextField = "Nro_consultorio";
        cboConsultorio.DataValueField = "Id_consultorio";
        cboConsultorio.DataBind();
    }
}