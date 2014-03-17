using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE.GenerarAtencionMedica.BE
{
    public class PacienteBE
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellidoPaterno { get; set; }
        public string apellidoMaterno { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string dni { get; set; }
    }
}
