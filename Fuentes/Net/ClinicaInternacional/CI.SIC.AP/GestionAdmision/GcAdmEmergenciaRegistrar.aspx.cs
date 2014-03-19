using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;
using System.Web.Services;

public partial class GestionAdmision_GcAdmEmergenciaRegistrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            pr_CargarCboTipoDocumento();
            pr_CargarCboPais();

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


        /// <summary>
        /// Carga los tipo de documentos
        /// </summary>
        private void pr_CargarCboPais()
        {
            ddlPais.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_PAIS", "");
            ddlPais.DataTextField = "MAS_DesCorta";
            ddlPais.DataValueField = "MAS_CodCampo";
            ddlPais.DataBind();
        }

        [WebMethod]
        public static List<BE_MaestroTabla> pr_CargarCboDepartamento(string p_Valor)
        {
            return BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_DPTO", p_Valor);

        }

        [WebMethod]
        public static List<BE_MaestroTabla> pr_CargarCboProvincia(string p_Valor)
        {
            return BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_PROVIN", p_Valor);
           
        }


        [WebMethod]
        public static List<BE_MaestroTabla> pr_CargarCboDistrito(string p_Valor)
        {
            return BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_DIST", p_Valor);

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
            objValores.Add("Pais", ddlPais.SelectedValue);
            objValores.Add("Departamento", ddlDepartamento.SelectedValue);
            objValores.Add("Provincia", ddlProvincia.SelectedValue);
            objValores.Add("Distrito", ddDistrito.SelectedValue);
            string vmensaje = "";
            BL_Paciente.Instancia.fn_RegistrarPaciente(objValores, ref vmensaje);
            ClientScript.RegisterStartupScript(GetType(), "MostrarMensaje", "fnMensaje('" + vmensaje + "');", true);

        }
}