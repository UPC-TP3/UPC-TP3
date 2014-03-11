using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BL;
using CI.SIC.BE;


public partial class GestionCitas_FrmCancelarCita : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cargar();
            }
        }

        protected void grvCita_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                var index = Convert.ToInt32(e.CommandArgument);
                if (e.CommandName == "Cancelar")
                {
                    var codigoCita = (int)grvCita.DataKeys[index].Value;
                    new BCita().Eliminar(codigoCita);
                    Cargar();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert",
                                                   "<script language=JavaScript>alert('" + ex.Message + "');</script>");
            }
        }

        protected void grvCita_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var imbCancelar = (ImageButton)e.Row.FindControl("imbCancelar");
                imbCancelar.Attributes.Add("onClick", "javascript:return confirm('¿ Desea Cancelar ?')");
            }
        }

        private void Cargar()
        {
            grvCita.DataSource = new BCita().Listar();
            grvCita.DataBind();
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReprogramarCitas.aspx", true);
        }
}
