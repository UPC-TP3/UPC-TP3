using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BL
{
    public class EMedico
    {
        public int CodigoMedico { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public int CodigoEspecialidad { get; set; }
        public string DescripcionEspecialidad { get; set; }
        public string NumeroColegiatura { get; set; }
    }
}
