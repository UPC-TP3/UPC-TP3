using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL; 

public partial class GestionCitas_frmConsultaMedica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarCombo(); 
            Cargar();
        }
    }
    private void Cargar()
    {


        grvCitas.DataSource = new BCita().Listar();
        grvCitas.DataBind();

    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string codigo = grvCitas.SelectedRow.Cells[0].Text;


        //ClientScript.RegisterStartupScript(GetType(), "alert","<script language=JavaScript>alert(" + codigo  +  ");</script>");

        Response.Redirect("frmRegistrarConsulta.aspx?codigo=" + codigo);




    }


    protected void cboEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    private void CargarCombo()
    {

        BMedico medico = new BMedico();
        cboMedico.DataSource = medico.Listar();
        cboMedico.DataTextField = "ApeNom";
        cboMedico.DataValueField = "CodigoMedico";
        cboMedico.DataBind();

    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        string codigoMedico = cboMedico.SelectedValue;
        string dniPaciente = txtDni .Text;
        grvCitas.DataSource = new BCita().Listar(Convert.ToInt32(codigoMedico), dniPaciente);
        grvCitas.DataBind();

    }
}