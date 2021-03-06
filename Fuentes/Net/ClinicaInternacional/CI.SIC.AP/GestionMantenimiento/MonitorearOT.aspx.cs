﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;


public partial class GestionMantenimiento_MonitorearOT : System.Web.UI.Page
{
    private static int estadopopup;
    protected void Page_Load(object sender, EventArgs e)
    {
        //txtfechaini.Text = DateTime.Now.AddDays(-10).ToString("ddMMyyyy");
        //txtfechafin.Text = DateTime.Now.AddDays(+10).ToString("ddMMyyyy");
        if (!Page.IsPostBack)
        {
            Session["Usuario"] = "Luis Muñoz";
            Session["CodUsuario"] = "us001";
            Session["Area"] = "Cuidados Intensivos";
            CargarGrilla();
        }
        else { if (estadopopup == 1) { mpeActSM.Show(); } }
    }

    protected void ibBuscar_Click(object sender, EventArgs e)
    {
        //CargarGrilla();
        try
        {
            CargarGrilla();
        }
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = "Error al Buscar las Ordenes de Trabajo";
            ucMOk.ShowError(mensaje, 200, 400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
    }

    protected void gvSolicitudes_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var obj = e.Row.DataItem as BE_OrdendeTrabajo;
            if (obj != null)
            {
                var image1 = e.Row.FindControl("imgIndicador") as Image;
                var image2 = e.Row.FindControl("ibModificar") as Image;
                var image3 = e.Row.FindControl("ibInforme") as Image;
                if (image1 != null)
                {
                    if (obj.GM_Estado == "1"){
                        image1.ImageUrl = "~/Imagenes/Trafficlight_red.png";
                        image2.Visible = false;
                        image3.Visible = false;
                    }
                    else if (obj.GM_Estado == "2"){                    
                        image1.ImageUrl = "~/Imagenes/Trafficlight_yellow.png";
                        image2.Visible = false;
                        image3.Visible = false;
                    }
                    else if (obj.GM_Estado == "3"){
                        image1.ImageUrl = "~/Imagenes/Trafficlight_green.png";
                        image2.Visible = true;
                        image3.Visible = true;
                    }
                    else if (obj.GM_Estado == "4"){
                        image1.ImageUrl = "~/Imagenes/Trafficlight_blue.png";
                        image2.Visible = false;
                        image3.Visible = true;
                        //e.Row.Cells[0].Controls[0].EnableViewState = false;
                    }

                }
            }
        }
    }


    #region Custom Methods
    private void CargarGrilla()
    {
        //BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();
        BL_OrdenTrabajo obj = new BL_OrdenTrabajo();

        var lista = obj.fn_MonitorearOT(Int32.Parse(DropDownList1.SelectedValue.ToString())/*txtfechaini.Text, txtfechafin.Text*/);
        if (lista.Count > 0)
        {
            gvSolicitudes.DataSource = lista;
            gvSolicitudes.DataBind();
        }
        else
        {
            string mensaje = null;
            mensaje = "No Existen Ordenes de Trabajo Registradas";
            ucMOk.ShowSuccess(mensaje, 200, 400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
            gvSolicitudes.DataBind();
        }
        lbContador.Text = lista.Count.ToString()+" Registros Encontrados";
    }

    public void Modificar(object sender, CommandEventArgs e)
    {
        try
        {
            txtid.Text = e.CommandArgument.ToString();
            txtarea.Text = Session["Area"].ToString();
            txtsolicitadopor.Text = Session["Usuario"].ToString();
            hfcodsolicitado.Value = Session["CodUsuario"].ToString();
            txtfechacreacion.Text = DateTime.Now.ToString("ddMMyyyy");
            ibCerrar.Visible = true;
            ibRetornar.Visible = true;
            CargarRegistro(txtid.Text);
            mpeActSM.Show();
            estadopopup = 1;
        }
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = "Error al mostrar los datos";
            ucMOk.ShowError(mensaje, 200, 400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
    }

    public void Informe(object sender, CommandEventArgs e)
    {
        try
        {
            txtid.Text = e.CommandArgument.ToString();
            txtarea.Text = Session["Area"].ToString();
            txtsolicitadopor.Text = Session["Usuario"].ToString();
            hfcodsolicitado.Value = Session["CodUsuario"].ToString();
            txtfechacreacion.Text = DateTime.Now.ToString("ddMMyyyy");
            ibCerrar.Visible = false;
            ibRetornar.Visible = true;
            CargarRegistro(txtid.Text);
            mpeActSM.Show();
            estadopopup = 1;
        }
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = "Error al mostrar los datos";
            ucMOk.ShowError(mensaje, 200, 400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
    }
    //public void Eliminar(object sender, CommandEventArgs e)
    //{
    //    try
    //    {

    //        try
    //        {
    //            txtid.Text = e.CommandArgument.ToString();
    //            txtarea.Text = Session["Area"].ToString();
    //            txtsolicitadopor.Text = Session["Usuario"].ToString();
    //            hfcodsolicitado.Value = Session["CodUsuario"].ToString();
    //            txtfechacreacion.Text = DateTime.Now.ToString("ddMMyyyy");
    //            CargarRegistro(txtid.Text);
    //            txtobs.Text = "";
    //            ibAnular.Visible = true;
    //            ibGuardar.Visible = false;
    //            Enable(false);
    //            mpeActSM.Show();
    //            estadopopup = 1;

    //        }
    //        catch (Exception ex)
    //        {
    //            string mensaje = null;
    //            mensaje = "Error al mostrar los datos";
    //            ucMOk.ShowError(mensaje, 200, 400);
    //            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
    //        }


    //    }
    //    catch (Exception ex)
    //    {
    //        string mensaje = null;
    //        mensaje = ex.Message;
    //        ucMOk.ShowError(mensaje, 200, 400);
    //        //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
    //    }

    //}


    public void limpiar()
    {
        //txtfechacreacion.Text = "";
        //txtsolicitadopor.Text = "";
        txtid.Text = "";
        txtarea.Text = "";
        //ddltiposervicio.SelectedIndex = 0;
        //ddlequipomedico.SelectedIndex = 0;
        //txtfechaincidencia.Text = "";
        txtdetalleserv.Text = "";
        txtobs.Text = "";
        //txtcorreo.Text = "";
    }
    private void Enable(bool activo)
    {
        //ddltiposervicio.Enabled = activo;
        //ddlequipomedico.Enabled = activo;
        //txtfechaincidencia.Enabled = activo;
        txtdetalleserv.Enabled = activo;
    }

    private void CargarRegistro(string codigo)
    {
        BE_SolicitudMantenimiento sol = new BE_SolicitudMantenimiento();
        BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();
        sol.Nrosolicitud = int.Parse(codigo);
        var solicitud = obj.fn_BuscaSM(sol);

        //ddltiposervicio.SelectedValue = solicitud.Tiposervicio;
        //CargarActivo();
        //ddlequipomedico.SelectedValue = solicitud.Activo.ToString();
        //txtfechaincidencia.Text = solicitud.Fechaincidencia;
        txtdetalleserv.Text = solicitud.Detalleservicio;
        txtobs.Text = solicitud.Observaciones;
        //txtcorreo.Text = "upctp3@upc.edu.pe";


    }

    private BE_OrdendeTrabajo crearbjeto()
    {

        BE_OrdendeTrabajo ot = new BE_OrdendeTrabajo();
        ot.GM_NroOrden = int.Parse(txtid.Text == "" ? "0" : txtid.Text);

        return ot;
    }

    //private BE_SolicitudMantenimiento crearbjeto()
    //{

    //    BE_SolicitudMantenimiento sm = new BE_SolicitudMantenimiento();
    //    sm.Nrosolicitud = int.Parse(txtid.Text == "" ? "0" : txtid.Text);
    //    sm.EmpleadoSol = Session["CodUsuario"].ToString();
    //    sm.EmpleadoBen = Session["CodUsuario"].ToString();
    //    sm.Area = txtarea.Text;
    //    sm.Fechacreacion = txtfechacreacion.Text;
    //    sm.CodigoCC = "CC0001";

    //    //sm.Tiposervicio = ddltiposervicio.SelectedValue;
    //    //sm.Activo = int.Parse(ddlequipomedico.SelectedValue);
    //    //sm.Fechaincidencia = txtfechaincidencia.Text;
    //    sm.Detalleservicio = txtdetalleserv.Text;
    //    sm.Observaciones = txtobs.Text;
    //    sm.Estado = 1;

    //    return sm;
    //}

    //private void Insertar()
    //{

    //    BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();
    //    var sm = crearbjeto();
    //    if (obj.fn_InsertarSM(sm))
    //    {
    //        estadopopup = 0;
    //        ucMOk.ShowSuccess("Solicitud de Mantenimiento registrado correctamente", 250, 400);

    //    }
    //    mpeActSM.Hide();
    //    CargarGrilla();

    //}
    //private void Actualizar()
    //{
    //    BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();
    //    var sm = crearbjeto();
    //    if (obj.fn_ActualizarSM(sm))
    //    {
    //        estadopopup = 0;
    //        ucMOk.ShowSuccess("Solicitud de Mantenimiento actualizado correctamente", 200, 400);
    //    }
    //    mpeActSM.Hide();
    //    CargarGrilla();
    //}
    private void Cerrar()
    {
        BL_OrdenTrabajo obj = new BL_OrdenTrabajo();
        var sm = crearbjeto();
        if (obj.fn_cerrarOT(sm))
        {
            estadopopup = 0;
            ucMOk.ShowSuccess("Orden de Trabajo Cerrada", 200, 400);
        }
        mpeActSM.Hide();
        CargarGrilla();
    }
    //private void Mensaje(string mensaje)
    //{
    //    ScriptManager.RegisterStartupScript(this,typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>",false);
    //}

    #endregion
    protected void ibIngresar_Click(object sender, EventArgs e)
    {
        limpiar();
        txtid.Text = "";
        txtarea.Text = Session["Area"].ToString();
        txtsolicitadopor.Text = Session["Usuario"].ToString();
        hfcodsolicitado.Value = Session["CodUsuario"].ToString();
        txtfechacreacion.Text = DateTime.Now.ToString("ddMMyyyy");
        mpeActSM.Show();
        estadopopup = 1;
    }
    protected void ibCerrar_Click(object sender, EventArgs e)
    {
        try
        {
            Cerrar();
            //if (string.IsNullOrEmpty(txtid.Text))
            //{
            //    Insertar();
            //    limpiar();
            //}
            //else
            //{
            //    Actualizar();
            //}

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    protected void ibRetornar_Click(object sender, EventArgs e)
    {
        estadopopup = 0;
        Enable(true);
        ibCerrar.Visible = true;
        mpeActSM.Hide();
    }
    protected void ibAnular_Click(object sender, EventArgs e)
    {
        BE_SolicitudMantenimiento solicitud = new BE_SolicitudMantenimiento();
        BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();
        solicitud.Nrosolicitud = int.Parse(txtid.Text);
        solicitud.Observaciones = txtobs.Text;

        if (obj.fn_EliminarSM(solicitud))
        {
            string mensaje = "Se eliminó correctamente La Solicitud de Mantenimiento";
            CargarGrilla();
            ucMOk.ShowSuccess(mensaje, 200, 400);
        }
        else
        {
            string mensaje = "No se pudo elimiar La Solicitud";
            ucMOk.ShowWarning(mensaje, 200, 400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
        ibCerrar.Visible = true;
        Enable(true);
    }
    //protected void ddltiposervicio_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddltiposervicio.SelectedIndex > 0)
    //    {
    //        CargarActivo();
    //    }
    //}

}