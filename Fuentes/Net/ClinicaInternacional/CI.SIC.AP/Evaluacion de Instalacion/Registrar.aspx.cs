using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.CC;

public partial class ModuloEmergenciasRegistrarEvaluacionDeInstalacion : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargaCombo();
            if (Request.QueryString["ID"] != null)
            {
                CargaEditar();
            }
            else
            {
                CargaCrear();    
            }                       
        }
    }

    private void CargaEditar()
    {
        var evaluacion = new EvaluacionBL().Obtener(Convert.ToInt32(Request.QueryString["ID"]));
        txtNombreEnfermeroAuxiliar.Text = evaluacion.NombreEnfermeroAuxiliar;
        ddlEstado.SelectedValue = evaluacion.Disponibilidad.ToString(CultureInfo.InvariantCulture);
        ddlResultado.SelectedValue = evaluacion.Resultado.ToString(CultureInfo.InvariantCulture);
        ddlInstalacion.SelectedValue = evaluacion.IdInstalacion.ToString(CultureInfo.InvariantCulture);
        grvLista.DataSource = evaluacion.Detalle;
        grvLista.DataBind();
    }

    private void CargaCrear()
    {
    }

    private void CargaCombo()
    {
        foreach (var item in from Estado r in Enum.GetValues(typeof(Estado)) select new ListItem(Enum.GetName(typeof(Estado), r), r.ToString()))
        {
            ddlEstado.Items.Add(item);
        }

        foreach (var item in from Resultado r in Enum.GetValues(typeof(Resultado)) select new ListItem(Enum.GetName(typeof(Resultado), r), r.ToString()))
        {
            ddlResultado.Items.Add(item);
        }

        ddlInstalacion.DataSource = new InstalacionBL().Listar();
        ddlInstalacion.DataTextField = "Nombre";
        ddlInstalacion.DataValueField = "IdInstalacion";
        ddlInstalacion.DataBind();
    }
    protected void ddlInstalacion_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}