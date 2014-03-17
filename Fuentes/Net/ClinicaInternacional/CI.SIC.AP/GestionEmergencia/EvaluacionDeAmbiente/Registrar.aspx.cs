using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class ModuloEmergenciasRegistrarEvaluacionDeInstalacion : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnGuardar.Attributes.Add("onClick", "javascript:return confirm('¿Estás seguro con registrar esta acción?')");           
            CargaCombo();
            Editable(Request.QueryString["ID"] == null);
            if (Request.QueryString["ID"] != null)
            {
                hdnEvaluacion.Value = Request.QueryString["ID"];
                CargaEditar();
            }
            else
            {
                CargaCrear();    
            }                       
        }
    }

    private void Editable(bool valor)
    {
        txtNombreEnfermeroAuxiliar.Enabled = valor;
        ddlInstalacion.Enabled = valor;
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

    private void CargaCrear()
    {
        hdnEvaluacion.Value="0";
        grvLista.DataSource = new VerificacionBL().Listar(Convert.ToInt32(ddlInstalacion.SelectedItem.Value));
        grvLista.DataBind();
    }

    private void CargaCombo()
    {
        ddlEstado.Items.Add(new ListItem {Value = "1", Text = "Disponible"});
        ddlEstado.Items.Add(new ListItem { Value = "2", Text = "No Disponible" });

        ddlResultado.Items.Add(new ListItem { Value = "1", Text = "Aprobado" });
        ddlResultado.Items.Add(new ListItem { Value = "2", Text = "Desaprobado" });

        ddlInstalacion.DataSource = new InstalacionBL().Listar();
        ddlInstalacion.DataTextField = "Nombre";
        ddlInstalacion.DataValueField = "IdInstalacion";
        ddlInstalacion.DataBind();
    }
    protected void ddlInstalacion_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargaCrear();
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        var detalle = new List<EvaluacionDetalleBE>();
        foreach (GridViewRow row in grvLista.Rows)
        {
            var chkConforme = (CheckBox)row.FindControl("chkConforme");
            var idVerificacion = 0;
            var idEvaluacionDetalle = 0;
            var dataKeys = grvLista.DataKeys[row.RowIndex];
            if (dataKeys != null)
            {
                idVerificacion = Convert.ToInt32(dataKeys["IdVerificacion"].ToString());
                idEvaluacionDetalle = Convert.ToInt32(dataKeys["IdEvaluacionDetalle"].ToString());
            }
            var item = row.Cells[0].ToString();

            var registro = new EvaluacionDetalleBE
                {
                    Item = item,
                    IdVerificacion = idVerificacion,
                    Conformidad = chkConforme.Checked   ,
                    IdEvaluacionDetalle = idEvaluacionDetalle
                };
            detalle.Add(registro);
        }

        var evaluacion = new EvaluacionBE
            {
                IdEvaluacion = Convert.ToInt32(hdnEvaluacion.Value),
                IdInstalacion = Convert.ToInt32(ddlInstalacion.SelectedValue ),
                Disponibilidad = Convert.ToInt32(ddlEstado.SelectedValue),
                Resultado = Convert.ToInt32(ddlResultado.SelectedValue),
                NombreEnfermeroAuxiliar = txtNombreEnfermeroAuxiliar.Text,
                Observaciones = txtObservaciones.Text,
                Fecha = DateTime.Now,
                Detalle = detalle
            };

        hdnEvaluacion.Value = new EvaluacionBL().Grabar(evaluacion).ToString(CultureInfo.InvariantCulture);
        if (!hdnEvaluacion.Value.Equals("0"))
        {
            EjecutarScript(updDatos,"alert('Confirmación de registro');");
            CargaEditar();
        }
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Consultar.aspx");
    }

    public static void EjecutarScript(Control pControl, string pScriptJs)
    {
        var sb = new StringBuilder();
        sb.Append("<script type=\"text/javascript\">");
        sb.Append(pScriptJs);
        sb.Append("</script>");
        var guidKey = Guid.NewGuid();
        ScriptManager.RegisterStartupScript(pControl, pControl.GetType(), guidKey.ToString(), sb.ToString(), false);
    }
}