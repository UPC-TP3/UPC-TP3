using System;
using System.Collections.Generic;

namespace CI.SIC.BE
{
    public class EvaluacionBE
    {
        public int IdEvaluacion { get; set; }
        public int IdInstalacion { get; set; }
        public int Disponibilidad { get; set; }
        public int Resultado { get; set; }
        public string Observaciones { get; set; }
        public string NombreEnfermeroAuxiliar { get; set; }
        public DateTime Fecha { get; set; }
        public List<EvaluacionDetalleBE> Detalle { get; set; }

        public string NombreDisponibilidad { get; set; }
        public string NombreResultado { get; set; }
    }
}
