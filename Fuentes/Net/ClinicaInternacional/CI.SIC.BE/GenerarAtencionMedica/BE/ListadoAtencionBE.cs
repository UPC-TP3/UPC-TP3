using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE.GenerarAtencionMedica.BE
{
    public class ListadoAtencionBE
    {
        public int id { get; set; }
        public DateTime fechaIngreso { get; set; }
        public string DNIPaciente { get; set; }
        public string Paciente { get; set; }
        public string Medico { get; set; }
        public int idPaciente { get; set; }
        public int idMedico { get; set; }
        public string DNIMedico { get; set; }
        public string Observaciones { get; set; }
    }
}
