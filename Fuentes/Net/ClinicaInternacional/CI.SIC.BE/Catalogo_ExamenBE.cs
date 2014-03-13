using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Catalogo_ExamenBE
    {
        public int Id_examen { get; set; }
        public string Nom_examen { get; set; }
        public decimal Precio { get; set; }
        public decimal Duracion { get; set; }
        public int Id_tpo_examen { get; set; }
    }
}
