using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class MedicoBE
    {
        public int Id_medido { get; set; }
        public string Nom_medico { get; set; }
        public string Ape_medico { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
    }
}
