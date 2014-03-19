using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class GestionAdmision_GcAdmVerificarHistoriaClinica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            pr_CargarCboTipoDocumento();
        }
    }

    /// <summary>
    /// Carga los tipo de documentos
    /// </summary>
    private void pr_CargarCboTipoDocumento()
    {
        ddlTipoDocumento.DataSource = BL_TipoDocumento.Instancia.fn_ListarTipoDocumento();
        ddlTipoDocumento.DataTextField = "Descripcion";
        ddlTipoDocumento.DataValueField = "Codigo";
        ddlTipoDocumento.DataBind();
    }


    protected void btnVerificar_Click(object sender, EventArgs e)
    {
        var objPaciente = BL_Paciente.Instancia.fn_VerificarPaciente(txtDocumento.Text);
        if (objPaciente != null)
        {
            Session["Paciente"] = objPaciente;
            Response.Redirect("GcAdmRegistrarHistoriaClinica.aspx");
        }
        else
        {
            string vmensaje2 = "El paciente no se encuentra registrado";
            ClientScript.RegisterStartupScript(GetType(), "MostrarMensaje", "fnMensaje2('" + vmensaje2 + "');", true);
 
        }
    }
}