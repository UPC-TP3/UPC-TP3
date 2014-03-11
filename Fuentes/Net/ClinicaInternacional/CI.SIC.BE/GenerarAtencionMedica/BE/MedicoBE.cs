using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE.GenerarAtencionMedica.BE
{
    public class MedicoBE
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellidoPaterno { get; set; }
        public string apellidoMaterno { get; set; }
        public string dni { get; set; }
        public string nombrecompleto
        {
            get
            {
                return nombre + " " + apellidoPaterno + " " + apellidoMaterno;
            }            
        }
    }
}
