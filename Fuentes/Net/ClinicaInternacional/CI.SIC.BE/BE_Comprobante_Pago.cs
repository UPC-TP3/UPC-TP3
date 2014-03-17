using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_Comprobante_Pago
    {
        public int ID_Comprobante_Pago { get; set; }
        public DateTime FechaComprobante { get; set; }
        public string TipoComprobante { get; set; }
        public string FormaDePago { get; set; }
        public decimal MontoComprobante { get; set; }
        public string ConceptoDePago { get; set; }
        public int ID_Cita { get; set; }  

    }
}
