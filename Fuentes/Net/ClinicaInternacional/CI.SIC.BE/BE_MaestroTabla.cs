using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_MaestroTabla
    {
        public string MAS_CodTabla { get; set; }
        public string MAS_CodCampo { get; set; }
        public string MAS_DesCorta { get; set; }
        public string MAS_DesLarga { get; set; }
        public string MAS_Valor { get; set; }
        public string MAS_Estado { get; set; }
    }
}
