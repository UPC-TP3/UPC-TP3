using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;


public partial class GestionMantenimiento_ActualizarEvaSolMant : System.Web.UI.Page
{
 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //ibGuardar.Attributes.Add("onClick", "javascript:return validar();");

            if (Request.QueryString["accion"] == "Actualizar")
            {
                string cod = Request.QueryString["ns"].ToString();
                hfns.Value = cod;
                CargarRegistro(ref cod);

            }
            else
            {
                hfns.Value = "";
                txtfechacreacion.Text = DateTime.Now.ToString("ddMMyyyy");
                //txtsolicitadopor.Text = Session["Usuario"].ToString();
            }
        }
    }


    #region Custhom Methods

    public void limpiar()
    {
        //txtfechacreacion.Text = "";
        //txtsolicitadopor.Text = "";
        //txtnombrebenef.Text = "";
        //txtcentrocosto.Text = "";
        ddltiposervicio.SelectedIndex = 0;
        txtequipomedico.Text = "";
        txtfechaincidencia.Text = "";
        txtdetalleserv.Text = "";
        txtobs.Text = "";
        //txtcorreo.Text = "";
    }

    private void CargarRegistro(ref string codigo)
    {
        BE_EvaluarSolicitudMantenimiento sol = new BE_EvaluarSolicitudMantenimiento();
        BL_EvaluarSolicitudMantenimiento obj = new BL_EvaluarSolicitudMantenimiento();
        sol.Nrosolicitud = int.Parse( hfns.Value.ToString());
        var solicitud = obj.fn_BuscaESM(sol);

        //nrosolicitud = sol.Nrosolicitud;
        txtnrosolicitud.Text = sol.Nrosolicitud.ToString();
        txtfechacreacion.Text = solicitud.Fechacreacion;
        //txtsolicitadopor.Text = solicitud.CodigoSolicitante;
        //txtnombrebenef.Text = solicitud.EmpleadoBen;
        //txtcentrocosto.Text = solicitud.CodigoCC;
        ddltiposervicio.SelectedValue = solicitud.Tiposervicio;
        if (ddltiposervicio.SelectedValue == "1")
        { trem1.Visible = true; trem2.Visible = false; }
        else { trem1.Visible = false; trem2.Visible = true; }
        ddlequipomedico.SelectedValue = solicitud.Numeroequipo;
        if (ddlequipomedico.SelectedValue == "1")
        { trem1.Visible = true; trem2.Visible = false; }
        else if (ddlequipomedico.SelectedValue == "2")
        { trem1.Visible = false; trem2.Visible = true; }
        else if (ddlequipomedico.SelectedValue == "3")
        { trem1.Visible = true; trem2.Visible = false; }
        else if (ddlequipomedico.SelectedValue == "4")
        { trem1.Visible = false; trem2.Visible = true; }
        else if (ddlequipomedico.SelectedValue == "5")
        { trem1.Visible = true; trem2.Visible = false; }
        else if (ddlequipomedico.SelectedValue == "6")
        { trem1.Visible = true; trem2.Visible = false; }
        txtequipomedico.Text = solicitud.Numeroequipo;
        txtfechaincidencia.Text = solicitud.FechaIncidencia;
        txtdetalleserv.Text = solicitud.Detalleservicio;
        txtobs.Text = solicitud.Observaciones;
        //txtcorreo.Text = "upctp3@upc.edu.pe";
        

    }

    private BE_EvaluarSolicitudMantenimiento crearbjeto()
    {

        BE_EvaluarSolicitudMantenimiento sm = new BE_EvaluarSolicitudMantenimiento();
        sm.Nrosolicitud = int.Parse(txtnrosolicitud.Text);
        sm.Fechacreacion = txtfechacreacion.Text;
        //sm.CodigoSolicitante = txtsolicitadopor.Text;
        //sm.EmpleadoBen = txtnombrebenef.Text;
        //sm.CodigoCC = txtcentrocosto.Text;
        sm.Tiposervicio = ddltiposervicio.SelectedValue;
        sm.Numeroequipo = txtequipomedico.Text;
        sm.FechaIncidencia = txtfechaincidencia.Text;
        sm.Detalleservicio = txtdetalleserv.Text;
        sm.Observaciones = txtobs.Text;
        sm.Prioridad = ddlPrioridad.SelectedValue;
        if (rbtAceptado.Checked == true)
        {
            sm.Estado = 2;
        }
        else
        {
            sm.Estado = 3;
        }
        sm.Tiposervicio = ddltiposervicio.SelectedValue;
        
        return sm;

    }

    private void Modificar()
    {
        BL_EvaluarSolicitudMantenimiento obj = new BL_EvaluarSolicitudMantenimiento();
        var sm = crearbjeto();
        if (obj.fn_ActualizarESM(sm))
        {
            Mensaje("Evaluación de Solicitud de Mantenimiento actualizado correctamente");
            Response.Redirect("EvaSolMantLista.aspx", false);
        }
        
    }

    private void Mensaje(string mensaje)
    {
        ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
    }
    
    #endregion
    protected void ibRegresar_Click(object sender, EventArgs e)
    {
        Response.Redirect("EvaSolMantLista.aspx", false);
    }
    protected void ibGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            Modificar();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void ddltiposervicio_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddltiposervicio.SelectedValue == "1") 
        {
            trem1.Visible = true;
            trem2.Visible = false;
        }
        else if (ddltiposervicio.SelectedValue == "2") 
        {
            trem1.Visible = false;
            trem2.Visible = true;
        }
    }
    protected void ddlequipomedico_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlequipomedico.SelectedValue == "1")
        {
            trem1.Visible = true;
            trem2.Visible = false;
        }
        else if (ddlequipomedico.SelectedValue == "2")
        {
            trem1.Visible = false;
            trem2.Visible = true;
        }
        else if (ddlequipomedico.SelectedValue == "3")
        {
            trem1.Visible = false;
            trem2.Visible = true;
        }
        else if (ddlequipomedico.SelectedValue == "4")
        {
            trem1.Visible = false;
            trem2.Visible = true;
        }
        else if (ddlequipomedico.SelectedValue == "5")
        {
            trem1.Visible = false;
            trem2.Visible = true;
        }
        else if (ddlequipomedico.SelectedValue == "6")
        {
            trem1.Visible = false;
            trem2.Visible = true;
        }
    }
    protected void rbtAceptado_CheckedChanged(object sender, EventArgs e)
    {
        rbtRechazado.Checked = false;
    }
    protected void rbtRechazado_CheckedChanged(object sender, EventArgs e)
    {
        rbtAceptado.Checked = false;
    }
}