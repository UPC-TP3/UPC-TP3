using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class OrdenHospitalizacionBE
    {
        public int ID_Orden_Hospitalizacion { get; set; }
        public DateTime GA_FechaOrden { get; set; }
        public string GA_Prevision { get; set; }
        public string GA_Motivo { get; set; }
        public string GA_Tratamiento { get; set; }
        public int GA_NroDiasHospitalizacion { get; set; }
        public int GA_ExamenesPreOperatorios { get; set; }
        public string GA_MedicoTratante { get; set; }
        public string GA_MedicoTurno { get; set; }
        public DateTime FechaHora { get; set; }
        public DateTime FechaHoraAlta { get; set; }
        public int ID_Motivo_Hospitalizacion { get; set; }
        public int ID_Consulta { get; set; }
        public int ID_Paciente { get; set; }
        public int GA_Procedencia { get; set; }
    }
}
