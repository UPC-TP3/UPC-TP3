using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BL.GenerarAtencionMedica.BL;

public partial class GestionEmergencia_GenerarOrdenSalidaMedicamento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lblContador.Text = Configuraciones.TiempoRecarga.ToString();    
            Listar();      
            Combo();
        }
    }

    private void Listar()
    {
        grvLista.DataSource = new AtencionMedicaBL().Listar(0, string.Empty);
        grvLista.DataBind();
    }

    private void Combo()
    {
        ddlMedico.DataSource = new TurnoBL().ListarMedicosPorTurno("M");
        ddlMedico.DataTextField = "nombrecompleto";
        ddlMedico.DataValueField = "id";
        ddlMedico.Enabled = false;
        ddlMedico.DataBind();

        ddlCama.DataSource = new CamaBL().Listar();
        ddlCama.DataTextField = "GA_NroCama";
        ddlCama.DataValueField = "ID_Cama";
        ddlCama.Enabled = false;
        ddlCama.DataBind();
        
    }


    protected void btnAceptar_Click(object sender, EventArgs e)
    {
      //      throw new NotImplementedException();
    }
    protected void btnCrear_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grvLista.Rows)
        {
            var rbtEstado = (RadioButton)(row.FindControl("rbtEstado"));
            if (rbtEstado.Checked)
            {
                var dataKeys = grvLista.DataKeys[row.RowIndex];
                if (dataKeys != null)
                {
                    hdnAtencion.Value = dataKeys["id"].ToString();
                    lblAtencion.Text = dataKeys["id"].ToString().PadLeft(6, '0');                    
                    //ddlMedico.SelectedValue = dataKeys["IdMedico"].ToString();                    
                    EjecutarScript(updDatos, "mostrarDatos();");
                }
                break;
            }
        }
    }

    private static void EjecutarScript(Control pControl, string pScriptJs)
    {
        var sb = new StringBuilder();
        sb.Append("<script type=\"text/javascript\">");
        sb.Append(pScriptJs);
        sb.Append("</script>");
        var guidKey = Guid.NewGuid();
        ScriptManager.RegisterStartupScript(pControl, pControl.GetType(), guidKey.ToString(), sb.ToString(), false);
    }
}