using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_SolicitudMantenimiento
    {
        public int Nrosolicitud { get; set; }
        public string Fechacreacion { get; set; }
        public string EmpleadoSol { get; set; }
        public string EmpleadoBen { get; set; }
        public string NomSolicitante { get; set; }
        public string CodigoCC { get; set; }
        public string Detalleservicio { get; set; }
        public string Numeroequipo { get; set; }
        public string Fechaincidencia { get; set; }
        public string Tiposervicio { get; set; }
        public string NomTiposervicio { get; set; }
        public int Activo { get; set; }
        public string Tipomantenimiento { get; set; }
        public string Observaciones { get; set; }
        public string Especificacion { get; set; }        
        public string Area { get; set; }
        public int Estado { get; set; }
        public string NomEstado { get; set; }
    }
}
