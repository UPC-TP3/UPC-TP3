using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class GestionAdmision_GcAdmEmergencia : System.Web.UI.Page
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
            string vmensaje = "El Paciente ya se encuentra Registrado";
            ClientScript.RegisterStartupScript(GetType(), "MostrarMensaje", "fnMensaje('" + vmensaje + "');", true);
        }
        else
        {
            string vmensaje2 = "El paciente no se encuentra registrado";
            ClientScript.RegisterStartupScript(GetType(), "MostrarMensaje", "fnMensaje2('" + vmensaje2 + "');", true);
            Response.Redirect("GcAdmEmergenciaRegistrar.aspx");
        }
    }
    protected void btnRegistrarPaciente_Click(object sender, EventArgs e)
    {
       
        Dictionary<string, object> objValores = new Dictionary<string, object>();
        objValores.Add("DNI", "");
        objValores.Add("TipoDoc", 0);
        objValores.Add("Nombre", "");
        objValores.Add("ApellidoP", "");
        objValores.Add("ApellidoM", "");
        objValores.Add("Telefono","");
        objValores.Add("Celular", "");
        objValores.Add("Direccion", "");
        objValores.Add("Sexo", 0);
        objValores.Add("FechaNac", "01/01/1900");
        objValores.Add("Pais", 0);
        objValores.Add("Departamento", 0);
        objValores.Add("Provincia", 0);
        objValores.Add("Distrito", 0);
        objValores.Add("Observacion", txtObservacion.Text);
        string vmensaje = "";

        BL_Paciente.Instancia.fn_RegistrarPaciente(objValores, ref vmensaje);

        ClientScript.RegisterStartupScript(GetType(), "MostrarMensaje", "fnMensaje('" + vmensaje + "');", true);
    }
}
