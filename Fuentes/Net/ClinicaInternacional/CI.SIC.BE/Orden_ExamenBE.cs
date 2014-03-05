using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Orden_ExamenBE
    {
        public int Id_orden_examen { get; set; }
        public int Id_medico { get; set; }
        public string Medico { get; set; }
        public int Id_orden_atencion { get; set; }
        public string Tipo_atencion { get; set; }
        public string Paciente { get; set; }
        public int Id_historia { get; set; }
        public DateTime Fecha { get; set; }
        public int Id_examen { get; set; }
        public int Id_tpo_examen { get; set; }
        public string Examen { get; set; }
        public string Estado { get; set; }
        public decimal Precio { get; set; }
    }
}
