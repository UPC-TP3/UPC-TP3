using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    public class CamaBE
    {
        public int ID_Cama { get; set; }
        public string GA_NroCama { get; set; }
        public string GA_TipoCama { get; set; }
        public string GA_Ubicacion { get; set; }
        public string GA_Estado { get; set; }

        public DateTime FechaActualizacion{ get; set; }
public string EnfermeroActualizador{ get; set; }
public string Observacion{ get; set; }

        public int ID_Hoja_Ingreso_Hospitalizacion { get; set; }
    }
}
