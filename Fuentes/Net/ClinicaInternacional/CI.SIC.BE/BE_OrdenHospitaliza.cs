using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_OrdenHospitaliza
    {
        public int ID_Orden_Hospitalizacion { get; set; }
        public DateTime FechaOrden { get; set; }
        public string Prevision { get; set; }
        
        public string Tratamiento { get; set; }
        public int NroDiasHospitalizacion { get; set; }
        public string ExamenesPreOperatorios { get; set; }
        public int ID_MedicoTratante { get; set; }
        public int ID_MedicoTurno { get; set; }
        public int ID_Paciente { get; set; }
        public DateTime FechaHora { get; set; }
        public string Observaciones { get; set; }
        public DateTime FechaHoraAlta { get; set; }
        public int ID_Motivo_Hospitalizacion { get; set; }
        public int ID_Consulta { get; set; }
        public int ID_Local { get; set; }
        public int ID_Estado { get; set; }

        //-----------adicionales------------
        public string MedTratante { get; set; }
        public string MedTurno { get; set; }
        public string Paciente { get; set; }
        public string DescripcionInternamiento { get; set; }
        //-----------adicionales------------
    }
}
