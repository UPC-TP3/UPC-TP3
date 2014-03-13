using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Orden_PagoBE
    {
        public int Id_orden_pago { get; set; }
        public DateTime Fecha { get; set; }
        public int Id_orden_examen { get; set; }
        public string Estado { get; set; }
        public decimal Importe { get; set; }
    }
}
