using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Medico_EspecialidadBE
    {
        public int Id_medico { get; set; }
        public int Id_especialidad { get; set; }
    }
}
