using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL; 

public partial class GestionCitas_ReprogramarCitas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
        string codigo = grvCitas.SelectedRow.Cells[1].Text;
        

        //ClientScript.RegisterStartupScript(GetType(), "alert","<script language=JavaScript>alert(" + codigo  +  ");</script>");

        Response.Redirect("frmRegistrarCitas.aspx?codigo=" + codigo); 
           

     
        
    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmRegistrarCitas.aspx"); 
           
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmCancelarCita.aspx"); 
    }
}