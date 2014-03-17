using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL.GenerarAtencionMedica.BL;
using CI.SIC.BE.GenerarAtencionMedica.BE;

public partial class GenerarAtencionMedica_Listado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Listar();
        }
    }

    private void Listar()
    {
        grvLista.DataSource = new AtencionMedicaBL().Listar(0, "");
        grvLista.DataBind();
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        int id = (txtNroIngreso.Text == "" ? 0 : int.Parse(txtNroIngreso.Text));
        var dni = txtDNIPaciente.Text;
        grvLista.DataSource = new AtencionMedicaBL().Listar(id, dni);
        grvLista.DataBind();
    }
    protected void grvLista_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Editar"))
        {
            var id = e.CommandArgument.ToString();
            Response.Redirect(string.Format("AtencionMedica.aspx?ID={0}", id));
        }

        if (e.CommandName.Equals("Ver"))
        {
            var id = e.CommandArgument.ToString();
            Response.Redirect(string.Format("AtencionMedica.aspx?ID={0}", id));
        }

        if (e.CommandName.Equals("Borrar"))
        {
            var id = int.Parse(e.CommandArgument.ToString());

            new AtencionMedicaBL().Eliminar(id);

            lblMensaje.Font.Bold = true;
            lblMensaje.Text = "Se elimino el registro con id " + id;

            Listar();
        }
    }
    protected void grvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvLista.PageIndex = e.NewPageIndex;
        Listar();
    }
}