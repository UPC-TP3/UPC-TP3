using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
   public class BConsulta
    {
       readonly DB_SGHEntities _contexto = new DB_SGHEntities();

       public int Insertar(EConsulta consulta)
       {
           var objeto = new TB_CONSULTA
           {
               FechaHoraInicio = consulta.FechaHoraInicio.Value,  
               ID_Medico = consulta.Id_Medico,
               ID_Paciente = consulta.Id_Paciente,
               ID_Cita = consulta.Id_Cita,
               ID_Consultorio = consulta.Id_Consultorio,
               Observaciones = consulta.Observaciones,
               Diagnostico = consulta.Diagnostico,
               
           };
           _contexto.AddToTB_CONSULTA(objeto);
           _contexto.SaveChanges();

           //ACTUALIZAR ESTADO DE LA CITA///
           var objeto2 = _contexto.TB_CITA.FirstOrDefault(c => c.ID_Cita == consulta.Id_Cita);
           if (objeto2 != null)
           {
               objeto2.ID_EstadoCita = 2; 
               _contexto.SaveChanges();
           }
           
           //////////////////////////////////

           return objeto.ID_Consulta;
       }


       public EConsulta Obtener(int codigoCita)
       {
           return _contexto.TB_CONSULTA.Where(f => f.ID_Cita == codigoCita).Select(cita => new EConsulta
           {
               Id_Consulta = cita.ID_Consulta, 
               Id_Medico = cita.ID_Medico,
               Id_Paciente = cita.ID_Paciente, 
               Diagnostico = cita.Diagnostico,
               Observaciones = cita.Observaciones 
               
           }).FirstOrDefault();
       }

    }
}
