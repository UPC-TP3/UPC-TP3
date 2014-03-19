using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_HistoriaClinica
    {
        public int ID_Historia { get; set; }
        public DateTime FechaRegistro { get; set; }
        public string Antecedentes { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaAtencion { get; set; }
        public int ID_Paciente { get; set; }
        public int ID_GrupoSanguineo { get; set; }
        public string IntervencionQ { get; set; }
        public string Alergias { get; set; }

        public int ID_Procedencia { get; set; }
    }

}
