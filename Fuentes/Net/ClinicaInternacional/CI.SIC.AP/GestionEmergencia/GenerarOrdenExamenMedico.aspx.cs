using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;
using CI.SIC.BL.GenerarAtencionMedica.BL;
using CI.SIC.CC;
using PacienteBL = CI.SIC.BL.GenerarAtencionMedica.BL.PacienteBL;

public partial class GestionEmergenciaGenerarOrdenExamenMedico : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lblContador.Text = Configuraciones.TiempoRecarga.ToString();    
            Listar();
            Combo();
        }
    }

    private void Listar()
    {
        grvLista.DataSource = new ServicioExamenBL().Listar();
        grvLista.DataBind();
    }

    private void Combo()
    {        
        ddlMedico.DataSource = new TurnoBL().ListarMedicosPorTurno("M");
        ddlMedico.DataTextField = "nombrecompleto";
        ddlMedico.DataValueField = "id";
        ddlMedico.Enabled = false;
        ddlMedico.DataBind();

        ddlPaciente.DataSource = new PacienteBL().Listar();
        ddlPaciente.DataTextField = "nombre";
        ddlPaciente.DataValueField = "id";
        ddlPaciente.Enabled = false;
        ddlPaciente.DataBind();

        ddlExamen.DataSource = new TipoExamenBL().Listar();
        ddlExamen.DataTextField = "Nombre";
        ddlExamen.DataValueField = "Id";
        ddlExamen.Enabled = false;
        ddlExamen.DataBind();

        ddlEstado.Items.Add(new ListItem { Value = "0", Text = "Pendiente" });
        ddlEstado.Items.Add(new ListItem { Value = "1", Text = "Registrado" });
        ddlEstado.Items.Add(new ListItem { Value = "2", Text = "Cancelado" });       
    }


    protected void btnAsignar_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grvLista.Rows)
        {
            var rbtEstado = (RadioButton)(row.FindControl("rbtEstado"));            
            if (rbtEstado.Checked)
            {
                var dataKeys = grvLista.DataKeys[row.RowIndex];
                if (dataKeys != null)
                {
                    hdnAtencion.Value = dataKeys["IdAtencion"].ToString();
                    lblAtencion.Text = dataKeys["IdAtencion"].ToString().PadLeft(6, '0');                    
                    ddlPaciente.SelectedValue =dataKeys["IdPaciente"].ToString();
                    ddlMedico.SelectedValue = dataKeys["IdMedico"].ToString();
                    ddlExamen.SelectedValue = dataKeys["IdExamen"].ToString();                    
                    EjecutarScript(updDatos,"mostrarDatos();");
                }                    
                break; 
            }
        }
    }

    private static void EjecutarScript(Control pControl, string pScriptJs)
    {
        var sb = new StringBuilder();
        sb.Append("<script type=\"text/javascript\">");
        sb.Append(pScriptJs);
        sb.Append("</script>");
        var guidKey = Guid.NewGuid();
        ScriptManager.RegisterStartupScript(pControl, pControl.GetType(), guidKey.ToString(), sb.ToString(), false);
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        new OrdenExamenBL().Grabar(new OrdenExamenBE
            {
                IdAtencion = Convert.ToInt32(hdnAtencion.Value),
                IdMedico = Convert.ToInt32(ddlMedico.SelectedValue),
                Estado = ddlEstado.SelectedValue,
                Fecha = Convert.ToDateTime(txtFecha.Text),
                IdPaciente = Convert.ToInt32(ddlPaciente.SelectedValue),
                Detalle = txtDetalle.Text,
                IdExamen = Convert.ToInt32(ddlExamen.SelectedValue)
            });
        Listar();
    }
    //protected void tmrContador_Tick(object sender, EventArgs e)
    //{

    //    if (Convert.ToInt32(lblContador.Text) == 0)
    //    {
    //        Listar();
    //        lblContador.Text = Configuraciones.TiempoRecarga.ToString();    
    //    }
    //    else
    //        lblContador.Text = (Convert.ToInt32(lblContador.Text) - 1).ToString();
    //}
    protected void btnListar_Click(object sender, EventArgs e)
    {
        Listar();
    }
}