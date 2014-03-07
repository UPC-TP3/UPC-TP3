using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class IngresoHospitalizacionBE
    {
        public int ID_Hoja_Ingreso_Hospitalizacion { get; set; }
        public DateTime GA_FechaIngreso { get; set; }
        public DateTime GA_HoraIngreso { get; set; }
        public string GA_ViaIngreso { get; set; }
        public string GA_TipoOrden { get; set; }
        public string GA_Tratamiento { get; set; }
        public int ID_Paciente { get; set; }
        public int GA_CartaGarantia { get; set; }
    }
}
