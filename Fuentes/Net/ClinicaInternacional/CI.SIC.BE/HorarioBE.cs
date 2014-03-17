using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class HorarioBE
    {
        public int Id_horario { get; set; }
        public int Id_consultorio { get; set; }
        public int Id_medico { get; set; }
        public string Medico { get; set; }
        //public DateTime Fecha { get; set; }
        public string Fecha { get; set; }
    }
}
