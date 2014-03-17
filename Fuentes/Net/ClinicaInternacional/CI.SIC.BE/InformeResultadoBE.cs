using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class InformeResultadoBE
    {
        public int Id_informe { get; set; }
        public int Id_orden_examen { get; set; }
        public DateTime Fecha { get; set; }
        public string Resultado { get; set; }
        public string Observacion { get; set; }
        public string Estado { get; set; }
        public string Imagen { get; set; }
    }
}
