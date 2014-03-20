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

public partial class GestionAdmision_GcAdmActualizarPaciente : System.Web.UI.Page
{

    private string GetAccion
    {
        get
        {
            if (ViewState["GetAccion"] != null)
            {
                return (String)ViewState["GetAccion"];
            }

            return "";
        }
        set
        {
            ViewState["MyObject"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            pr_CargarCboSexo();
            pr_CargarCboPais();
            pr_CargarCboEstadoCivil();
            RegistrarScripts();            
            pr_DatosPaciente();

        }
    }


    private void pr_DatosPaciente()
    {

        var objPaciente = (BE_Paciente)Session["Paciente"];
        if (objPaciente.Nombres != "" && objPaciente.Nombres != null)
        {
            txtApellidoM.Text = objPaciente.ApellidoMat;
            txtNombre.Text = objPaciente.Nombres;
            txtApellidoP.Text = objPaciente.ApellidoPat;
            txtNroDocumento.Text = objPaciente.dni_paciente;
            txtDireccionN.Text = objPaciente.Direccion;
            txtFechaNac.Text = objPaciente.FechaNacimiento.ToString();
            ddlSexo.SelectedValue = objPaciente.ID_Sexo.ToString();
            hddIdTipoDoc.Value = objPaciente.ID_TipoDocumento.ToString();
            txtTipoDocumento.Text = objPaciente.TipoDocumento.ToString();
            hddIDPaciente.Value = objPaciente.ID_Paciente.ToString();
            txtCorreo.Text = objPaciente.correo;
            txtTelefono.Text = objPaciente.TelefonoDomicilio;
            txtCelular.Text = objPaciente.Celular;
            txtOcupacion.Text = objPaciente.Ocupacion;
            ddlPais.SelectedValue = objPaciente.ID_Pais.ToString();
            pr_CargarCboDpto(objPaciente.ID_Pais.ToString());
            ddlDepartamento.SelectedValue = objPaciente.ID_Departamento.ToString();
            pr_CargarCboProv(objPaciente.ID_Departamento.ToString());
            ddlProvincia.SelectedValue = objPaciente.ID_Provincia.ToString();
            pr_CargarCboDist(objPaciente.ID_Provincia.ToString());
            ddDistrito.SelectedValue = objPaciente.ID_Distrito.ToString();
            ddlEstadoCivil.SelectedValue = objPaciente.ID_EstadoCivil.ToString();
            txtApellidoM.ReadOnly = true;
            txtApellidoP.ReadOnly = true;
            txtNombre.ReadOnly = true;
            txtFechaNac.ReadOnly = true;
            btnGuardar.Text = "ACTUALIZAR";
            hddAccion.Value = "2";
        }
        else {

            hddIdTipoDoc.Value = objPaciente.ID_TipoDocumento.ToString();
            txtTipoDocumento.Text = objPaciente.TipoDocumento.ToString();
            txtNroDocumento.Text = objPaciente.dni_paciente;
            txtApellidoM.ReadOnly = false;
            txtApellidoP.ReadOnly = false;
            txtNombre.ReadOnly = false;
            txtFechaNac.ReadOnly = false;
            btnGuardar.Text = "REGISTRAR";
            hddAccion.Value = "1";

        }

    }

    /// <summary>
    /// Registra Scripts necesarios para la aplicación
    /// </summary>
    private void RegistrarScripts()
    {
        ScriptUtils.RegistrarScriptIncludes(this);
        ScriptUtils.RegistrarScriptInclude(this, "GcAdmActualizarPaciente.js", "~/GestionAdmision/GcAdmActualizarPaciente.js");
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
            if (hddAccion.Value == "1")
            { 
                string mensaje  ="";
                return JsonSerializer.ToJson(new
                {
                    Result = BL_Paciente.Instancia.fn_RegistrarPaciente_2(objData, ref mensaje),
                    Message = mensaje
                });

            }
            else if (hddAccion.Value == "2")
            {
                string mensaje = "";
                return JsonSerializer.ToJson(new
                {
                    Result = BL_Paciente.Instancia.fn_ActualizarPaciente_2(objData, ref mensaje),
                    Message = mensaje
                });
            }
            return JsonSerializer.ToJson(new
            {
                Result = false,
                Message = "ERROR: No existe Conexión con la BD."
            });
 
        }
        catch (Exception ex) {
            return JsonSerializer.ToJson(new
            {
                Result = false,
                Message = ex.Message.ToString()
            });
        }
    }





    private void pr_CargarCboPais()
    {
        ddlPais.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_PAIS", "");
        ddlPais.DataTextField = "MAS_DesCorta";
        ddlPais.DataValueField = "MAS_CodCampo";
        ddlPais.DataBind();
    }
    private void pr_CargarCboDpto(string p_Valor)
    {
        ddlDepartamento.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_DPTO", p_Valor);
        ddlDepartamento.DataTextField = "MAS_DesCorta";
        ddlDepartamento.DataValueField = "MAS_CodCampo";
        ddlDepartamento.DataBind();
    }

    private void pr_CargarCboProv(string p_Valor)
    {
        ddlProvincia.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_PROVIN", p_Valor);
        ddlProvincia.DataTextField = "MAS_DesCorta";
        ddlProvincia.DataValueField = "MAS_CodCampo";
        ddlProvincia.DataBind();
    }

    private void pr_CargarCboDist(string p_Valor)
    {
        ddDistrito.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_DIST", p_Valor);
        ddDistrito.DataTextField = "MAS_DesCorta";
        ddDistrito.DataValueField = "MAS_CodCampo";
        ddDistrito.DataBind();
    }

    private void pr_CargarCboEstadoCivil()
    {
        ddlEstadoCivil.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_ESTCIV", "");
        ddlEstadoCivil.DataTextField = "MAS_DesCorta";
        ddlEstadoCivil.DataValueField = "MAS_CodCampo";
        ddlEstadoCivil.DataBind();
    }
    private void pr_CargarCboSexo()
    {
        ddlSexo.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_SEXO", "");
        ddlSexo.DataTextField = "MAS_DesCorta";
        ddlSexo.DataValueField = "MAS_CodCampo";
        ddlSexo.DataBind();
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

}