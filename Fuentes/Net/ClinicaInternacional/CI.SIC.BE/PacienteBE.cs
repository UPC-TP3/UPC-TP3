using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class PacienteBE
    {
        public int Id_paciente { get; set; }
        public string DNI { get; set; }
        public string Nombres { get; set; }
        public int Apellidos { get; set; }
        public string Estado { get; set; }

   }
}
