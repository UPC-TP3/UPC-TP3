using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class ConsultorioBE
    {
        public string Id_consultorio { get; set; }
        public string Descripcion { get; set; }
        public string Nro_consultorio { get; set; }
        public int Id_local { get; set; }
        public int Id_tpo_examen { get; set; }
    }
}
