using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE; 
using CI.SIC.BL; 


public partial class GestionCitas_BuscarPaciente : System.Web.UI.Page
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
        grvPacientes.DataSource = new BPaciente().Listar();
        grvPacientes.DataBind(); 
        
    }



    

   





    protected void grvPacientes_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        string codigo = grvPacientes.SelectedRow.Cells[1].Text;
        string nombre = grvPacientes.SelectedRow.Cells[2].Text;
        string apellido = grvPacientes.SelectedRow.Cells[3].Text;

        //ClientScript.RegisterStartupScript(GetType(), "alert","<script language=JavaScript>alert(" + codigo  +  ");</script>");

        

        ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript:select("+ codigo + ");</script>");
    }
}