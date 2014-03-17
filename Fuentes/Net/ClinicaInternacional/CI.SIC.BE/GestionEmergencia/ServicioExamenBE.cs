using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    public class ServicioExamenBE
    {
        public int IdAtencion { get; set; }
        public int IdServicio { get; set; }
        public int IdExamen { get; set; }
        public string Examen { get; set; }
        public DateTime FechaIngreso { get; set; }
        public int IdMedico { get; set; }
        public string Medico { get; set; }
        public int IdPaciente { get; set; }
        public string Paciente { get; set; }
    }
}
