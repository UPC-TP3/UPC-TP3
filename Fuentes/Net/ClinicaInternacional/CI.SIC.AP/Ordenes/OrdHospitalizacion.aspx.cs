using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class Ordenes_OrdHospitalizacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargaInicial();
            cargarValoresBusqueda(0);
            LoadData(0);
        }
    }


    public void CargaInicial()
    {
        //------------MAESTRO-------
        List<BE_MaestroTabla> lstTipo = BL_MaestroTablas.Instancia.GetDatatabla(Constantes.CodTablaTipoDOC);
        lstTipo.Insert(0, new BE_MaestroTabla() { MAS_CodCampo = "0", MAS_DesCorta = "----------" });
        ddlTipoDoc.DataSource = lstTipo;
        ddlTipoDoc.DataMember = "MAS_CodCampo";
        ddlTipoDoc.DataValueField = "MAS_DesCorta";
        ddlTipoDoc.DataBind();
        ddlTipoDoc.SelectedValue = "0";

        List<BE_MaestroTabla> lstSexo = BL_MaestroTablas.Instancia.GetDatatabla(Constantes.CodTablaSexo);
        lstSexo.Insert(0, new BE_MaestroTabla() { MAS_CodCampo = "0", MAS_DesCorta = "----------" });
        ddlSexo.DataSource = lstSexo;
        ddlSexo.DataMember = "MAS_CodCampo";
        ddlSexo.DataValueField = "MAS_DesCorta";
        ddlSexo.DataBind();

        List<BE_Sede> lstSedeOrden = BL_MaestroTablas.Instancia.GetSedes();
        lstSedeOrden.Insert(0, new BE_Sede() { ID_Local = 0, nombre = "----------" });
        ddlSede.DataSource = lstSedeOrden;
        ddlSede.DataMember = "ID_Local";
        ddlSede.DataValueField = "nombre";
        ddlSede.DataBind();

        List<BE_MotivoHospita> lstMotivo = BL_MaestroTablas.Instancia.GetMotivosHospitaliza();
        lstMotivo.Insert(0, new BE_MotivoHospita() { ID_Motivo_Hospitalizacion = 0, DescripcionInternamiento = "----------" });
        ddlMotivo.DataSource = lstMotivo;
        ddlMotivo.DataMember = "ID_Motivo_Hospitalizacion";
        ddlMotivo.DataValueField = "DescripcionInternamiento";
        ddlMotivo.DataBind();

        List<BE_MaestroTabla> lstProcedencia = BL_MaestroTablas.Instancia.GetDatatabla(Constantes.CodTablaProcedencia);
        lstProcedencia.Insert(0, new BE_MaestroTabla() { MAS_CodCampo = "0", MAS_DesCorta = "--Seleccionar--" });
        ddlProcedencia.DataSource = lstProcedencia;
        ddlProcedencia.DataMember = "MAS_CodCampo";
        ddlProcedencia.DataValueField = "MAS_DesCorta";
        ddlProcedencia.DataBind();

        //-----------------MEDICOS------------------
        List<BE_Medico> lstMed1 = BL_Medico.Instancia.GetMedico(); ;
        lstMed1.Insert(0, new BE_Medico() { ID_Medico = 0, nom_medico = "----------" });
        ddlMedTratante.DataSource = lstMed1;
        ddlMedTratante.DataMember = "ID_Medico";
        ddlMedTratante.DataValueField = "nom_medico";
        ddlMedTratante.DataBind();

        List<BE_Medico> lstMed2 = BL_Medico.Instancia.GetMedico(); ;
        lstMed2.Insert(0, new BE_Medico() { ID_Medico = 0, nom_medico = "----------" });
        ddlMedTurno.DataSource = lstMed2;// BL_Medico.Instancia.GetMedico();
        ddlMedTurno.DataMember = "ID_Medico";
        ddlMedTurno.DataValueField = "nom_medico";
        ddlMedTurno.DataBind();
        //-----------------MEDICOS------------------


    }
    static public Boolean IsFecha(string cadenaFecha)
    {
        CultureInfo es = new CultureInfo("es-ES");
        DateTime fechaTemp;

        return DateTime.TryParseExact(cadenaFecha, "dd/MM/yyyy", es, DateTimeStyles.AdjustToUniversal, out fechaTemp);
    }

    private Boolean cargarValoresBusqueda(int inicio)
    {

        var fechaInicio = txtFechaInicio.Text.Trim();
        var fechaFin = txtFechaFin.Text.Trim();

        Boolean resp = true;
        Boolean validaFecMenor = false;
        DateTime fechaRI = new DateTime();
        DateTime fechaRF = new DateTime();


        if (fechaInicio != string.Empty && fechaFin != string.Empty)
        {
            fechaRI = DateTime.Parse(fechaInicio);
            fechaRF = DateTime.Parse(fechaFin);
            validaFecMenor = true;
        }
        else
        {
            if (inicio == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "filtro", "alert('Ingresar rango de fechas.');", true);
                return false;
            }
           
        }

        if (inicio == 1)
        {
            if (!IsFecha(fechaInicio) && fechaInicio != string.Empty)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "filtro", "alert('La Fecha de Inicio ingresada no es válida.');", true);
                resp = false;
            }
            else
            {
                resp = true;
            }

            if (!IsFecha(fechaFin) && fechaFin != string.Empty)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "filtro", "alert('La Fecha de Fin ingresada no es válida.');", true);
                resp = false;
            }
            else
            {
                resp = true;
            }
            if (validaFecMenor == true)
            {
                if (fechaRF < fechaRI)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "filtro", "alert('La Fecha de Fin no puede ser menor que la Fecha de Inicio.');", true);
                    resp = false;
                }
            }
            if (fechaInicio != string.Empty && fechaFin == string.Empty)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "filtro", "alert('Debe ingresar también la Fecha de Fin.');", true);
                resp = false;
            }
            else if (fechaInicio == string.Empty && fechaFin != string.Empty)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "filtro", "alert('Debe ingresar también la Fecha de Inicio.');", true);
                resp = false;
            }
            else if (fechaInicio == string.Empty && fechaFin == string.Empty)
            {
                resp = true;
            }
        }

        Session["ValoresBusqueda"] = fechaInicio + "-" + fechaFin;

        return resp;
    }

    protected void imgBtnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        if (cargarValoresBusqueda(1) == true)
        {
            LoadData(1);
        }
    }

    protected void gvOrdenes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrdenes.PageIndex = e.NewPageIndex;
        LoadData(1);
    }

    protected void LoadData(int inicio)
    {
        string[] valoresBusqueda = Convert.ToString(Session["ValoresBusqueda"]).Split('-');
        string fechaInicio = string.IsNullOrEmpty(valoresBusqueda[0]) ? null : "" + valoresBusqueda[0];
        string fechaFin = string.IsNullOrEmpty(valoresBusqueda[1]) ? null : "" + valoresBusqueda[1];

        try
        {
            if (inicio == 1)
            {
                var lstOrdenes = BL_Hospitalizacion.Instancia.getOrdenes(fechaInicio, fechaFin);

                if (lstOrdenes.Count() > 0)
                {
                    gvOrdenes.DataSource = lstOrdenes;
                    gvOrdenes.DataBind();
                }
            }

        }
        catch (Exception)
        {
            throw;
        }

    }

    protected void btnGetOrden_Click(object sender, EventArgs e)
    {
        try
        {
            var doc = txtNroDoc.Text.Trim();
            var tipoDoc = ddlTipoDoc.SelectedIndex;

            if (tipoDoc == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Orden", "alert('Seleccionar Tipo de Documento');", true);
                return;
            }
            if(doc == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Orden", "alert('Ingresar Nro de Documento');", true);
                return;
            }
            

            BE_Paciente oPaciente = BL_Paciente.Instancia.fn_ConsultarPaciente(0, txtNroDoc.Text.Trim(), 0);

            if (oPaciente != null)
            {
                hdfIDPaciente.Value = oPaciente.ID_Paciente.ToString();
                ddlTipoDoc.SelectedIndex = oPaciente.ID_TipoDocumento;
                txtNroDoc.Text = oPaciente.dni_paciente.ToString();
                txtNombres.Text = oPaciente.Nombres.ToString();
                txtPaterno.Text = oPaciente.ApellidoPat.ToString();
                txtMaterno.Text = oPaciente.ApellidoMat.ToString();
                ddlSexo.SelectedIndex = oPaciente.ID_Sexo;
            }
        }
        catch (Exception)
        {
            throw;
        }
    }


    protected void ibguardar_Click(object sender, EventArgs e)
    {
        try
        {
            BE_OrdenHospitaliza oOrden = new BE_OrdenHospitaliza();

            oOrden.Prevision = txtPrevision.Text.Trim();
            oOrden.NroDiasHospitalizacion = Convert.ToInt32(txtNroDias.Text.Trim());
            oOrden.ExamenesPreOperatorios = txtExaPreOpera.Text.Trim();
            oOrden.ID_MedicoTratante = ddlMedTratante.SelectedIndex;
            oOrden.ID_MedicoTurno = ddlMedTurno.SelectedIndex;
            oOrden.ID_Paciente = Convert.ToInt32(hdfIDPaciente.Value);
            oOrden.FechaHora = Convert.ToDateTime(txtFecha.Text.Trim());
            oOrden.ID_Motivo_Hospitalizacion = ddlMotivo.SelectedIndex;
            oOrden.ID_Consulta = Convert.ToInt32(txtIdConsulta.Text.Trim());
            oOrden.ID_Local = ddlSede.SelectedIndex;


            var resul = BL_Hospitalizacion.Instancia.insertOrdenHospital(oOrden);

            if (resul)
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Orden", "alert('Se registro la orden exitosamente.');hideModalPopup('bmpRegAct');", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "Orden", "alert('No se realizo el registro de la Orden.');hideModalPopup('bmpRegAct');", true);

            //imgBtnBuscar_Click(null, null);

        }
        catch (Exception)
        {
            throw;
        }
    }
}