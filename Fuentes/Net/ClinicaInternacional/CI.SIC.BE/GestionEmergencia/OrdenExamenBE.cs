using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    public class OrdenExamenBE
    {
        public int IdAtencion { get; set; }
        public int IdMedico { get; set; }
        public string Estado { get; set; }        
        public DateTime Fecha { get; set; }
        public int IdPaciente { get; set; }
        public string Detalle { get; set; }        
        public int IdExamen { get; set; }
    }
}
