using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class GcAdmOrdenProcedimiento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack) {
            pDatoInicial();          
        
        }
    }

    public void pDatoInicial(){
        //Tipo Documento
        BL_TipoDocumento oTipoDocumentoBL = new BL_TipoDocumento();
        List<BE_TipoDocumento> lTipoDocumentoBE = null;

        lTipoDocumentoBE = oTipoDocumentoBL.fn_ListarTipoDocumento();

        ddlTipoDocumento.DataSource = lTipoDocumentoBE;
        ddlTipoDocumento.DataBind();

        //Especialidad
        BL_Especialidad oBL_Especialidad = new BL_Especialidad();
        List<BE_Especialidad> lBE_Especialidad = null;

        lBE_Especialidad = oBL_Especialidad.GetEspecialidad();

        ddlEspecialidad.DataSource = lBE_Especialidad;
        ddlEspecialidad.DataBind();
    }

    
    protected void btnGetOrden_Click(object sender, EventArgs e)
    {
        BL_Paciente oPacienteBL = new BL_Paciente();
        BE_Paciente oPacienteBE = null;

       int intIdTipoDocumento = 0;

       intIdTipoDocumento = Int32.Parse(ddlTipoDocumento.SelectedValue);
        
       oPacienteBE = oPacienteBL.fn_ConsultarPaciente(0, txtNroDocBus.Text.Trim(), intIdTipoDocumento);

        if (oPacienteBE != null)
        {
            txtNombre.Text = oPacienteBE.Nombres;
            txtApMat.Text = oPacienteBE.ApellidoMat;
            txtApPat.Text = oPacienteBE.ApellidoPat;
            txtNroDoc.Text = oPacienteBE.dni_paciente;           
            txtTipoDocumento.Text = oPacienteBE.ID_TipoDocumento.ToString();

            hdfPacienteId.Value = oPacienteBE.ID_Paciente.ToString();
        }
    }
    protected void btnComprobantePago_Click(object sender, EventArgs e)
    {
        BL_OrdenProcedimiento oBL_OrdenProcedimiento = new BL_OrdenProcedimiento();
        BE_OrdenProcedimiento oBE_OrdenProcedimiento = new BE_OrdenProcedimiento();

        oBE_OrdenProcedimiento.ID_Orden_de_Procedimiento = 0;
        oBE_OrdenProcedimiento.NombreOrdenProcedimiento = txtDescripcion.Text.Trim();

        string[] arrFechaOrden = null;
        char[] delimiterChars = { '/' };

        arrFechaOrden = txtFechaOrdenProc.Text.Split(delimiterChars);

        DateTime dFechaOrden = new DateTime(Int32.Parse(arrFechaOrden[2]), Int32.Parse(arrFechaOrden[1]), Int32.Parse(arrFechaOrden[0]));

        oBE_OrdenProcedimiento.FechaOrdenProcedimiento = dFechaOrden;
        oBE_OrdenProcedimiento.CartaGarantia = "1";
        oBE_OrdenProcedimiento.ID_Paciente = Int32.Parse(hdfPacienteId.Value);

        int ID_Medico = 0;

        ID_Medico = Int32.Parse(ddlMedico.SelectedValue);

        oBE_OrdenProcedimiento.ID_Medico = ID_Medico;
        oBE_OrdenProcedimiento.Estado = "1";
        oBE_OrdenProcedimiento.Aseguradora = "Rimac";
     

        Boolean blnActualizar = oBL_OrdenProcedimiento.fb_InsertarOrdenProcedimiento(oBE_OrdenProcedimiento);

        if (blnActualizar){           
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertaCita", "alert('Se ha registrado una nueva Orden de Procedimiento');", true);           
        }
    }
    protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Especialidad
        BL_OrdenProcedimiento oBL_OrdenProcedimiento = new BL_OrdenProcedimiento();
        List<BE_Medico> lBE_Medico = null;

        int intEspecialidadId = 0;

        intEspecialidadId = Int32.Parse(ddlEspecialidad.SelectedValue);

        lBE_Medico = oBL_OrdenProcedimiento.fn_ListarMedioPorEspecialidad(intEspecialidadId);

        ddlMedico.DataSource = lBE_Medico;
        ddlMedico.DataBind();
    }
}