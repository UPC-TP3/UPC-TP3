using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_Medico
    {
        public int ID_Medico { get; set; }
        public string nom_medico { get; set; }
        public string ape_medico { get; set; }
        public string num_cmp { get; set; }
        public string email { get; set; }
        public string telefono { get; set; }
        public string Direccion { get; set; }
        public string Celular { get; set; }
        public string TelefonoDomicilio { get; set; }
        public string FechaCertificacion { get; set; }
        public string CentroEstudios { get; set; }
        public string CodigoColegiatura { get; set; }
    }
}
