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
            Session["Usuario"] = "Luis Muñoz";
            Session["CodUsuario"] = "us001";
            Session["Area"] = "Cuidados Intensivos";
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
            mensaje = "Error al Buscar las Solicitudes";
            ucMOk.ShowError(mensaje, 200, 400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
    }




    #region Custom Methods
    private void CargarGrilla()
    {
        BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();

        var lista = obj.fn_ListaSM(txtfechaini.Text, txtfechafin.Text);
        if (lista.Count > 0)
        {
            gvSolicitudes.DataSource = lista;
            gvSolicitudes.DataBind();
        }
        else
        {
            string mensaje = null;
            mensaje = "No Existen Solicitudes Registradas";
            ucMOk.ShowSuccess(mensaje,200,400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
            gvSolicitudes.DataBind();
        }
        lbContador.Text = lista.Count.ToString();
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
            CargarRegistro(txtid.Text);
            mpeActSM.Show();
            estadopopup = 1;

        }
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = "Error al mostrar los datos";
            ucMOk.ShowError(mensaje,200,400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }
    }

    public void Eliminar(object sender, CommandEventArgs e)
    {
        try
        {

            try
            {
                txtid.Text = e.CommandArgument.ToString();
                txtarea.Text = Session["Area"].ToString();
                txtsolicitadopor.Text = Session["Usuario"].ToString();
                hfcodsolicitado.Value = Session["CodUsuario"].ToString();
                txtfechacreacion.Text = DateTime.Now.ToString("ddMMyyyy");
                CargarRegistro(txtid.Text);
                txtobs.Text = "";
                ibAnular.Visible = true;
                ibGuardar.Visible = false;
                Enable(false);
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
        catch (Exception ex)
        {
            string mensaje = null;
            mensaje = ex.Message;
            ucMOk.ShowError(mensaje,200,400);
            //ClientScript.RegisterStartupScript(typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>");
        }

    }


    public void limpiar()
    {
        //txtfechacreacion.Text = "";
        //txtsolicitadopor.Text = "";
        txtid.Text = "";
        txtarea.Text = "";
        ddltiposervicio.SelectedIndex = 0;
        ddlequipomedico.SelectedIndex = 0;
        txtfechaincidencia.Text = "";
        txtdetalleserv.Text = "";
        txtobs.Text = "";
        //txtcorreo.Text = "";
    }
    private void Enable(bool activo) 
    {
        ddltiposervicio.Enabled = activo;
        ddlequipomedico.Enabled = activo;
        txtfechaincidencia.Enabled = activo;
        txtdetalleserv.Enabled = activo;
    }

    private void CargarRegistro(string codigo)
    {
        BE_SolicitudMantenimiento sol = new BE_SolicitudMantenimiento();
        BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();
        sol.Nrosolicitud = int.Parse(codigo);
        var solicitud = obj.fn_BuscaSM(sol);

        ddltiposervicio.SelectedValue = solicitud.Tiposervicio;
        CargarActivo();
        ddlequipomedico.SelectedValue = solicitud.Activo.ToString();
        txtfechaincidencia.Text = solicitud.Fechaincidencia;
        txtdetalleserv.Text = solicitud.Detalleservicio;
        txtobs.Text = solicitud.Observaciones;
        //txtcorreo.Text = "upctp3@upc.edu.pe";


    }

    private BE_SolicitudMantenimiento crearbjeto()
    {

        BE_SolicitudMantenimiento sm = new BE_SolicitudMantenimiento();
        sm.Nrosolicitud = int.Parse(txtid.Text == "" ? "0" : txtid.Text);
        sm.EmpleadoSol = Session["CodUsuario"].ToString();
        sm.EmpleadoBen = Session["CodUsuario"].ToString();
        sm.Area = txtarea.Text;
        sm.Fechacreacion = txtfechacreacion.Text;
        sm.CodigoCC = "CC0001";

        sm.Tiposervicio = ddltiposervicio.SelectedValue;
        sm.Activo = int.Parse(ddlequipomedico.SelectedValue);
        sm.Fechaincidencia = txtfechaincidencia.Text;
        sm.Detalleservicio = txtdetalleserv.Text;
        sm.Observaciones = txtobs.Text;
        sm.Estado = 1;

        return sm;

    }

    private void Insertar()
    {

        BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();
        var sm = crearbjeto();
        if (obj.fn_InsertarSM(sm))
        {
            estadopopup = 0;
            ucMOk.ShowSuccess("Solicitud de Mantenimiento registrado correctamente",250,400);
            
        }
        mpeActSM.Hide();
        CargarGrilla();

    }
    private void Actualizar()
    {
        BL_SolicitudMantenimiento obj = new BL_SolicitudMantenimiento();
        var sm = crearbjeto();
        if (obj.fn_ActualizarSM(sm))
        {
            estadopopup = 0;
            ucMOk.ShowSuccess("Solicitud de Mantenimiento actualizado correctamente", 200, 400);
        }
        mpeActSM.Hide();
        CargarGrilla();

    }

    //private void Mensaje(string mensaje)
    //{
    //    ScriptManager.RegisterStartupScript(this,typeof(string), "Mensaje", "<script language=\"JavaScript\"> alert('" + mensaje + "')</script>",false);
    //}

    private void CargarActivo()
    {
        if (ddltiposervicio.SelectedValue == "1")
        {
            ddlequipomedico.Items.Clear();
            ddlequipomedico.Items.Add(new ListItem("--Seleccionar--", "0"));
            ddlequipomedico.Items.Add(new ListItem("Equipo de Resonancia Magnetica Serie: AXN001", "1"));
            ddlequipomedico.Items.Add(new ListItem("Equipo de Rayos X Serie: RXN001", "2"));
            ddlequipomedico.Items.Add(new ListItem("Equipo de Resonancia Magnetica Serie: AXN002", "3"));
            ddlequipomedico.Items.Add(new ListItem("Equipo de Rayos X Serie: RXN002", "4"));
            ddlequipomedico.Items.Add(new ListItem("Equipo de Resonancia Magnetica Serie: AXN003", "5"));
            ddlequipomedico.Items.Add(new ListItem("Equipo de Rayos X Serie: RXN003", "6"));
        }
        else if (ddltiposervicio.SelectedValue == "2")
        {
            ddlequipomedico.Items.Clear();
            ddlequipomedico.Items.Add(new ListItem("--Seleccionar--", "0"));
            ddlequipomedico.Items.Add(new ListItem("Sala de Espera Pabellón 1", "1"));
            ddlequipomedico.Items.Add(new ListItem("Sala de Parto Pabellón 2", "2"));
            ddlequipomedico.Items.Add(new ListItem("Cuarto de Almacén Pabellón 1", "3"));
            ddlequipomedico.Items.Add(new ListItem("Sala de Reposo Pabellón 5", "4"));
            ddlequipomedico.Items.Add(new ListItem("Sala de Operaciones Pabellón 3", "5"));
            ddlequipomedico.Items.Add(new ListItem("Sala de Cuidados Intensivos Pabellón 1", "6"));
        }
    }

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
    protected void ibGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txtid.Text))
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
    protected void ddltiposervicio_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddltiposervicio.SelectedIndex > 0)
        {
            CargarActivo();
        }
    }
    protected void ibCerrar_Click(object sender, EventArgs e)
    {
        estadopopup = 0;
        Enable(true);
        ibGuardar.Visible = true;
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
        ibGuardar.Visible = true;
        Enable(true);
    }


    protected void gvSolicitudes_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}