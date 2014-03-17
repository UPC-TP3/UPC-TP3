using System;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;

public partial class EvaluacionDeInstalacionVer : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CargaCombo();
        
        if (Request.QueryString["ID"] != null)
        {
            Editable(false);
            hdnEvaluacion.Value = Request.QueryString["ID"];
            CargaEditar();
        }

    }

    private void CargaCombo()
    {
        ddlEstado.Items.Add(new ListItem { Value = "1", Text = "Disponible" });
        ddlEstado.Items.Add(new ListItem { Value = "2", Text = "No Disponible" });

        ddlResultado.Items.Add(new ListItem { Value = "1", Text = "Aprobado" });
        ddlResultado.Items.Add(new ListItem { Value = "2", Text = "Desaprobado" });

        ddlInstalacion.DataSource = new InstalacionBL().Listar();
        ddlInstalacion.DataTextField = "Nombre";
        ddlInstalacion.DataValueField = "IdInstalacion";
        ddlInstalacion.DataBind();
    }

    private void CargaEditar()
    {
        var evaluacion = new EvaluacionBL().Obtener(Convert.ToInt32(hdnEvaluacion.Value));
        hdnEvaluacion.Value = evaluacion.IdEvaluacion.ToString(CultureInfo.InvariantCulture);
        txtNombreEnfermeroAuxiliar.Text = evaluacion.NombreEnfermeroAuxiliar;
        ddlEstado.SelectedValue = evaluacion.Disponibilidad.ToString(CultureInfo.InvariantCulture);
        ddlResultado.SelectedValue = evaluacion.Resultado.ToString(CultureInfo.InvariantCulture);
        ddlInstalacion.SelectedValue = evaluacion.IdInstalacion.ToString(CultureInfo.InvariantCulture);
        txtObservaciones.Text = evaluacion.Observaciones;
        grvLista.DataSource = evaluacion.Detalle;
        grvLista.DataBind();
    }

    private void Editable(bool valor)
    {
        txtNombreEnfermeroAuxiliar.Enabled = valor;
        ddlInstalacion.Enabled = valor;
        grvLista.Enabled = valor;
        ddlEstado.Enabled = valor;
        ddlResultado.Enabled = valor;
        txtObservaciones.Enabled = valor;
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Consultar.aspx");
    }

}