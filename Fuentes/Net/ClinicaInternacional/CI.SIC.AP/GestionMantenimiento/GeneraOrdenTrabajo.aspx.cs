using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;

public partial class GestionMantenimiento_MISolicitudMantenimiento : System.Web.UI.Page
{
    private static int estadopopup;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["Usuario"] = "Freddy Casas";
            Session["CodUsuario"] = "us002";
            Session["Area"] = "Infraestructura";
        }
        else { if (estadopopup == 1) { mpeActSM.Show(); } }
    }


    protected void ibBuscar_Click(object sender, EventArgs e)
    {
      
        try
        {
            CargarGrilla();
        }
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = "Error al Buscar las Ordenes de Trabajo";
            ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
    }




    #region Custom Methods
    private void CargarGrilla()
    {
        BL_OrdenTrabajo obj = new BL_OrdenTrabajo();
        var lista = obj.fn_ListaOT(txtfechaini.Text, txtfechafin.Text);
        if (lista.Count > 0)
        {
            gvOrdenTrabajo.DataSource = lista;
            gvOrdenTrabajo.DataBind();
        }
        else
        {
            string mensaje = null;
            mensaje = "No Existen Orden de Trabajo";
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
            gvOrdenTrabajo.DataBind();
        }
        lbContador.Text = lista.Count.ToString();
    }


    public void Modificar(object sender, CommandEventArgs e)
    {
        try
        {
            txtOrdendeTrabajo.Text = e.CommandArgument.ToString();
            CargarRegistro(txtOrdendeTrabajo.Text);
            mpeActSM.Show();
            estadopopup = 1;

        }
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = "Error al modificar";
            ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
    }


    public void limpiar()
    {
        
        txtOrdendeTrabajo.Text = "";
        txtFecCreacion.Text = "";
        txtCreadoX.Text = "";
        txtFecInicio.Text = "";
        txtFecFin.Text = "";
        txtPersonal.Text = "";
        ddlPrioridad.SelectedIndex = 0;
        txtComentarios.Text = "";
    }


    private void CargarRegistro(string codigo)
    {
        BE_OrdendeTrabajo sol = new BE_OrdendeTrabajo();
        BL_OrdenTrabajo obj = new BL_OrdenTrabajo();
        sol.GM_NroOrden = int.Parse(codigo);
        var solicitud = obj.fn_BuscaOT(sol);
        txtFecCreacion.Text = solicitud.GM_Fecha_Creacion;
        txtCreadoX.Text = solicitud.GM_CodigoSolicitante;
        txtFecInicio.Text = solicitud.GM_Fecha_Inicio;
        txtFecFin.Text = solicitud.GM_Fecha_Fin;
        txtPersonal.Text = solicitud.GM_Empleados_Asociados;
        txtComentarios.Text = solicitud.GM_Comentarios;
    }



    public void Eliminar(object sender, CommandEventArgs e)
    {
        try
        {
            BE_OrdendeTrabajo ordentrabajo = new BE_OrdendeTrabajo();
            BL_OrdenTrabajo obj = new BL_OrdenTrabajo();

            ordentrabajo.GM_NroOrden = int.Parse(e.CommandArgument.ToString());
            
            if (obj.fn_EliminarOT(ordentrabajo))
            {
                string mensaje = "Se eliminó correctamente la Orden de Trabajo";
                CargarGrilla();
                ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
            }
            else
            {
                string mensaje = "No se pudo eliminar la orden de trabajo";
                ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
            }

        }
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = ex.Message;
            ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }

    }



    private BE_OrdendeTrabajo crearbjeto()
    {

        BE_OrdendeTrabajo od = new BE_OrdendeTrabajo();
        od.GM_NroOrden = int.Parse(txtOrdendeTrabajo.Text == "" ? "0" : txtOrdendeTrabajo.Text);
        od.GM_NroSolicitud = int.Parse(ddlSolicitud.SelectedValue); 
        od.GM_Fecha_Creacion = txtFecCreacion.Text;
        od.GM_CodigoSolicitante = txtCreadoX.Text;
        od.GM_Fecha_Inicio = txtFecInicio.Text;
        od.GM_Fecha_Fin = txtFecFin.Text;
        od.GM_Empleados_Asociados = txtPersonal.Text;
        od.GM_Prioridad = ddlPrioridad.SelectedValue;
        od.GM_Comentarios= txtComentarios.Text;
        od.GM_Estado = ddlEstado.SelectedValue;

        return od;

    }


    private void Insertar()
    {

        BL_OrdenTrabajo obj = new BL_OrdenTrabajo();
        var ot = crearbjeto();
        if (obj.fn_InsertarOT(ot))
        {
            estadopopup = 0;
            Mensaje("Orden de Trabajo registrado correctamente");

        }
        mpeActSM.Hide();

    }
    private void Actualizar()
    {
        BL_OrdenTrabajo obj = new BL_OrdenTrabajo();
        var ot = crearbjeto();
        if (obj.fn_ActualizarOT(ot))
        {
            estadopopup = 0;
            Mensaje("Orden de Trabajo actualizado correctamente");
        }
        mpeActSM.Hide();

    }


    private void Mensaje(string mensaje)
    {
        ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
    }

  

    #endregion







    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txtOrdendeTrabajo.Text))
            {
                Insertar();
                limpiar();
            }
            else
            {
                Actualizar();
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void btnCerrar_Click(object sender, EventArgs e)
    {
        estadopopup = 0;
        mpeActSM.Hide();
    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        mpeActSM.Show();
        estadopopup = 1;
    }





    protected void Button1_Click(object sender, EventArgs e)
    {

        txtPersonal.Text = ddlPersonal.SelectedValue + Environment.NewLine + txtPersonal.Text;


    }
   
    
    protected void ddlPersonal_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvOrdenTrabajo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}