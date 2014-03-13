using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class GestionImagenes_generarOrdenPago : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            btnBuscar_Click(null,null);

        }
    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        Programacion_ExamenBL oProgramacion_Examen = new Programacion_ExamenBL();

        grvLista.DataSource = oProgramacion_Examen.Listado(txtId_orden_examen.Text == "" ? 0 : Convert.ToInt32(txtId_orden_examen.Text), 0, "", txtPaciente.Text.Trim(), txtId_orden_interna.Text == "" ? 0 : Convert.ToInt32(txtId_orden_interna.Text), txtId_historia.Text == "" ? 0 : Convert.ToInt32(txtId_historia.Text));
        grvLista.DataBind();
    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        Response.Redirect("generarOrdenPagoEdit.aspx");
    }

}