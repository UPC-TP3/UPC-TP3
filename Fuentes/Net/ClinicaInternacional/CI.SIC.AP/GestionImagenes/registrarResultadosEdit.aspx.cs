using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;

public partial class GestionImagenes_registrarResultadosEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMensaje.Text = "";

        if (!IsPostBack)
        {

            Tipo_ExamenBL oTipo_examen = new Tipo_ExamenBL();
            cboTipo_examen.DataSource = oTipo_examen.Listado("");
            cboTipo_examen.DataTextField = "Descripcion";
            cboTipo_examen.DataValueField = "Id_tpo_examen";
            cboTipo_examen.DataBind();

            LocalBL oLocal = new LocalBL();

            Image1.Visible = false;

            if (Request["accion"] != null)
            {
                hidAccion.Value = Request["accion"];
                lblTitulo.Text = "Consulta de Resultado de Informe";
                btnGrabar.Visible = false;
                fupImagen.Visible = false;
                //Programacion_ExamenBL oProgramacion = new Programacion_ExamenBL();
                //Programacion_ExamenBE eProgramacion;
                //eProgramacion = oProgramacion.Registro(Convert.ToInt32(Request["id"].ToString().Trim()), 0);

                //if (eProgramacion != null)
                //{
                //    txtId_orden_examen.Text = eProgramacion.Id_orden_examen.ToString();
                //    CargaOrden();
                //    //txtId_orden_examen.Enabled = false;


                //}
                //else
                //{


                //    lblMensaje.Text = "Programación no existe";
                //}
            }
            else
            {
                lblTitulo.Text = "Resultado de Informe de Examen";
                btnGrabar.Visible = true;
                fupImagen.Visible = true;
            }

            //if (Request["accion"] != null)
            //{
            //    hidAccion.Value = Request["accion"].ToString();
                //if (hidAccion.Value == "A")
                //{
                //    lblTitulo.Text = "Anulación de Programación de exámenes";
                //    btnOrden_pago.Visible = false;
                //    btnProgramar.Visible = false;
                //    btnReProgramar.Visible = false;
                //    btnAnular.Visible = true;
                //    btnConsultar.Visible=false;

                //    cboLocal.Enabled = false;
                //    cboConsultorio.Enabled = false;
                //    cboHorario.Enabled = false;
                //}
                
                //btnGrabar.Visible = true;


                //if (hidAccion.Value == "M")
                //{
                    //lblTitulo.Text = "Informe de Resultados";
                    //btnOrden_pago.Visible = true;
                    //btnGrabar.Visible = true;
                    //btnReProgramar.Visible = false;
                    btnAnular.Visible = false;
                    //btnConsultar.Visible=false;
             //   }
            //}


            //if (txtEstado_orden_examen.Text.Substring(0,1) == "C")
            //{
            //    btnOrden_pago.Visible = false;
            //}
        }
    }

    protected void CargaInforme()
    {
        InformeResultadoBL oInformeResultado = new InformeResultadoBL();
        InformeResultadoBE eInformeResultado;
        eInformeResultado = oInformeResultado.Registro(txtId_orden_examen.Text == "" ? 0 : Convert.ToInt32(txtId_orden_examen.Text));

        if (eInformeResultado != null)
        {
            txtFecha_resultado.Text = eInformeResultado.Fecha.ToString("dd/MM/yyyy");
            txtEstado_resultado.Text = eInformeResultado.Estado;
            txtResultado.Text = eInformeResultado.Resultado;
            txtObservaciones.Text = eInformeResultado.Observacion;

            if (hidAccion.Value != "C")
            {

                Image1.ImageUrl= "";
                btnGrabar.Visible = false;
                lblMensaje.Text = "Resultado de examen ya fue registrado";
            }
            else
            {
                if (eInformeResultado.Imagen != "")
                {
                    Image1.Visible = true;

                    //Image1.ImageUrl = @"file:\\" + @"D:\personal\UPC\tp3\proyecto\sistema\examenes\" + eInformeResultado.Imagen;
                    Image1.ImageUrl = "examenes/" + eInformeResultado.Imagen;
                    //Image1.ImageUrl = @"file:///C:/Users/Public/Pictures/ban-seguros.png";
                    //Image1.DataBind();
                    
                }
            }
        }
        else
        {
            
            txtEstado_resultado.Text = "";
            txtResultado.Text = "";
            txtObservaciones.Text = "";

            if (hidAccion.Value == "C")
            {
                Image1.Visible = false;
                lblMensaje.Text = "Resultado de examen no ha sido registrado";
            }
            else
            {
                txtFecha_resultado.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
        }
    }

    protected void CargaOrden()
    {
        if (txtId_orden_examen.Text.Trim() != "")
        {
            Orden_ExamenBL oOrden_examen = new Orden_ExamenBL();
            Orden_ExamenBE eOrden_examen;
            eOrden_examen = oOrden_examen.Registro(Convert.ToInt32(txtId_orden_examen.Text));

            txtFecha_examen.Text = "";
            txtId_orden_atencion.Text = "";
            txtId_historia.Text = "";
            txtPaciente.Text = "";
            txtMedico.Text = "";
            cboTipo_examen.SelectedValue = "1";
            txtExamen.Text = "";
            txtTipo_atencion.Text = "";
            txtEstado_orden_examen.Text = "";
            txtFecha_resultado.Text = "";

            if (eOrden_examen != null)
            {
                txtFecha_examen.Text = eOrden_examen.Fecha.ToString("dd/MM/yyyy");
                txtId_orden_atencion.Text = eOrden_examen.Id_orden_atencion.ToString();
                txtId_historia.Text = eOrden_examen.Id_historia.ToString();
                txtPaciente.Text = eOrden_examen.Paciente;
                txtMedico.Text = eOrden_examen.Medico;
                cboTipo_examen.SelectedValue = eOrden_examen.Id_tpo_examen.ToString();
                txtExamen.Text = eOrden_examen.Examen;
                txtTipo_atencion.Text = eOrden_examen.Tipo_atencion;
                txtEstado_orden_examen.Text = eOrden_examen.Estado;

                if (hidAccion.Value!="C")
                    txtFecha_resultado.Text = DateTime.Now.ToString("dd/MM/yyyy");

                CargaInforme();
            }
            else
            {
                lblMensaje.Text = "Orden de examen no existe";
            }
        }
    }




    protected void btnProgramar_Click(object sender, EventArgs e)
    {
        if (txtResultado.Text == "")
        {
            lblMensaje.Text = "Registre resultado";
            txtResultado.Focus();
            return;
        }
        if (txtObservaciones.Text == "")
        {
            lblMensaje.Text = "Registre observaciones";
            txtObservaciones.Focus();
            return;
        }

        InformeResultadoBL oInformeResultado = new InformeResultadoBL();
        InformeResultadoBE eInformeResultado = new InformeResultadoBE();

        eInformeResultado.Id_orden_examen = Convert.ToInt32(txtId_orden_examen.Text);
        eInformeResultado.Resultado = txtResultado.Text;
        eInformeResultado.Observacion = txtObservaciones.Text;
        eInformeResultado.Estado = "R";
        if (fupImagen.FileName != "")
            eInformeResultado.Imagen = fupImagen.FileName;

        if (oInformeResultado.Nuevo(eInformeResultado) == true)
        {
            if (fupImagen.FileName != "")
            {
                //System.IO.File.Copy(fupImagen.PostedFile.FileName, @"D:\personal\UPC\tp3\proyecto\sistema\examenes\" + fupImagen.FileName, true);
                System.IO.File.Copy(fupImagen.PostedFile.FileName, @"D:\personal\UPC\tp3\proyecto\sistema\UPC-TP3\Fuentes\Net\ClinicaInternacional\CI.SIC.AP\GestionImagenes\examenes\" + fupImagen.FileName, true);
                
            }
            Response.Redirect("gestionImagenes.aspx");
        }
        else
            lblMensaje.Text = "No se pudieron registrar Resultados";

    }
    protected void btnCerrar_Click(object sender, EventArgs e)
    {
        Response.Redirect("gestionImagenes.aspx");
    }

    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        CargaOrden();
        

        //CargaProgramacion();

        ////if (txtEstado_orden_examen.Text!="")
        ////    if (txtEstado_orden_examen.Text.Substring(0, 1) == "C")
        ////    {
        ////        btnOrden_pago.Visible = false;
        ////    }
    }


}