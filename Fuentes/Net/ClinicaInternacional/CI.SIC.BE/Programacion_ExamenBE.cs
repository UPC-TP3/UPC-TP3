using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class Programacion_ExamenBE
    {
        public int Id_programacion { get; set; }
        public int Id_consultorio { get; set; }
        public int Id_examen { get; set; }
        public int Id_personal { get; set; }
        public DateTime Fecha { get; set; }
        public TimeZone Hora { get; set; }
        public string Estado { get; set; }
        public int Id_orden_examen { get; set; }
    }
}
