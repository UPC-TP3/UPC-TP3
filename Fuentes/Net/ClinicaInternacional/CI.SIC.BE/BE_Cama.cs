using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    public class BE_Cama
    {
        public int ID_Cama { get; set; }
        public string  NroCama { get; set; }
        public string TipoCama { get; set; }
        public string Ubicacion { get; set; }
        public string Estado { get; set; }
        public int ID_Hoja_Ingreso_Hospitalizacion { get; set; }
    }
}
