using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;



public partial class GestionCitas_FrmAgendaDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var codigoMedico = Convert.ToString(Request.QueryString["CodigoMedico"]);             
                var medico = new BMedico().Obtener(Convert.ToInt32(codigoMedico));
                if (medico != null)
                {
                    lblNombres.Text = medico.Nombres;
                    lblApellidos.Text = medico.Apellidos;
                    lblEspecialidad.Text = medico.DescripcionEspecialidad;
                    CargaGrid();
                }
            }

        }

        protected void grvMedico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                var index = Convert.ToInt32(e.CommandArgument);
                var codigoAgenda = 0;
                if (e.CommandName == "Editar")
                {
                    codigoAgenda = (int) grvAgendaMedica.DataKeys[index].Value;
                    Response.Redirect("FrmAgendaRegistro.aspx?CodigoMedico=" + Request.QueryString["CodigoMedico"] +
                                      "&CodigoAgenda=" + codigoAgenda);
                }
                else if (e.CommandName == "Eliminar")
                {
                    codigoAgenda = (int) grvAgendaMedica.DataKeys[index].Value;
                    new BAgendaMedica().Eliminar(codigoAgenda);
                    CargaGrid();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert",
                                                   "<script language=JavaScript>alert('" + ex.Message + "');</script>");
            }
            

 
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmAgendaRegistro.aspx?CodigoMedico=" + Request.QueryString["CodigoMedico"]);
        }

        private void CargaGrid()
        {
            var codigoMedico = Convert.ToString(Request.QueryString["CodigoMedico"]);
            grvAgendaMedica.DataSource = new BAgendaMedica().Listar(Convert.ToInt32(codigoMedico));
            grvAgendaMedica.DataBind();
           
        }

        protected void grvAgendaMedica_RowDataBound(object sender, GridViewRowEventArgs e)
        {            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var imbEliminar = (ImageButton)e.Row.FindControl("imbEliminar");
                imbEliminar.Attributes.Add("onClick", "javascript:return confirm('¿ Desea eliminar ?')");
            }
        }
        protected void grvAgendaMedica_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
}
