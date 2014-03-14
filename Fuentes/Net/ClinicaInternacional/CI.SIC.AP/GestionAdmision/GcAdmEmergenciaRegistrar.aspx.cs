using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class GestionAdmision_GcAdmEmergenciaRegistrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            ltlTitulo.Text = "Admisión Emergencia";
            pr_CargarCboTipoDocumento();
        }
    }

               /// <summary>
        /// Carga los tipo de documentos
        /// </summary>
        private void pr_CargarCboTipoDocumento()
        {
            ddlTipoDocumentoN.DataSource = BL_TipoDocumento.Instancia.fn_ListarTipoDocumento();
            ddlTipoDocumentoN.DataTextField = "Descripcion";
            ddlTipoDocumentoN.DataValueField = "Codigo";
            ddlTipoDocumentoN.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Dictionary<string, object> objValores = new Dictionary<string, object>();
            objValores.Add("DNI", txtNroDocumento.Text);
            objValores.Add("TipoDoc", ddlTipoDocumentoN.SelectedValue);
            objValores.Add("Nombre", txtNombre.Text);
            objValores.Add("ApellidoP", txtApellidoP.Text);
            objValores.Add("ApellidoM", txtApellidoM.Text);
            objValores.Add("Telefono", txtTelefono.Text);
            objValores.Add("Celular", txtCelular.Text);
            objValores.Add("Direccion", txtDireccionN.Text);
            objValores.Add("Sexo", ddlSexo.SelectedValue);
            objValores.Add("FechaNac", txtFechaNac.Text);
            string vmensaje = "";
            BL_Paciente.Instancia.fn_RegistrarPaciente(objValores, ref vmensaje);
            ClientScript.RegisterStartupScript(GetType(), "MostrarMensaje", "fnMensaje('" + vmensaje + "');", true);

        }
}