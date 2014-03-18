using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.DA;
using CI.SIC.BE;

namespace CI.SIC.BL
{
   public class BRecetaMedica
    {
        readonly DB_SGHEntities _contexto = new DB_SGHEntities();


        public List<ERecetaMedica> Listar(int codigoConsulta)
        {
            return _contexto.TB_PRESCRIPCION_MEDICA.Where(f => f.ID_Consulta == codigoConsulta)
                .Select(Cita => new ERecetaMedica
                {
                    Id_PrescripcionMedica = Cita.ID_Prescripcion_Medica,
                    //HoraInicioAgenda = TB_Cita.TB_Agenda_Medica.HoraInicio,
                    //HoraFinAgenda = TB_Cita.TB_Agenda_Medica.HoraFin,
                    Id_Consulta = Cita.ID_Consulta,
                    Id_Medicamento = Cita.ID_Medicamento,
                    NombreMedicamento = Cita.TB_MEDICAMENTO.GE_NombreMedicamento,
                    Dosis = Cita.Dosis ,
                    Frecuencia = Cita.Frecuencia  
                }).ToList();

        }


       public int Insertar(ERecetaMedica consulta)
       {
           DateTime thisDay = DateTime.Today;

           var objeto = new TB_PRESCRIPCION_MEDICA 
           {

  

//               lblFechaCita.Text = thisDay.ToString("dd/MM/yyyy");

              GA_FechaPrescripcion =  thisDay, 
               GA_Doctor = consulta.Observacion, 
               ID_Medico = consulta.Id_Medico,
               ID_Paciente = consulta.Id_Paciente,
               ID_Medicamento = consulta.Id_Medicamento,
               ID_Consulta = consulta.Id_Consulta,
               Dosis = consulta.Dosis,
               Frecuencia = consulta.Frecuencia 
               
           };
           _contexto.AddToTB_PRESCRIPCION_MEDICA(objeto);
           _contexto.SaveChanges();

           return objeto.ID_Prescripcion_Medica;
       }


       public ERecetaMedica Obtener(int codigoReceta)
       {
           return _contexto.TB_PRESCRIPCION_MEDICA.Where(f => f.ID_Prescripcion_Medica == codigoReceta).Select(cita => new ERecetaMedica
           {
               Id_Consulta = cita.ID_Consulta, 
               Id_Medicamento = cita.ID_Medicamento, 
               Observacion = cita.GA_Doctor,
               Dosis = cita.Dosis,
               Frecuencia = cita.Frecuencia 
                
           }).FirstOrDefault();
       }

    }
    
}
