using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
   public class ERecetaMedica
    {
        public int Id_PrescripcionMedica { get; set; }

        public int Id_Medico { get; set; }
        public int Id_Paciente { get; set; }
        public DateTime? FechaPrescripcion { get; set; } 

        public int Id_Consulta { get; set; }
       
        public int Id_Medicamento { get; set; }

        public string NombreMedicamento { get; set; }
        public string Dosis { get; set; }
        public string Frecuencia { get; set; }
        public string Observacion { get; set; }
    }
}
