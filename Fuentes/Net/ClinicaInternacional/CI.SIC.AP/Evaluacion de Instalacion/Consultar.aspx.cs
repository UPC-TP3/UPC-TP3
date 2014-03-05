using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;

public partial class EvaluacionDeInstalacionConsultar : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargaLista();
        }
    }

    private void CargaLista()
    {
        grvLista.DataSource = new EvaluacionBL().Listar();
        grvLista.DataBind();
    }
}