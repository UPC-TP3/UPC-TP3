using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class LocalBE
    {
        public int Id_local { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
    }
}
