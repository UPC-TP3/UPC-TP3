using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using CI.SIC.BL;
using CI.SIC.BE;
using System.Globalization;

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

        //------------MAESTRO-------
        List<BE_TipoDocumento> lstTipo = BL_TipoDocumento.Instancia.fn_ListarTipoDocumento();
        lstTipo.Insert(0, new BE_TipoDocumento() { Codigo = 0, Descripcion = "----------" });
        ddlTipoDoc.DataSource = lstTipo;
        ddlTipoDoc.DataMember = "Codigo";
        ddlTipoDoc.DataValueField = "Descripcion";
        ddlTipoDoc.DataBind();

        List<BE_MaestroTabla> lstSexo = BL_MaestroTablas.Instancia.GetDatatabla(Constantes.CodTablaSexo);
        lstSexo.Insert(0, new BE_MaestroTabla() { MAS_CodCampo = "0", MAS_DesCorta = "----------" });
        ddlSexo.DataSource = lstSexo;
        ddlSexo.DataMember = "MAS_CodCampo";
        ddlSexo.DataValueField = "MAS_DesCorta";
        ddlSexo.DataBind();

        List<BE_Sede> lstSedeOrden = BL_MaestroTablas.Instancia.GetSedes();
        lstSedeOrden.Insert(0, new BE_Sede() { ID_Local = 0, nombre = "----------" });
        ddlSedeOrden.DataSource = lstSedeOrden;
        ddlSedeOrden.DataMember = "ID_Local";
        ddlSedeOrden.DataValueField = "nombre";
        ddlSedeOrden.DataBind();

        List<BE_MotivoHospita> lstMotivo = BL_MaestroTablas.Instancia.GetMotivosHospitaliza();
        lstMotivo.Insert(0, new BE_MotivoHospita() { ID_Motivo_Hospitalizacion = 0, DescripcionInternamiento = "----------" });
        ddlMotivo.DataSource = lstMotivo;
        ddlMotivo.DataMember = "ID_Motivo_Hospitalizacion";
        ddlMotivo.DataValueField = "DescripcionInternamiento";
        ddlMotivo.DataBind();

        List<BE_Sede> lstSede = BL_MaestroTablas.Instancia.GetSedes();
        lstSede.Insert(0, new BE_Sede() { ID_Local = 0, nombre = "--Seleccionar--" });
        ddlSede.DataSource = lstSede;
        ddlSede.DataMember = "ID_Local";
        ddlSede.DataValueField = "nombre";
        ddlSede.DataBind();

        List<BE_MaestroTabla> lstTipoOrden = BL_MaestroTablas.Instancia.GetDatatabla(Constantes.CodTablaTipoOrden);
        lstTipoOrden.Insert(0, new BE_MaestroTabla() { MAS_CodCampo = "0", MAS_DesCorta = "--Seleccionar--" });
        ddlTipoOrden.DataSource = lstTipoOrden;
        ddlTipoOrden.DataMember = "MAS_CodCampo";
        ddlTipoOrden.DataValueField = "MAS_DesCorta";
        ddlTipoOrden.DataBind();

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

        List<BE_Especialidad> lstEsp = BL_Especialidad.Instancia.GetEspecialidad(); ;
        lstEsp.Insert(0, new BE_Especialidad() { ID_Especialidad = 0, descripcion = "----------" });
        ddlEspecialidad.DataSource = lstEsp;// BL_Especialidad.Instancia.GetEspecialidad();
        ddlEspecialidad.DataMember = "ID_Especialidad";
        ddlEspecialidad.DataValueField = "descripcion";
        ddlEspecialidad.DataBind();

        List<BE_Cama> lstCama = BL_Cama.Instancia.ListarCamas(0);
        lstCama.Insert(0, new BE_Cama() { ID_Cama = 0, NroCama = "--Seleccionar--" });
        ddlCama.DataSource = lstCama;
        ddlCama.DataMember = "ID_Cama";
        ddlCama.DataValueField = "NroCama";
        ddlCama.DataBind();

    }
    static public Boolean IsFecha(string cadenaFecha)
    {
        CultureInfo es = new CultureInfo("es-ES");
        DateTime fechaTemp;

        return DateTime.TryParseExact(cadenaFecha, "dd/MM/yyyy HH:mm:ss", es, DateTimeStyles.AdjustToUniversal, out fechaTemp);
    }

    protected void btnGetOrden_Click(object sender, EventArgs e)
    {
        try
        {
            var EstOrden = 0;
            if (txtNroOrdenHosp.Text != "")
            {
                int codOrden = Convert.ToInt32(txtNroOrdenHosp.Text.ToString());

                BE_OrdenHospitaliza oOrden = BL_Hospitalizacion.Instancia.getOrdeByCodigo(codOrden);

                if (oOrden != null)
                {
                    EstOrden = Convert.ToInt32(oOrden.ID_Estado);
                    if (EstOrden == 1)
                    {
                        var FecProgramacion = Convert.ToDateTime(oOrden.FechaHora);
                        var oFecActual = DateTime.Now;

                        if (FecProgramacion < oFecActual)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "filtro", "alert('La Fecha y hora de programación: " + FecProgramacion + " es menor a la fecha actual, debe regularizar la fecha y hora de programación de la Orden.');", true);
                            return;
                        }

                        txtFecOrden.Text = oOrden.FechaOrden.ToString();
                        ddlMotivo.SelectedIndex = oOrden.ID_Motivo_Hospitalizacion;
                        ddlSedeOrden.SelectedIndex = oOrden.ID_Local;
                        txtPrevision.Text = oOrden.Prevision.ToString();
                        ddlSede.SelectedIndex = oOrden.ID_Local;
                        txtConsulta.Text = oOrden.ID_Consulta.ToString();
                        txtProgramada.Text = oOrden.FechaHora.ToString();
                        txtNroDiasHosp.Text = oOrden.NroDiasHospitalizacion.ToString();
                        ddlMedTratante.SelectedIndex = oOrden.ID_MedicoTratante;
                        ddlMedTurno.SelectedIndex = oOrden.ID_MedicoTurno;
                        txtIndicacion.Text = oOrden.Tratamiento.ToString();

                        if (oOrden.ID_Paciente != 0)
                        {
                            hdfIDPaciente.Value = oOrden.ID_Paciente.ToString();
                            BE_Paciente oPaciente = BL_Paciente.Instancia.GetPacienteXIdPaciente(oOrden.ID_Paciente, "");

                            if (oPaciente != null)
                            {
                                ddlTipoDoc.SelectedIndex = oPaciente.ID_TipoDocumento;
                                txtNroDoc.Text = oPaciente.dni_paciente.ToString();
                                txtNombre.Text = oPaciente.Nombres.ToString();
                                txtApPat.Text = oPaciente.ApellidoPat.ToString();
                                txtApMat.Text = oPaciente.ApellidoMat.ToString();
                                ddlSexo.SelectedIndex = oPaciente.ID_Sexo;
                                txtTelefono.Text = oPaciente.Celular;
                                txtCorreo.Text = oPaciente.correo;
                                txtFecNac.Text = oPaciente.FechaNacimiento.ToString();
                                txtDireccion.Text = oPaciente.Direccion.ToString();
                                txtCorreo.Text = oPaciente.correo.ToString();

                            }
                        }
                    }
                    if (EstOrden == 3)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + "La orden de hospitalización ya se encuentra activada" + "');LimpiarCampos();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + Constantes.Mensajes.msgOrdenInternamientoNull + "');LimpiarCampos();", true);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public bool ValidarCarta(int Carta)
    {
        var resp = true;

        BE_CartaGarantia _oCarta = BL_CartaGarantia.Instancia.GetCartaGarantiaXCodigo(Carta);       

        if (_oCarta != null)
        {
            var idCliente = _oCarta.ID_Paciente;
            var fecActual = DateTime.Now;
            if (_oCarta.FecFinVigencia < fecActual)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + "La vigencia de la Carta de Garantía se encuentra caducada" + "');", true);
                resp = false;
            }

            if (idCliente != Convert.ToInt32(hdfIDPaciente.Value))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + "La Carta de Garantía no pertenece al Paciente" + "');", true);
                resp = false;
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + "No se encuentra Carta Garantía con el código ingresado" + "');", true);
            resp = false;
        }
        return resp;
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        BE_HojaHospitaliza _bean = new BE_HojaHospitaliza();

        bool valida = true;

        if (ddlProcedencia.SelectedIndex == 1)
            if (ValidarCarta(Convert.ToInt32(txtCartaGarantia.Text.Trim())))
                valida = true;
            else
                valida = false;
        

        if (valida)
        {
            _bean.ID_Orden_Hospitalizacion = Convert.ToInt32(txtNroOrdenHosp.Text.Trim());
            _bean.FechaIngreso = Convert.ToDateTime(txtFecIngreso.Text);
            _bean.TipoOrden = ddlTipoOrden.SelectedIndex;
            _bean.ID_Procedencia = ddlProcedencia.SelectedIndex;
            _bean.ID_Local = ddlSede.SelectedIndex;
            _bean.Tratamiento = txtTratamiento.Text;
            _bean.FechaAlta = Convert.ToDateTime(txtFecAlta.Text);
            _bean.ID_Especialidad = ddlEspecialidad.SelectedIndex;
            _bean.ID_Cama = ddlCama.SelectedIndex;
            _bean.ID_Paciente = Convert.ToInt32(hdfIDPaciente.Value);
            _bean.ID_Carta = txtCartaGarantia.Text == "" ? 0 : Convert.ToInt32(txtCartaGarantia.Text);

            BL_Hospitalizacion obj = new BL_Hospitalizacion();

            var resul = obj.insertIngresoHosp(_bean);

            if (resul)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + "Se registro la operacion" + "');LimpiarCampos();", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "regis", "alert('" + "No se registro la operacion" + "');", true);
        }

    }
}