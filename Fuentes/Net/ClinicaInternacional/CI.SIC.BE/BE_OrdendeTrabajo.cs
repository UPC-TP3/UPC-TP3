using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{

     [Serializable]
    public class BE_OrdendeTrabajo
    {
        public int GM_NroOrden { get; set; }
        public int GM_NroSolicitud { get; set; }
        public string GM_Fecha_Creacion { get; set; }
        public string GM_CodigoSolicitante { get; set; }
        public string GM_Fecha_Inicio { get; set; }
        public string GM_Fecha_Fin { get; set; }
        public string GM_Empleados_Asociados { get; set; }
        public string GM_Prioridad { get; set; }
        public string GM_Comentarios { get; set; }
        public string GM_Estado { get; set; }
    }




}
