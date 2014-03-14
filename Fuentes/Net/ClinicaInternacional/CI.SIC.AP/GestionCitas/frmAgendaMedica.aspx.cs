using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE; 

public partial class GestionCitas_frmAgendaMedica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grvMedico.DataSource = new BMedico().Listar();
            grvMedico.DataBind();
        }
    }

    protected void grvMedico_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        var index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "Ver")
        {
            var CodigoMedico = (int)grvMedico.DataKeys[index].Value;
            Response.Redirect("FrmAgendaDetalle.aspx?CodigoMedico=" + CodigoMedico);
        }
    }
    protected void grvMedico_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}