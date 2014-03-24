using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;
public partial class GcAdmConsultarPaciente : System.Web.UI.Page
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
   
    /// <summary>
    /// Carga los tipo de documentos
    /// </summary>
    private void pr_CargarCboTipoDocumento()
    {

        List<BE_TipoDocumento> lBE_TipoDocumento = null;

        lBE_TipoDocumento = BL_TipoDocumento.Instancia.fn_ListarTipoDocumento();

        ddlTipoDoc.DataSource = lBE_TipoDocumento;
        ddlTipoDoc.DataTextField = "Descripcion";
        ddlTipoDoc.DataValueField = "Codigo";
        ddlTipoDoc.DataBind();

        ListItem li = new ListItem();

        li.Value = "999";
        li.Text = "Anónimo";

        ddlTipoDoc.Items.Insert(1, li);

        
    }

    private void pr_DatosPaciente() {
      BE_Paciente oBE_Paciente = new BE_Paciente();
      BL_Paciente oBL_Paciente = new BL_Paciente();

         oBE_Paciente.ID_Paciente = 0;
         oBE_Paciente.dni_paciente = txtNroDoc.Text.Trim();

         if (ddlTipoDoc.SelectedIndex != 0) {
             oBE_Paciente.ID_TipoDocumento = Int32.Parse(ddlTipoDoc.SelectedValue);
         }       

         oBE_Paciente.Observacion = "";
         oBE_Paciente.Nombres = txtNombre.Text.Trim();
         oBE_Paciente.ApellidoPat = txtApPat.Text.Trim();
         oBE_Paciente.ApellidoMat = txtApMat.Text.Trim();


         gvPaciente.DataSource = oBL_Paciente.fn_ListarPaciente(oBE_Paciente);
         gvPaciente.DataBind();

    }
       
   
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        pr_DatosPaciente();
    }
    protected void gvPaciente_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow) {

            BE_Paciente oBE_Paciente =  (BE_Paciente)e.Row.DataItem;

            e.Row.Attributes.Add("ondblClick", "javascript:window.location.href='GcAdmEmergenciaRegistrar.aspx?PacienteId=" + oBE_Paciente.ID_Paciente.ToString() + "';");

        }
    }
}