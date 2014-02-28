using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Orden_ExamenBE
    {
        public int Id_orden_examen { get; set; }
        public int Id_medico { get; set; }
        public int Id_orden_atencion { get; set; }
        public DateTime Fecha { get; set; }
        public string Estado { get; set; }
    }
}
