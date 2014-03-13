using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Examen_RequisitoBE
    {
        public int Id_examen { get; set; }
        public int Id_requisito { get; set; }
        public string Requisito { get; set; }
    }
}
