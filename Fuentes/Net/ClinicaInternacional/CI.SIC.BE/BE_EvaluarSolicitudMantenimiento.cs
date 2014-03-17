using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_EvaluarSolicitudMantenimiento
    {
        public int Nrosolicitud { get; set; }
        public string Fechacreacion { get; set; }
        public string Codigosolicitante {get;set;}
        public string Tiposervicio { get; set; }
        public string Tiposerviciodesc { get; set; }
        public string Tipomantenimiento { get; set; }
        public string Numeroequipo { get; set; }
        public string FechaIncidencia { get; set; }
        public string Detalleservicio { get; set; }
        public string Observaciones { get; set; }
        public string Prioridad { get; set; }
        public int Estado { get; set; }
        public string Estadodesc { get; set; }
    }
}
