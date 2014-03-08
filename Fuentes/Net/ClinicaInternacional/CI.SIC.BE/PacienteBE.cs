using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class PacienteBE
    {
        public int ID_Paciente { get; set; }
        public string GA_Nombre { get; set; }
        public string ApellidoPat { get; set; }
        public string ApellidoMat { get; set; }
        public string GA_DocumentoIdentidad { get; set; }
        public string GA_EstadoCivil { get; set; }
        public DateTime GA_FechaNacimiento { get; set; }
        public string GA_Celular { get; set; }
        public string GA_TelefonoDomicilio { get; set; }
        public string GA_Pais { get; set; }
        public string GA_Departamento { get; set; }
        public string GA_Provincia { get; set; }
        public string GA_Distrito { get; set; }
        public string GA_Direccion { get; set; }
        public string GA_Sexo { get; set; }
        public int ID_TipoDocumento { get; set; }
        public string correo { get; set; }
        public string Nombres { get; set; }
        public string Estado { get; set; }
   }
}
