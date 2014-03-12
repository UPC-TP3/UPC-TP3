using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_Sede
    {
        public int ID_Local { get; set; }
        public string nombre { get; set; }
        public string direccion { get; set; }
    }
}
