using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class EmergenciasActualizarEstadoCama : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnActualizar.Attributes.Add("onClick", "javascript:return confirm('¿Estás seguro de actualizar los estados?')");

            Session["Enfermero"] = "Juan Perez Castro";
            CargaGrid();
        }
    }
    protected void grvLista_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var idCama = 0;
            var dataKeys = grvLista.DataKeys[e.Row.RowIndex];
            if (dataKeys != null)
                idCama = Convert.ToInt32(dataKeys["ID_Cama"].ToString());

            var cama = (CamaBE)(e.Row.DataItem);
            var ddlEstado = (DropDownList)(e.Row.FindControl("ddlEstado"));
            ddlEstado.Items.Add(new ListItem { Value = "1", Text = "Disponible" });
            ddlEstado.Items.Add(new ListItem { Value = "2", Text = "No Disponible" });           
            ddlEstado.SelectedValue = cama.GA_Estado;
            var downList = (DropDownList)(e.Row.FindControl("ddlEstado_"));
            downList.Items.Add(new ListItem { Value = "1", Text = "Disponible" });
            downList.Items.Add(new ListItem { Value = "2", Text = "No Disponible" });
            downList.Enabled = false;
            downList.SelectedValue = cama.GA_Estado;

            var ddlTipoCama = (DropDownList)(e.Row.FindControl("ddlTipoCama"));
            ddlTipoCama.Items.Add(new ListItem { Value = "1", Text = "Fija" });
            ddlTipoCama.Items.Add(new ListItem { Value = "2", Text = "Mecánica" });
            ddlTipoCama.Items.Add(new ListItem { Value = "3", Text = "Eléctrica" });
            ddlTipoCama.Enabled = false;
            ddlTipoCama.SelectedValue = cama.GA_TipoCama;

            var grvHistoria = (GridView)(e.Row.FindControl("grvHistoria"));
            grvHistoria.DataSource = new CamaBL().ListarHistoria( idCama);
            grvHistoria.DataBind();
        }
    }
    protected void btnActualizar_Click(object sender, EventArgs e)
    {
        var camas = new List<CamaBE>();
        foreach (GridViewRow row in grvLista.Rows)
        {            
            var ddlEstado = (DropDownList)(row.FindControl("ddlEstado"));            
            var downList = (DropDownList)(row.FindControl("ddlEstado_"));
            var txtObservacion = (TextBox)(row.FindControl("txtObservacion"));

            var idCama = 0;            
            var dataKeys = grvLista.DataKeys[row.RowIndex];
            if (dataKeys != null)            
                idCama = Convert.ToInt32(dataKeys["ID_Cama"].ToString());

            if (ddlEstado.SelectedValue != downList.SelectedValue)
            {
                var registro = new CamaBE
                    {
                        ID_Cama = idCama,
                        EnfermeroActualizador = Session["Enfermero"].ToString(),
                        GA_Estado = ddlEstado.SelectedValue,
                        FechaActualizacion = DateTime.Now,
                        Observacion = txtObservacion.Text
                    };
                camas.Add(registro);
            }            
        }
        if (camas.Count > 0)
        {
            new CamaBL().Actualizar(camas);
            EjecutarScript(updDatos, "alert('Confirmación de registro');");
            CargaGrid();
        }
        else
        {
            EjecutarScript(updDatos, "alert('No se encontraron cambios.');");
        }
    }

    private void CargaGrid()
    {
        grvLista.DataSource = new CamaBL().Listar();
        grvLista.DataBind();
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

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Home/Default.aspx");
    }
}