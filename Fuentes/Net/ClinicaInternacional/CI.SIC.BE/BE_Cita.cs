using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    public class BE_Cita
    {
        public int ID_Cita { get; set; }
        public DateTime FechaHoraCita { get; set; }
        public string Aseguradora { get; set; }
        public float Cobertura { get; set; }
        public string Estado { get; set; }
        public string OrdenAtencion { get; set; }

        public int ID_Paciente { get; set; }
        public int ID_Historia { get; set; }
        public int ID_Especialidad { get; set; }
        public int ID_Medico { get; set; }
        public int ID_AgendaMedica { get; set; }
        public int ID_EstadoCita { get; set; }
        public int ID_Cita_Reprogramada { get; set; }

        public string Des_Ubicacion_Cita { get; set; }
    }
}
