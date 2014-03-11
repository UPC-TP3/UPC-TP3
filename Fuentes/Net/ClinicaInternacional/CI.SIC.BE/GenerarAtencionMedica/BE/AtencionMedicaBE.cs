using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE.GenerarAtencionMedica.BE
{
    public class AtencionMedicaBE
    {
        public int id { get; set; }
        public DateTime fechaIngreso { get; set; }
        public int medico { get; set; }
        public int paciente { get; set; }
        public string observaciones { get; set; }
    }
}
