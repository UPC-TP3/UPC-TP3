using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL; 

public partial class GestionCitas_BuscarAgendaMedica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Cargar();
            CargarCombo();
        }
    }
    protected void grvAgendaMedica_SelectedIndexChanged(object sender, EventArgs e)
    {
        string codigo = grvAgendaMedica.SelectedRow.Cells[1].Text;
      

        //ClientScript.RegisterStartupScript(GetType(), "alert","<script language=JavaScript>alert(" + codigo  +  ");</script>");



        ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript:select(" + codigo + ");</script>");
    }

    private void Cargar()
    {
        grvAgendaMedica.DataSource = new BAgendaMedica().Listar(true);
        grvAgendaMedica.DataBind();

    }

    private void CargarCombo()
    {
        
        BEspecialidad especialidad = new BEspecialidad();
        cboEspecialidad.DataSource = especialidad.Listar(); 
        cboEspecialidad.DataTextField = "Descripcion";
        cboEspecialidad.DataValueField = "CodigoEspecialidad";
        cboEspecialidad.DataBind();

    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        string codigo = cboEspecialidad.SelectedValue;
        string fecha = txtFecha.Text; 

        grvAgendaMedica.DataSource = new BAgendaMedica().Filtrar(Convert.ToDateTime(fecha),Convert.ToInt32(codigo));
        grvAgendaMedica.DataBind();
    }
}