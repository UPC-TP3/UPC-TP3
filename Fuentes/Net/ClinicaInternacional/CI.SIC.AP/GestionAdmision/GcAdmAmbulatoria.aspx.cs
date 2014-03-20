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
        BE_Cita oCitaBE = null;

        int IdPaciente = Int32.Parse(Request.QueryString["id"]);
        int IdCita = Int32.Parse(Request.QueryString["Cita"]);

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

        oCitaBE = oPacienteBL.fn_ObtenerCitaActiva(IdCita);

        if (oCitaBE != null)
        {
            txtFechaCita.Text = oCitaBE.FechaHoraCita != DateTime.MinValue ? oCitaBE.FechaHoraCita.ToString("dd/MM/yyyy") : "";
            txtHoraCita.Text = oCitaBE.FechaHoraCita != DateTime.MinValue ? oCitaBE.FechaHoraCita.ToString("HH:mm") : "";
            btnComprobantePago.Visible = (oCitaBE.ID_EstadoCita == 1);
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertaCita", 
                    string.Format("alert('{0}\\nNro Documento:{1}\\nNombre Paciente:{2} {3}'); window.location.href='{4}';", 
                    "Se ha grabado la Cita", 
                    txtNroDoc.Text, 
                    txtNombre.Text, 
                    txtApPat.Text,
                    Request.Url.GetLeftPart(UriPartial.Authority) + Page.ResolveUrl("~/GestionAdmision/GcAdmConsultaCita.aspx")), 
                true);
            }
        }
    }
}