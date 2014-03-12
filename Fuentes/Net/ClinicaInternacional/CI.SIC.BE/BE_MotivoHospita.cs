using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_MotivoHospita
    {
        public int ID_Motivo_Hospitalizacion { get; set; }
        public string DescripcionInternamiento { get; set; }
        public int Estado { get; set; }
    }
}
