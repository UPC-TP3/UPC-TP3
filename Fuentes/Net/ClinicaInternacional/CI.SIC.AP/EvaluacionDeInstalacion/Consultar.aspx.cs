using System;
using System.Linq;
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
    protected void grvLista_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Editar"))
        {
            var idEvaluacion = e.CommandArgument.ToString();
            Response.Redirect(string.Format("Registrar.aspx?ID={0}",idEvaluacion));
        }
        else if (e.CommandName.Equals("Ver"))
        {
            var idEvaluacion = e.CommandArgument.ToString();
            Response.Redirect(string.Format("Ver.aspx?ID={0}", idEvaluacion));
        }
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registrar.aspx");
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        var codigo = string.IsNullOrEmpty(txtCodigo.Text) ? 0 : Convert.ToInt32(txtCodigo.Text);
        grvLista.DataSource =
            new EvaluacionBL().Listar()
                              .Where(
                                  f =>
                                  (f.IdEvaluacion == codigo || codigo == 0) &&
                                  f.NombreEnfermeroAuxiliar.Contains(txtNombre.Text.ToUpper()));
        grvLista.DataBind();
    }
}