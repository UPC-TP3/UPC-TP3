using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Tipo_ExamenBE
    {
        public int Id_tpo_examen { get; set; }
        public string Descripcion { get; set; }
    }
}
