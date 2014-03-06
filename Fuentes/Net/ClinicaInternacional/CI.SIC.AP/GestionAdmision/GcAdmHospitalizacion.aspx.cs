using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class GestionAdmision_GcAdmHospitalizacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargaInicial();
        }
    }

    public void CargaInicial()
    {
        int cod =0;
        List<CamaBE> _lista = IngresoHospitalizacion.Instancia.ListarCamas(cod);

        ddlCama.DataSource = _lista.ToList();
        ddlCama.DataMember = "ID_Cama";
        ddlCama.DataValueField = "GA_NroCama";
        ddlCama.DataBind();
    }
    protected void btnGetOrden_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtNroOrdenHosp.Text != "")
            {
                int codOrden = Convert.ToInt32(txtNroOrdenHosp.Text.ToString());

                OrdenHospitalizacionBE oOrden = OrdenHospitalizacionBL.Instancia.getOrdeByCodigo(codOrden);

                if (oOrden != null)
                {
                    txtFecOrden.Text = oOrden.GA_FechaOrden.ToString();
                    ddlProcedencia.SelectedValue = oOrden.GA_Procedencia.ToString();
                    ddlMotivo.SelectedValue = oOrden.ID_Motivo_Hospitalizacion.ToString();
                    txtPrevision.Text = oOrden.GA_Prevision.ToString();
                    txtIntervencion.Text = oOrden.FechaHora.ToString();
                    txtNroDiasHosp.Text = oOrden.GA_NroDiasHospitalizacion.ToString();
                    txtMedTratante.Text = oOrden.GA_MedicoTratante.ToString();
                    ddlExamen.SelectedValue = oOrden.GA_ExamenesPreOperatorios.ToString();
                    txtIndicacion.Text = oOrden.GA_Tratamiento.ToString();

                    if (oOrden.ID_Paciente != 0)
                    {
                        hdfIDPaciente.Value = oOrden.ID_Paciente.ToString();
                        PacienteBE oPaciente = PacienteBL.Instancia.GetPacienteXIdPaciente(oOrden.ID_Paciente, "");

                        if (oPaciente != null)
                        {

                            ddlTipoDoc.SelectedValue = oPaciente.ID_TipoDocumento.ToString();
                            txtNroDoc.Text = oPaciente.GA_DocumentoIdentidad.ToString();
                            txtNombre.Text = oPaciente.GA_Nombre.ToString();
                            txtApPat.Text = oPaciente.ApellidoPat.ToString();
                            txtApMat.Text = oPaciente.ApellidoMat.ToString();
                            ddlSexo.SelectedValue = oPaciente.GA_Sexo.ToString();
                            txtTelefono.Text = oPaciente.GA_Celular;
                            txtCorreo.Text = oPaciente.correo;
                            txtFecNac.Text = oPaciente.GA_FechaNacimiento.ToString();
                            txtDireccion.Text = oPaciente.GA_Direccion.ToString();
                            txtCorreo.Text = oPaciente.correo.ToString();

                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + Constantes.Mensajes.msgOrdenInternamientoNull + "');", true);
                }
            }
        }
        catch (Exception ex)
        {
            throw;
        }
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        IngresoHospitalizacionBE _bean = new IngresoHospitalizacionBE();

        _bean.GA_FechaIngreso = DateTime.Today;
        _bean.GA_HoraIngreso = DateTime.Today;
        _bean.GA_TipoOrden = "";
        _bean.GA_Tratamiento = "";
        _bean.GA_ViaIngreso = ddlProcedencia.SelectedValue;
        _bean.ID_Paciente = Convert.ToInt32( hdfIDPaciente.Value);
        _bean.GA_CartaGarantia = Convert.ToInt32( txtCartaGarantia.Text);

        IngresoHospitalizacion obj = new IngresoHospitalizacion();

        var resul = obj.insertIngresoHosp(_bean);

        if (resul)
             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + "Se registro la operacion" + "');", true);
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + "No se registro la operacion" + "');", true);

    }
}