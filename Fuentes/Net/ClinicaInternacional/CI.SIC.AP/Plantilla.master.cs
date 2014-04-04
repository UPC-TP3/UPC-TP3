using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Plantilla : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Menu_load();
    }
    private void Menu_load()
    {
        string menu = string.Empty;
        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Admisión");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmConsultaCita.aspx", "Ambulatoria");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmEmergencia.aspx", "Emergencia");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmHospitalizacion.aspx", "Hospitalaria");        
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Orden");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "Ordenes/OrdHospitalizacion.aspx", "Hospitalización");        
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmOrdenProcedimiento.aspx", "Psrocedimiento");
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Mantenimiento");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmVerificarPaciente.aspx", "Actualizar Paciente");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmVerificarHistoriaClinica.aspx", "Historia Clínica");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionAdmision/GcAdmConsultarPaciente.aspx", "Paciente");
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Gestión de Citas");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionCitas/ReprogramarCitas.aspx", "Mantenimiento de Citas");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionCitas/frmAgendaMedica.aspx", "Gestionar Agenda Medica");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionCitas/frmCitaDomicilio.aspx", "Generar Consulta Domiciliaria");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionCitas/frmConsultaMedica.aspx", "Mantenimiento de Historia Clínica");
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Gestión de Mantenimiento");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionMantenimiento/MISolicitudMantenimiento.aspx", "Solicitud");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionMantenimiento/EvaSolMantLista.aspx", "Evaluar Solicitud");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionMantenimiento/GeneraOrdenTrabajo.aspx", "Orden de Trabajo");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionMantenimiento/MonitorearOT.aspx", "Monitorear OT");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionMantenimiento/ConsultaRecursosDisponibles.aspx", "Consultar Recursos");
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Gestión de Imágenes");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionImagenes/ordenPago.aspx", "Órdenes de Pago");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionImagenes/programacionImagenesEdit.aspx", "Programación de Exámenes");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionImagenes/requisitosExamen.aspx", "Verificar Requisitos");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionImagenes/registrarResultadosEdit.aspx", "Registrar Resultados");
        menu += string.Format("<li><a href=\'../{0}\'>{1}</a></li>", "GestionImagenes/registrarResultadosEdit.aspx?accion=C", "Consultar Resultados");
        menu += "</ul></li>";

        menu += string.Format("<li><a href=\"#\">{0}</a><ul class=\"sub\">", "Gestion de Emergencia");
        menu += string.Format("<li><a href=\'/CI.SIC.AP/{0}\'>{1}</a></li>", "GestionEmergencia/GenerarAtencionMedica/Listado.aspx", "Generar atención medica de Emergencia");
        menu += string.Format("<li><a href=\'/CI.SIC.AP/{0}\'>{1}</a></li>", "GestionEmergencia/GestionServiciosEmergencia.aspx", "Generar Servicio de Emergencia");
        menu += string.Format("<li><a href=\'/CI.SIC.AP/{0}\'>{1}</a></li>", "GestionEmergencia/EvaluacionDeAmbiente/Consultar.aspx", "Evaluación de Ambiente");
        menu += string.Format("<li><a href=\'/CI.SIC.AP/{0}\'>{1}</a></li>", "GestionEmergencia/ActualizarEstadoCama.aspx", "Administrar Cama");
        menu += string.Format("<li><a href=\'/CI.SIC.AP/{0}\'>{1}</a></li>", "GestionEmergencia/GenerarOrdenExamenMedico.aspx", "Generar Orden de Exámen Médico");
        menu += string.Format("<li><a href=\'/CI.SIC.AP/{0}\'>{1}</a></li>", "GestionEmergencia/GenerarOrdenSalidaMedicamento.aspx", "Generar Orden de Salida de Medicamento");

        menu += "</ul></li>";

        lstMenu.Text = menu;
    }
}
