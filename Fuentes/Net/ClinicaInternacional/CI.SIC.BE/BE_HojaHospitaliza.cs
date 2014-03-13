using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_HojaHospitaliza
    {
        public int ID_Hoja_Ingreso_Hospitalizacion { get; set; }
        public DateTime FechaIngreso { get; set; }
        public DateTime FechaAlta { get; set; }
        public int ID_Procedencia { get; set; }
        public int TipoOrden { get; set; }
        public string Tratamiento { get; set; }  
        public int ID_Paciente { get; set; }
        public int ID_Orden_Hospitalizacion { get; set; }
        public int ID_Local { get; set; }
        public int ID_Carta { get; set; }
        public int ID_Cama { get; set; }
        public int ID_Especialidad { get; set; }
    }
}
