using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_Paciente
    {
        public int ID_Paciente { get; set; }             
        public string dni_paciente { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Celular { get; set; }
        public string TelefonoDomicilio { get; set; }
        public int ID_Pais { get; set; }
        public int ID_Departamento { get; set; }
        public int ID_Provincia { get; set; }
        public int ID_Distrito { get; set; }
        public string Direccion { get; set; }
        public int ID_Sexo { get; set; }
        public string SexoDescripcion { get; set; }
        public string Ocupacion { get; set; }
        public int ID_TipoDocumento { get; set; }
        public string TipoDocumentoNombre { get; set; }
        public string Nombres { get; set; }
        public string ApellidoPat { get; set; }
        public string ApellidoMat { get; set; }
        public int ID_EstadoCivil { get; set; }        
        public string correo { get; set; }
        public string Observacion { get; set; }
        public string NombreTipoDocumento { get; set; }
        public string Anonimo { get; set; }
        public string TipoDocumento { get; set; }
        public string DescSexo { get; set; }
    }
}
