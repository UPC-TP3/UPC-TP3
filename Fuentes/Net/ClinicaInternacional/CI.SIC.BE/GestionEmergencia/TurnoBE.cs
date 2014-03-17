using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE.GenerarAtencionMedica.BE
{
    public class TurnoBE
    {
        public int id { get; set; }
        public int medico { get; set; }
        public string turno { get; set; }
        public DateTime inicio { get; set; }
        public DateTime fin { get; set; }
    }
}
