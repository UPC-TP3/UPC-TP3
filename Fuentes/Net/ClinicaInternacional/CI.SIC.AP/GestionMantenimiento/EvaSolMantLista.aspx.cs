using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;


public partial class GestionMantenimiento_EvaSolMantLista : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {
            Session["Usuario"] = "UsuarioLogin";
        }

        //CargarGrilla();
    }


    protected void ibBuscar_Click(object sender, EventArgs e)
    {
        CargarGrilla();
        //try
        //{
        //    CargarGrilla();
        //}
        //catch (Exception ex)
        //{
        //    string mensaje = null;
        //    mensaje = "Error al Buscar la Evaluacion de Solicitudes de Mantenimiento";
        //    ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        //}
    }
    
    #region Custom Methods
    private void CargarGrilla()
    {
        BL_EvaluarSolicitudMantenimiento obj = new BL_EvaluarSolicitudMantenimiento();

        
        var lista = obj.fn_ListaESM(txtfechaini.Text, txtfechafin.Text);

        if (txtfechaini.Text == "" && txtfechafin.Text == "" && txtNroSolicitud.Text != "")
        {
            lista = obj.fn_ConsultaESM_x_NroSolicitud(Convert.ToInt32(txtNroSolicitud.Text));
        }        

        if (lista.Count > 0)
        {
            gvEvaluarSolicitudes.DataSource = lista;
            gvEvaluarSolicitudes.DataBind();
        }
        else
        {
            string mensaje = null;
            mensaje = "No Existen Evaluaciones de Solicitudes Registradas";
            gvEvaluarSolicitudes.DataBind();
        }
        lbContador.Text = lista.Count.ToString();
    }

    public void Modificar(object sender, CommandEventArgs e)
    {
        try
        {
            Response.Redirect("ActualizarEvaSolMant.aspx?ns=" + e.CommandArgument.ToString() + "&accion=" + Enumerados.Accion.Actualizar.ToString());
        }
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = "Error al modificar";
            ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
    }
    
    #endregion
    protected void txtNroSolicitud_TextChanged(object sender, EventArgs e)
    {
        txtfechaini.Text = null;
        txtfechafin.Text = null;
    }
}