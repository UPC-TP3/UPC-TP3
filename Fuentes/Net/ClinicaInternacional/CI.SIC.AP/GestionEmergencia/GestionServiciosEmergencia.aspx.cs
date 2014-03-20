using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL.GestionEmergencia;

public partial class GestionEmergencia_GestionServiciosEmergencia : System.Web.UI.Page
{

    private EmergenciaBEList oEmergenciaExamenesBEList
    {
        get
        {
            if (ViewState["__ListaItems__"] == null)
                ViewState["__ListaItems__"] = new EmergenciaBEList();
            return (EmergenciaBEList)ViewState["__ListaItems__"];
        }
        set
        {
            ViewState["__ListaItems__"] = value;
        }
    }

    private EmergenciaBEList oEmergenciaMedicamentosBEList
    {
        get
        {
            if (ViewState["__ListaItems1__"] == null)
                ViewState["__ListaItems1__"] = new EmergenciaBEList();
            return (EmergenciaBEList)ViewState["__ListaItems1__"];
        }
        set
        {
            ViewState["__ListaItems1__"] = value;
        }
    }
    BE_Emergencia oBE_Emergencia;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["ordenLista"] = SortDirection.Descending;
            IniciaPagina();

        }
    }


    private void IniciaPagina() {


        ServicioEmergenciaBL oServicioEmergenciaBL = new ServicioEmergenciaBL();

        rbatencion.Checked = false;
        rbdni.Checked = false;
        rbpaciente.Checked = false;
        txtnombre.Text = string.Empty;
        txtapellido.Text = string.Empty;
        txtdni.Text = string.Empty;
        txtnroatencion.Text = string.Empty;
        txhIDMedicamento.Value = string.Empty;

        this.cboExamen.DataSource = oServicioEmergenciaBL.GeallTipoExamenMedico();
        this.cboExamen.DataTextField = "Descripcion";
        this.cboExamen.DataValueField = "ID_Tipo_Examen";
        this.cboExamen.DataBind();
        this.cboExamen.Items.Insert(0, new ListItem());
        this.cboExamen.Items[0].Text = "--Seleccione--";
        this.cboExamen.Items[0].Value = String.Empty;

        this.cbomedicamento.DataSource = oServicioEmergenciaBL.GeallMedicamento();
        this.cbomedicamento.DataTextField = "GE_NombreMedicamento";
        this.cbomedicamento.DataValueField = "ID_Medicamento";
        this.cbomedicamento.DataBind();
        this.cbomedicamento.Items.Insert(0, new ListItem());
        this.cbomedicamento.Items[0].Text = "--Seleccione--";
        this.cbomedicamento.Items[0].Value = String.Empty;

        this.oEmergenciaExamenesBEList.Add(new BE_Emergencia());
        this.grvExamen.DataSource = this.oEmergenciaExamenesBEList;
        this.grvExamen.DataBind();

        this.oEmergenciaMedicamentosBEList.Add(new BE_Emergencia());
        this.grvMedicamentos.DataSource = this.oEmergenciaMedicamentosBEList;
        this.grvMedicamentos.DataBind();
    
    }
    protected void btnbuscar_Click(object sender, EventArgs e)
    {

        try
        {
            String strTipo, strDocumento;

            if (rbdni.Checked == true) strTipo = "1";
            else if (rbpaciente.Checked == true) strTipo = "2";
            else strTipo = "3";

            strDocumento = txtcodigo.Text.Trim();

            oBE_Emergencia = new BE_Emergencia();
            ServicioEmergenciaBL oServicioEmergenciaBL = new ServicioEmergenciaBL();
            oBE_Emergencia = oServicioEmergenciaBL.GeallDatosEmergenciaId(strTipo, strDocumento);
            if (oBE_Emergencia != null) {

                txtnombre.Text = oBE_Emergencia.nombres;
                txtapellido.Text = oBE_Emergencia.apellidos;
                txtdni.Text = oBE_Emergencia.DNI_paciente;
                txtnroatencion.Text = oBE_Emergencia.ID_ATENCION.ToString();
                txhIDMedicamento.Value = oBE_Emergencia.ID_ATENCION.ToString();
                txhIdpaciente.Value = oBE_Emergencia.ID_Paciente.ToString();
                IniciaExamenes(oBE_Emergencia.ID_ATENCION);
                IniciaMedicamentos(oBE_Emergencia.ID_ATENCION);
            }
           

        }
        catch { 
        
        
        }

    }

    private void IniciaExamenes(Int32 ID)
    {

        ServicioEmergenciaBL oServicioEmergenciaBL = new ServicioEmergenciaBL();
        try
        {

            this.oEmergenciaExamenesBEList = oServicioEmergenciaBL.GeallServiciosExamenesbyId(ID);

            if (this.oEmergenciaExamenesBEList == null || this.oEmergenciaExamenesBEList.Count == 0)
            {
                this.oEmergenciaExamenesBEList.Add(new BE_Emergencia());
            }
            this.grvExamen.DataSource = this.oEmergenciaExamenesBEList;
            this.grvExamen.DataBind();


        }
        catch (Exception ex)
        {


        }


    }

    private void IniciaMedicamentos(Int32 ID)
    {

        ServicioEmergenciaBL oServicioEmergenciaBL = new ServicioEmergenciaBL();
        try
        {

            this.oEmergenciaMedicamentosBEList = oServicioEmergenciaBL.GeallServiciosMedicamentosbyId(ID);

            if (this.oEmergenciaMedicamentosBEList == null || this.oEmergenciaMedicamentosBEList.Count == 0)
            {
                this.oEmergenciaMedicamentosBEList.Add(new BE_Emergencia());
            }
            this.grvMedicamentos.DataSource = this.oEmergenciaMedicamentosBEList;
            this.grvMedicamentos.DataBind();


        }
        catch (Exception ex)
        {


        }


    }


    #region "Metodos Grilla"

    protected void grvMedicamentos_RowDataBound(Object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            BE_Emergencia itemBE = (e.Row.DataItem as BE_Emergencia);

            if (itemBE.ID_Medicamento == 0)
            {
                e.Row.Visible = false;
                return;
            }

            e.Row.Style["cursor"] = "pointer";

            TextBox txCantidad = (TextBox)e.Row.FindControl("txtCantidad");
            txCantidad.Attributes.Add("onblur", string.Format("fc_ValidaCantidad('{0}');", txCantidad.ClientID));
            //txCantidad.Attributes.Add("OnKeyPress", "return fc_ValidaSoloNumeros(event);");

        }

    }

    protected void grvMedicamentos_Sorting(Object sender, GridViewSortEventArgs e)
    {

        SortDirection indOrden = (SortDirection)ViewState["ordenLista"];

        if (this.oEmergenciaMedicamentosBEList != null && this.oEmergenciaMedicamentosBEList.Count > 1)
        {
            if (this.oEmergenciaMedicamentosBEList != null)
            {
                if (indOrden == SortDirection.Ascending)
                {
                    this.oEmergenciaMedicamentosBEList.Ordenar(e.SortExpression, CI.SIC.CC.direccionOrden.Descending);
                    ViewState["ordenLista"] = SortDirection.Descending;
                }
                else
                {
                    this.oEmergenciaMedicamentosBEList.Ordenar(e.SortExpression, CI.SIC.CC.direccionOrden.Ascending);
                    ViewState["ordenLista"] = SortDirection.Ascending;
                }
            }
            this.grvMedicamentos.DataSource = this.oEmergenciaMedicamentosBEList;
            this.grvMedicamentos.DataBind();

        }


    }

    protected void grvMedicamentos_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {

        this.grvMedicamentos.DataSource = this.oEmergenciaMedicamentosBEList;
        this.grvMedicamentos.PageIndex = e.NewPageIndex;
        this.grvMedicamentos.DataBind();

    }

    #endregion


    private void AgregarListaMedicamento(BE_Emergencia oItem, Int32 index)
    {

        if (index == -1)
            index = this.oEmergenciaMedicamentosBEList.Count - 1;

        this.oEmergenciaMedicamentosBEList.Insert(index, oItem);
        MostarListaCargadaMedicamento();
    }

    private void MostarListaCargadaMedicamento()
    {

        if (this.oEmergenciaMedicamentosBEList == null || this.oEmergenciaMedicamentosBEList.Count == 0)
        {
            this.oEmergenciaMedicamentosBEList.Add(new BE_Emergencia());
        }
        this.grvMedicamentos.DataSource = this.oEmergenciaMedicamentosBEList;
        this.grvMedicamentos.DataBind();

    }



    private void AgregarListaExamenes(BE_Emergencia oItem, Int32 index)
    {

        if (index == -1)
            index = this.oEmergenciaExamenesBEList.Count - 1;

        this.oEmergenciaExamenesBEList.Insert(index, oItem);
        MostarListaCargadaExamenes();
    }

    private void MostarListaCargadaExamenes()
    {

        if (this.oEmergenciaExamenesBEList == null || this.oEmergenciaExamenesBEList.Count == 0)
        {
            this.oEmergenciaExamenesBEList.Add(new BE_Emergencia());
        }
        this.grvExamen.DataSource = this.oEmergenciaExamenesBEList;
        this.grvExamen.DataBind();

    }

    protected void btnagregar0_Click(object sender, EventArgs e)
    {


        try
        {
            BE_Emergencia oBE_EmergenciaMed = new BE_Emergencia();
            ServicioEmergenciaBL oServicioEmergenciaBL = new ServicioEmergenciaBL();
            int Idmedicamento;
            Int32.TryParse(cbomedicamento.SelectedValue.ToString(), out Idmedicamento);
            oBE_EmergenciaMed = oServicioEmergenciaBL.GeallMedicamentoById(Idmedicamento);

            oBE_Emergencia = new BE_Emergencia();

            oBE_Emergencia.ID_Medicamento = oBE_EmergenciaMed.ID_Medicamento;
            oBE_Emergencia.GE_NombreMedicamento = oBE_EmergenciaMed.GE_NombreMedicamento;
            oBE_Emergencia.Descripcion = oBE_EmergenciaMed.Descripcion;
            oBE_Emergencia.cantidad = 0;

            AgregarListaMedicamento(oBE_Emergencia, this.oEmergenciaMedicamentosBEList.Count - 1);


        }
        catch { }
    }

    protected void grvMedicamentos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {

            this.oEmergenciaMedicamentosBEList.RemoveAt(e.RowIndex);



            MostarListaCargadaMedicamento();


        }
        catch (Exception ex)
        {

        }


    }
    protected void btnagregar_Click(object sender, EventArgs e)
    {

        try
        {
            BE_Emergencia oBE_EmergenciaExa = new BE_Emergencia();
            ServicioEmergenciaBL oServicioEmergenciaBL = new ServicioEmergenciaBL();
            int IdExamen;
            Int32.TryParse(cboExamen.SelectedValue.ToString(), out IdExamen);
            oBE_EmergenciaExa = oServicioEmergenciaBL.GeallTipoExamenById(IdExamen);

            oBE_Emergencia = new BE_Emergencia();

            oBE_Emergencia.ID_EXAMEN = oBE_EmergenciaExa.ID_Tipo_Examen;
            oBE_Emergencia.Descripcion = oBE_EmergenciaExa.Descripcion;
            oBE_Emergencia.DescripcionGeneral = oBE_EmergenciaExa.DescripcionGeneral;

            AgregarListaExamenes(oBE_Emergencia, this.oEmergenciaExamenesBEList.Count - 1);


        }
        catch { }
    }


    #region "Metodos Grilla"

    protected void grvExamen_RowDataBound(Object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            BE_Emergencia itemBE = (e.Row.DataItem as BE_Emergencia);

            if (itemBE.ID_EXAMEN == 0)
            {
                e.Row.Visible = false;
                return;
            }

            e.Row.Style["cursor"] = "pointer";

  

        }

    }

    protected void grvExamen_Sorting(Object sender, GridViewSortEventArgs e)
    {

        SortDirection indOrden = (SortDirection)ViewState["ordenLista1"];

        if (this.oEmergenciaExamenesBEList != null && this.oEmergenciaExamenesBEList.Count > 1)
        {
            if (this.oEmergenciaExamenesBEList != null)
            {
                if (indOrden == SortDirection.Ascending)
                {
                    this.oEmergenciaExamenesBEList.Ordenar(e.SortExpression, CI.SIC.CC.direccionOrden.Descending);
                    ViewState["ordenLista1"] = SortDirection.Descending;
                }
                else
                {
                    this.oEmergenciaExamenesBEList.Ordenar(e.SortExpression, CI.SIC.CC.direccionOrden.Ascending);
                    ViewState["ordenLista1"] = SortDirection.Ascending;
                }
            }
            this.grvExamen.DataSource = this.oEmergenciaExamenesBEList;
            this.grvExamen.DataBind();

        }


    }

    protected void grvExamen_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {

        this.grvExamen.DataSource = this.oEmergenciaExamenesBEList;
        this.grvExamen.PageIndex = e.NewPageIndex;
        this.grvExamen.DataBind();

    }

    protected void grvExamen_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {

            this.oEmergenciaExamenesBEList.RemoveAt(e.RowIndex);



            MostarListaCargadaExamenes();


        }
        catch (Exception ex)
        {

        }


    }
    #endregion

    protected void btngrabar_Click(object sender, EventArgs e)
    {
        Int32 ind1, ind2, ind3;
         Int32 idtencion,idPaciente;
         Int32 .TryParse (txhIDMedicamento.Value.ToString() , out idtencion);
             Int32 .TryParse (txhIdpaciente.Value.ToString() , out idPaciente);
        ServicioEmergenciaBL oServicioEmergenciaBL = new ServicioEmergenciaBL();

        ind1 = oServicioEmergenciaBL.InsertarServiciosEmergencia(idtencion, idPaciente);

        foreach (GridViewRow grd_Row in this.grvExamen.Rows)
        {
            ind2 = oServicioEmergenciaBL.InsertarExamen(idtencion, Convert.ToInt32(grd_Row.Cells[0].Text));
         
        }

        foreach (GridViewRow grd_Row1 in this.grvMedicamentos.Rows)
        {
            TextBox txtCantidad = (TextBox)(grd_Row1.FindControl("txtCantidad"));
            ind3 = oServicioEmergenciaBL.InsertarMedicamento(idtencion, Convert.ToInt32(grd_Row1.Cells[0].Text), Convert.ToInt32(txtCantidad.Text));

        }
        IniciaPagina();
        this.oEmergenciaExamenesBEList = null;
        this.oEmergenciaExamenesBEList.Add(new BE_Emergencia());
        this.grvExamen.DataSource = this.oEmergenciaExamenesBEList;
        this.grvExamen.DataBind();

        this.oEmergenciaMedicamentosBEList = null;
        this.oEmergenciaMedicamentosBEList.Add(new BE_Emergencia());
        this.grvMedicamentos.DataSource = this.oEmergenciaMedicamentosBEList;
        this.grvMedicamentos.DataBind();

    }



}