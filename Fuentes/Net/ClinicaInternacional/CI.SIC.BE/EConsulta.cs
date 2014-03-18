using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
  public class EConsulta
    {

        public int Id_Consulta { get; set; }

        public int Id_Medico { get; set; }
        public int Id_Paciente { get; set; }
        public int Id_Cita { get; set; }
        public DateTime? FechaHoraInicio { get; set; }
        public DateTime? FechaHoraFin { get; set; }
        
        public int Id_Consultorio { get; set; }
        public string Observaciones { get; set; }
        public string Diagnostico { get; set; }
        

    }
}
