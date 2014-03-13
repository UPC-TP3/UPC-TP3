using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Historia_ClinicaBE
    {
        public int Id_historia { get; set; }
        public int Id_paciente { get; set; }
        public DateTime Fecha { get; set; }
    }
}
