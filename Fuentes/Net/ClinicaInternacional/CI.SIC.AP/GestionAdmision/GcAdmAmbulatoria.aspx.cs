using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class GcAdmAmbulatoria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack) {
            pDatoInicial();          
        
        }
    }

    public void pDatoInicial(){
        BL_Paciente oPacienteBL = new BL_Paciente();
        BE_Paciente oPacienteBE = null;

      int IdPaciente = Int32.Parse(Request.QueryString["id"]);

      oPacienteBE = oPacienteBL.fn_ConsultarPaciente(IdPaciente, "", 0);

            if (oPacienteBE != null) {
                txtNombre.Text = oPacienteBE.Nombres;
                txtApMat.Text = oPacienteBE.ApellidoMat;
                txtApPat.Text = oPacienteBE.ApellidoPat;
                txtCorreo.Text = oPacienteBE.correo;
                txtFecNac.Text = oPacienteBE.FechaNacimiento.ToString();
                txtNroDoc.Text = oPacienteBE.dni_paciente;
                txtSexo.Text = oPacienteBE.SexoDescripcion;
                txtTelefono.Text = oPacienteBE.TelefonoDomicilio;
                txtTipoDocumento.Text = oPacienteBE.TipoDocumentoNombre;
                           
            }
    }

    protected void btnComprobantePago_Click(object sender, EventArgs e)
    {
        BL_Paciente oPacienteBL = new BL_Paciente();
        BE_Comprobante_Pago oComprobante_PagoBE = new BE_Comprobante_Pago();
        BL_Comprobante_Pago oComprobante_PagoBL = new BL_Comprobante_Pago();

        int IdCita = Int32.Parse(Request.QueryString["Cita"]);
        int ActivarCita = 3;

        Boolean blnActualizar = oPacienteBL.fb_ActualizarEstadoCita(IdCita, ActivarCita);

        if (blnActualizar)
        {
            oComprobante_PagoBE.FechaComprobante= DateTime.Now;
            oComprobante_PagoBE.TipoComprobante="Carnet";
            oComprobante_PagoBE.FormaDePago="";
            oComprobante_PagoBE.MontoComprobante =  decimal.Parse(txtMontoPagar.Text);
            oComprobante_PagoBE.ConceptoDePago= txtCobertura.Text;
                      

            oComprobante_PagoBE.ID_Cita = IdCita;

            if (oComprobante_PagoBL.Nuevo(oComprobante_PagoBE)) {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertaCita", "alert('Se ha grabado la Cita');", true);
            }
        }
    }
}