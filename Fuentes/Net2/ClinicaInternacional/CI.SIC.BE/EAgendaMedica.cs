using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    public class EAgendaMedica
    {
        public int CodigoAgenda { get; set; }
        public DateTime? Fecha { get; set; }
        public DateTime? HoraInicio { get; set; }
        public DateTime? HoraFin { get; set; }
        public bool Estado { get; set; }
        public int CodigoMedico { get; set; }

        public string EstadoDisplay { get; set; }
        public string NombresMedico { get; set; }
        public string ApellidosMedico { get; set; }
        public string DescripcionEspecialidad { get; set; }
        public string NumeroConsultorio { get; set; }
    }
}
