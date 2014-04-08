using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;
using System.Web.Services;

public partial class GestionAdmision_GcAdmEmergenciaRegistrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {           
            pDataInicial();
        }
    }
    
    public void pDataInicial() {
        //pr_CargarCboEstadoCivil();
        pr_CargarCboTipoDocumento();
        pr_CargarCboPais();
        pr_CargarCboSexo();

      string strPacienteId = Request.QueryString["PacienteId"];
      BL_Paciente oPacienteBL = new BL_Paciente();
      BE_Paciente oPacienteBE = null;

      if (strPacienteId != null) { 
       
          BL_Paciente BL_Paciente = new BL_Paciente();

          oPacienteBE = oPacienteBL.fn_ConsultarPaciente(Int32.Parse(strPacienteId), "", 0);

          if (oPacienteBE != null)
          {
              txtApellidoM.Text = oPacienteBE.ApellidoMat;
              txtApellidoP.Text = oPacienteBE.ApellidoPat;
              txtCelular.Text = oPacienteBE.Celular;
              txtDireccionN.Text =  oPacienteBE.Direccion;
              txtFechaNac.Text = oPacienteBE.FechaNacimiento.ToString("dd/MM/yyyy");
              txtNombre.Text = oPacienteBE.Nombres;
              txtNroDocumento.Text = oPacienteBE.dni_paciente;
              txtObservacion.Text = oPacienteBE.Observacion;
              txtTelefono.Text = oPacienteBE.TelefonoDomicilio;
              ddlPais.SelectedValue = oPacienteBE.ID_Pais.ToString();

              //if (oPacienteBE.ID_EstadoCivil != 0){
              //    ddlEstadoCivil.SelectedValue = oPacienteBE.ID_EstadoCivil.ToString();
              //}

              if (ddlPais.SelectedValue != "") {
                  pr_CargarCboDpto(ddlPais.SelectedValue);
                  ddlDepartamento.SelectedValue = oPacienteBE.ID_Departamento.ToString();
              }
              
              if (ddlDepartamento.SelectedValue != "")
              {
                  pr_CargarCboProv(ddlDepartamento.SelectedValue);
                  ddlProvincia.SelectedValue = oPacienteBE.ID_Provincia.ToString();
              }

              if (ddlProvincia.SelectedValue != "")
              {
                  pr_CargarCboDist(ddlProvincia.SelectedValue);
                  ddDistrito.SelectedValue = oPacienteBE.ID_Distrito.ToString();
              }
              
              ddlSexo.SelectedValue = oPacienteBE.ID_Sexo.ToString();
              ddlTipoDocumentoN.SelectedValue = oPacienteBE.ID_TipoDocumento.ToString();

          }
      
      }
    
    }

    //private void pr_CargarCboEstadoCivil()
    //{
    //    ddlEstadoCivil.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("50", "");
    //    ddlEstadoCivil.DataTextField = "MAS_DesCorta";
    //    ddlEstadoCivil.DataValueField = "MAS_CodCampo";
    //    ddlEstadoCivil.DataBind();
    //}


        /// <summary>
        /// Carga los tipo de documentos
        /// </summary>
        private void pr_CargarCboTipoDocumento()
        {
            ddlTipoDocumentoN.DataSource = BL_TipoDocumento.Instancia.fn_ListarTipoDocumento();
            ddlTipoDocumentoN.DataTextField = "Descripcion";
            ddlTipoDocumentoN.DataValueField = "Codigo";
            ddlTipoDocumentoN.DataBind();
        }

        //private void pr_CargarCboEstadoCivil()
        //{
        //    ddlEstadoCivil.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("50", "");
        //    ddlEstadoCivil.DataTextField = "MAS_DesCorta";
        //    ddlEstadoCivil.DataValueField = "MAS_CodCampo";
        //    ddlEstadoCivil.DataBind();
        //}
        private void pr_CargarCboSexo()
        {
            ddlSexo.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("20", "");
            ddlSexo.DataTextField = "MAS_DesCorta";
            ddlSexo.DataValueField = "MAS_CodCampo";
            ddlSexo.DataBind();
        }


        /// <summary>
        /// Carga los tipo de documentos
        /// </summary>
        private void pr_CargarCboPais()
        {
            ddlPais.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("80", "");
            ddlPais.DataTextField = "MAS_DesCorta";
            ddlPais.DataValueField = "MAS_CodCampo";
            ddlPais.DataBind();
        }

        private void pr_CargarCboDpto(string p_Valor)
        {
            ddlDepartamento.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("90", p_Valor);
            ddlDepartamento.DataTextField = "MAS_DesCorta";
            ddlDepartamento.DataValueField = "MAS_CodCampo";
            ddlDepartamento.DataBind();
        }

        private void pr_CargarCboProv(string p_Valor)
        {
            ddlProvincia.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("100", p_Valor);
            ddlProvincia.DataTextField = "MAS_DesCorta";
            ddlProvincia.DataValueField = "MAS_CodCampo";
            ddlProvincia.DataBind();
        }

        private void pr_CargarCboDist(string p_Valor)
        {
            ddDistrito.DataSource = BL_MaestroTablas.Instancia.fn_ListarUbiGEO("110", p_Valor);
            ddDistrito.DataTextField = "MAS_DesCorta";
            ddDistrito.DataValueField = "MAS_CodCampo";
            ddDistrito.DataBind();
        }

       
        //public void pr_CargarCboDepartamento(string p_Valor)
        //{
        //     BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_DPTO", p_Valor);

        //}


        //public void pr_CargarCboProvincia(string p_Valor)
        //{
        //     BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_PROVIN", p_Valor);
           
        //}


        //public void pr_CargarCboDistrito(string p_Valor)
        //{
        //     BL_MaestroTablas.Instancia.fn_ListarUbiGEO("TB_DIST", p_Valor);

        //}


        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            string strPacienteId = Request.QueryString["PacienteId"];
            string[] arrFechaOrden = null;
            char[] delimiterChars = { '/' };

            arrFechaOrden = txtFechaNac.Text.Split(delimiterChars);

            DateTime dFechaNac = new DateTime(Int32.Parse(arrFechaOrden[2]), Int32.Parse(arrFechaOrden[1]), Int32.Parse(arrFechaOrden[0]));
            
            Dictionary<string, object> objValores = new Dictionary<string, object>();
            objValores.Add("DNI", txtNroDocumento.Text);
            objValores.Add("TipoDoc", ddlTipoDocumentoN.SelectedValue);
            objValores.Add("Nombre", txtNombre.Text);
            objValores.Add("ApellidoP", txtApellidoP.Text);
            objValores.Add("ApellidoM", txtApellidoM.Text);
            objValores.Add("Telefono", txtTelefono.Text);
            objValores.Add("Celular", txtCelular.Text);
            objValores.Add("Direccion", txtDireccionN.Text);
            objValores.Add("Sexo", ddlSexo.SelectedValue);
            objValores.Add("FechaNac", dFechaNac);
            objValores.Add("Pais", ddlPais.SelectedValue);
            objValores.Add("Departamento", ddlDepartamento.SelectedValue);
            objValores.Add("Provincia", ddlProvincia.SelectedValue);
            objValores.Add("Distrito", ddDistrito.SelectedValue);
            objValores.Add("Observacion", txtObservacion.Text);
            objValores.Add("Observacion", txtObservacion.Text);
            string vmensaje = "";

            if (strPacienteId == null)
            {
                BL_Paciente.Instancia.fn_RegistrarPaciente(objValores, ref vmensaje);
            }
            else {
                BE_Paciente objPacienteBE = new BE_Paciente();
                objPacienteBE.ID_Paciente = Int32.Parse(strPacienteId);
                objPacienteBE.dni_paciente = txtNroDocumento.Text.Trim();
                objPacienteBE.Nombres= txtNombre.Text.Trim();
                objPacienteBE.ApellidoPat= txtApellidoP.Text.Trim();
                objPacienteBE.ApellidoMat = txtApellidoM.Text.Trim();      
                objPacienteBE.FechaNacimiento= dFechaNac;
                objPacienteBE.Celular= txtCelular.Text.Trim();
                objPacienteBE.TelefonoDomicilio= txtTelefono.Text.Trim();
                objPacienteBE.Direccion= txtDireccionN.Text.Trim();
                objPacienteBE.ID_Sexo= Int32.Parse(ddlSexo.SelectedValue);
                objPacienteBE.ID_TipoDocumento = Int32.Parse(ddlTipoDocumentoN.SelectedValue) ;
                objPacienteBE.ID_Pais = Int32.Parse(ddlPais.SelectedValue);
                objPacienteBE.ID_Departamento = Int32.Parse(ddlDepartamento.SelectedValue);
                objPacienteBE.ID_Provincia = Int32.Parse(ddlProvincia.SelectedValue);
                objPacienteBE.ID_Distrito = Int32.Parse(ddDistrito.SelectedValue);
                objPacienteBE.Observacion = txtObservacion.Text.Trim();

                //if (ddlEstadoCivil.SelectedValue != "") {
                //    objPacienteBE.ID_EstadoCivil = Int32.Parse(ddlEstadoCivil.SelectedValue);
                //}                              
                
                BL_Paciente.Instancia.fn_ActualizarPaciente(objPacienteBE);

                vmensaje = "El paciente se actualizó correctamente.";
            }
            

            ClientScript.RegisterStartupScript(GetType(), "MostrarMensaje", "fnMensaje('" + vmensaje + "');", true);

        }
        protected void ddlPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPais.SelectedValue != "")
            {
                pr_CargarCboDpto(ddlPais.SelectedValue);
            }
            else {
                ddlDepartamento.Items.Clear();
            }
        }
        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartamento.SelectedValue != "")
            {
                pr_CargarCboProv(ddlDepartamento.SelectedValue);
            }
            else
            {
                ddlProvincia.Items.Clear();
            }
        }
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProvincia.SelectedValue != "")
            {
                pr_CargarCboDist(ddlProvincia.SelectedValue);
            }
            else
            {
                ddDistrito.Items.Clear();
            }
        }
}