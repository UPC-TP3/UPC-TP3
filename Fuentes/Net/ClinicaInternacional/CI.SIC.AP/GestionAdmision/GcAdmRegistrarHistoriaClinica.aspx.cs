using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;
public partial class GestionAdmision_GcAdmRegistrarHistoriaClinica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            pr_CargarCboTipoDocumento();
            pr_DatosPaciente();
            pr_CargarCboTipoAdmin();
            pr_CargarDetalleHC();
        }
    }

    private void pr_CargarDetalleHC()
    {
        gvDetHistoriaCli.DataSource = BL_DetHistoriaClinica.Instancia.fn_ListarDetHistoriaClinica(Convert.ToInt32(hddIDPaciente.Value));
        gvDetHistoriaCli.DataBind();
        gvDetHistoriaCli.UseAccessibleHeader = true;
        gvDetHistoriaCli.HeaderRow.TableSection = TableRowSection.TableHeader;

    }

    /// <summary>
    /// Carga los tipo de documentos
    /// </summary>
    private void pr_CargarCboTipoAdmin()
    {
        ddlTipoAdmin.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_TIPADM", "");
        ddlTipoAdmin.DataTextField = "MAS_DesCorta";
        ddlTipoAdmin.DataValueField = "MAS_CodCampo";
        ddlTipoAdmin.DataBind();
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

    private void pr_DatosPaciente() {
        var objPaciente = (BE_Paciente)Session["Paciente"];
        txtApellidoM.Text = objPaciente.ApellidoMat;
        txtNombre.Text = objPaciente.Nombres;
        txtApellidoP.Text = objPaciente.ApellidoPat;
        txtNroDocumento.Text = objPaciente.dni_paciente;
        txtDireccionN.Text = objPaciente.Direccion;
        txtFechaNac.Text = objPaciente.FechaNacimiento.ToString();
        ddlSexo.SelectedValue = objPaciente.ID_Sexo.ToString();
        ddlTipoDocumentoN.SelectedValue = objPaciente.ID_TipoDocumento.ToString();
        hddIDPaciente.Value = objPaciente.ID_Paciente.ToString();
    }


    protected void ddlAlergias_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAlergias.SelectedValue.ToString() == "1")
        {
            txtAlergias.ReadOnly = false;
        }
        else
        {
            txtAlergias.ReadOnly = true;
            txtAlergias.Text = "";
        }
    }
    protected void ddlInterv_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInterv.SelectedValue.ToString() == "1")
        {
            txtInterv.ReadOnly = false;
        }
        else
        {
            txtInterv.ReadOnly = true;
            txtInterv.Text = "";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> objValores = new Dictionary<string, object>();
        objValores.Add("Alergias", txtAlergias.Text);
        objValores.Add("Intervencion", txtInterv.Text);
        objValores.Add("TipoAdmision", ddlTipoAdmin.SelectedValue);
        objValores.Add("GrupoSanguineo", ddlGrupo.SelectedValue);
        objValores.Add("IDPaciente", hddIDPaciente.Value.ToString());

        string vmensaje = "";
        BL_HistoriaClinica.Instancia.fn_RegistrarHC(objValores, ref vmensaje);
        ClientScript.RegisterStartupScript(GetType(), "MostrarMensaje", "fnMensaje('" + vmensaje + "');", true);

    }
}