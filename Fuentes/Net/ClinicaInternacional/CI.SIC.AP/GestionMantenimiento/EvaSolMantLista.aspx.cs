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
        BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();

        var lista = obj.fn_ListaSM(txtfechaini.Text, txtfechafin.Text);
        if (lista.Count > 0)
        {
            gvEvaluarSolicitudes.DataSource = lista;
            gvEvaluarSolicitudes.DataBind();
        }
        else
        {
            string mensaje = null;
            mensaje = "No Existen Solicitudes Registradas";
            //ucMOk.ShowSuccess(mensaje,200,400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
            gvEvaluarSolicitudes.DataBind();
        }
        lbContador.Text = lista.Count.ToString() + " Solicitudes encontradas";
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
    protected void gvEvaluarSolicitudes_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var obj = e.Row.DataItem as BE_SolicitudMantenimiento;
            if (obj != null)
            {
                var image2 = e.Row.FindControl("ibModificar") as Image;
                if (image2 != null)
                {
                    if (obj.Estado == 1)
                    {
                        image2.Visible = true;
                    }
                    else if (obj.Estado == 2)
                    {
                        image2.Visible = false;
                    }
                    else if (obj.Estado == 3)
                    {
                        image2.Visible = false;
                    }

                }
            }
        }
    }
}