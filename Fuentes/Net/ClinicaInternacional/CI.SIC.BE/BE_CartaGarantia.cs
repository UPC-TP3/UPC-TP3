using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_CartaGarantia
    {
        public int ID_Carta { get; set; }
        public int ID_Orden_de_Procedimiento { get; set; }
        public int CodPresupuesto { get; set; }
        public int ID_Paciente{ get; set; }
        public int CodAseguradora { get; set; }
        public DateTime FecINiVigencia { get; set; }
        public DateTime FecFinVigencia { get; set; }
        public decimal MontoCarta { get; set; }
        public string Detalle { get; set; }
        public int Estado { get; set; }
    }
}
