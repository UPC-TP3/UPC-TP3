using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Orden_Examen_DetalleBE
    {
        public int Id_orden_examen { get; set; }
        public int Id_examen { get; set; }
        public string Estado { get; set; }
        public string Tipo_atencion { get; set; }
        public string Observacion { get; set; }
    }
}
