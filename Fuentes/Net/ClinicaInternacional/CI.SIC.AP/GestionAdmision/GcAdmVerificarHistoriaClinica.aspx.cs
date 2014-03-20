using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;
using EasyCallback;
public partial class GestionAdmision_GcAdmVerificarHistoriaClinica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.RegistrarScripts();
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


    /// <summary>
    /// Registra Scripts necesarios para la aplicación
    /// </summary>
    private void RegistrarScripts()
    {
        ScriptUtils.RegistrarScriptIncludes(this);
        ScriptUtils.RegistrarScriptInclude(this, "GcAdmVerificarHistoriaClinica.js", "~/GestionAdmision/GcAdmVerificarHistoriaClinica.js");
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
            if (objData["Accion"].ToString() == "1")
            {
                return JsonSerializer.ToJson(new
                {
                    Result = fn_BuscarPaciente(objData),
                    Message = "GcAdmRegistrarHistoriaClinica.aspx"
                });
            }
            return "";
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
    public bool fn_BuscarPaciente(Dictionary<string, object> p_objValues)
    {
        var objPaciente = BL_Paciente.Instancia.fn_VerificarPaciente_2(p_objValues["NroDocumento"].ToString(), Convert.ToInt32(p_objValues["TipoDocumento"].ToString()));
        if (objPaciente != null)
        {
            Session["Paciente"] = objPaciente;
            return true;
        }
        else
        {
            return false;
        }
    }
}