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
        public int Id_orden_examen { get; set; }
        public int Id_horario { get; set; }
        public string Estado { get; set; }

        public int Id_consultorio { get; set; }
        public int Id_local { get; set; }
        public int Id_examen { get; set; }
        public int Id_especialista { get; set; }
        public string Especialista { get; set; }
        public DateTime Fecha { get; set; }
        //public string Hora { get; set; }
        
        
        public int Id_historia { get; set; }
        public string Local { get; set; }
        public string Consultorio { get; set; }
        public string Examen { get; set; }
        public string Paciente { get; set; }

        public string Comentarios { get; set; }

    }
}
