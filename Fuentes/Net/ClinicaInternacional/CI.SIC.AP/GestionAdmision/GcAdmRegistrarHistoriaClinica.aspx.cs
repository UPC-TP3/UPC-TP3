using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;
using System.Web.Services;
using EasyCallback;


public partial class GestionAdmision_GcAdmRegistrarHistoriaClinica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RegistrarScripts();
            pr_DatosPaciente();
            pr_CargarCboTipoAdmin();
            pr_CargarDetalleHC();
            pr_CargarCboGrupo();
            DateTime dt = DateTime.Today;
            txtFechaReg.Text = dt.ToShortDateString();
        }
    }

    
    /// <summary>
    /// Registra Scripts necesarios para la aplicación
    /// </summary>
    private void RegistrarScripts()
    {
        ScriptUtils.RegistrarScriptIncludes(this);
        ScriptUtils.RegistrarScriptInclude(this, "GcAdmRegistrarHistoriaClinica.js", "~/GestionAdmision/GcAdmRegistrarHistoriaClinica.js");
        ScriptUtils.RegistrarScriptBlock(this, this.ClientID + "initialize", string.Concat("var objPage = new Page('", this.ClientID, "');"), true);
    }


    /// <summary>
    /// Inicializador de JavaScript 
    /// </summary>
    /// <param name="e">Parametro de eventos</param>
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        CallbackManager.Register(fn_Paciente_Call);
    }


    public string fn_Paciente_Call(string args)
    {
        try
        {
            var objData = JsonSerializer.FromJson<Dictionary<string, object>>(args);
            string vmensaje = "";
            return JsonSerializer.ToJson(new
            {
                Result = BL_HistoriaClinica.Instancia.fn_RegistrarHC(objData, ref vmensaje),
                Message = vmensaje
            });
        }
        catch (Exception ex)
        {
            return JsonSerializer.ToJson(new
            {
                Result = false,
                Message = ex.Message.ToString()
            });
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
    private void pr_CargarCboGrupo()
    {
        ddlGrupo.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_GRSN", "");
        ddlGrupo.DataTextField = "MAS_DesCorta";
        ddlGrupo.DataValueField = "MAS_CodCampo";
        ddlGrupo.DataBind();
    }


    private void pr_DatosPaciente() {
        var objPaciente = (BE_Paciente)Session["Paciente"];
        txtApellidoM.Text = objPaciente.ApellidoMat;
        txtNombre.Text = objPaciente.Nombres;
        txtApellidoP.Text = objPaciente.ApellidoPat;
        txtNroDocumento.Text = objPaciente.dni_paciente;
        txtDireccionN.Text = objPaciente.Direccion;
        txtFechaNac.Text = objPaciente.FechaNacimiento.ToString("dd-MM-yyyy");
        txtSexo.Text = objPaciente.DescSexo.ToString();
        txtTipoDocumento.Text = objPaciente.TipoDocumento.ToString();
        hddIDPaciente.Value = objPaciente.ID_Paciente.ToString();
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> objValores = new Dictionary<string, object>();
        //objValores.Add("Alergias", txtAlergias.Text);
        objValores.Add("Intervencion", txtInterv.Text);
        objValores.Add("TipoAdmision", ddlTipoAdmin.SelectedValue);
        objValores.Add("GrupoSanguineo", ddlGrupo.SelectedValue);
        objValores.Add("IDPaciente", hddIDPaciente.Value.ToString());

        string vmensaje = "";
        BL_HistoriaClinica.Instancia.fn_RegistrarHC(objValores, ref vmensaje);
        
    }

    [WebMethod]
    public static List<BE_MaestroTabla> pr_CargarAlergias(string p_Valor)
    {
        return BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_ALERG", p_Valor);

    }
}