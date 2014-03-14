using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class GcAdmAmbulatoria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            pDatoInicial();
        }
    }

    public void pDatoInicial() {
        BL_TipoDocumento oTipoDocumentoBL = new BL_TipoDocumento();
        List<BE_TipoDocumento> lTipoDocumentoBE = null;

        lTipoDocumentoBE = oTipoDocumentoBL.fn_ListarTipoDocumento();

        ddlTipoDoc.DataSource = lTipoDocumentoBE;
        ddlTipoDoc.DataBind();
            
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        BL_Paciente oPacienteBL = new BL_Paciente();
        BE_Paciente oPacienteBE = null;

        oPacienteBE = oPacienteBL.fn_ConsultarPaciente(0, txtNroDoc.Text.Trim(), Int32.Parse(ddlTipoDoc.SelectedValue));

        if (oPacienteBE != null)
        {

            //PacienteBL oPacienteBL = new PacienteBL();
            BE_Cita oCitaBE = null;

            oCitaBE = oPacienteBL.fn_ObtenerCitaActiva(oPacienteBE.ID_Paciente,DateTime.Now);

            if (oCitaBE != null)
            {
                Server.Transfer("GcAdmAmbulatoria.aspx?id=" + oPacienteBE.ID_Paciente.ToString() + "&Cita=" + oCitaBE.ID_Cita.ToString());
            }
            else {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertaCita", "alert('No existe una cita activa, por favor registreló como un nueva cita');", true);
            }            
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertaCliente", "alert('No existe el cliente, por favor registreló como un nuevo cliente');", true);
        }
    }
}