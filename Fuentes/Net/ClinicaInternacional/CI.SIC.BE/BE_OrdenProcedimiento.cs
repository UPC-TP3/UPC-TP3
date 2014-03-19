using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_OrdenProcedimiento
    {
        public int ID_Orden_de_Procedimiento { get; set; }
        public DateTime FechaOrdenProcedimiento { get; set; }
        public string NombreOrdenProcedimiento { get; set; }
        public string CartaGarantia { get; set; }
        public int ID_Paciente { get; set; }
        public int ID_Medico { get; set; }
        public string Estado { get; set; }
        public string Aseguradora { get; set; }      
    }
}
