using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_Empleado
    {
        //Espera!!!
        //E upo de dato  esta bien String!!  se trata de .net
        //Para esta clase losmetodos son los mismos GET y SET
        public int ID_Empleado { get; set; }
        public string E_Nombre { get; set; }
        public string E_Apellido_Paterno { get; set; }
        public string E_Apellido_Materno { get; set; }
        public string E_dni { get; set; }
        public string E_Direccion { get; set; }
        public string E_Telefono { get; set; }
        public string E_Tipo_Empleado { get; set; }
        public string E_Fecha_Nacimiento { get; set; }
        public string E_Correo { get; set; }
        public string Apellidos_Empleado { get; set; }
        public string Nombres_Empleado { get; set; }
        public string Cargo_Empleado { get; set; }
        public string Correo_Empleado { get; set; }
        public int Estado { get; set; }
        public int ID_TURNOEMERGENCIA { get; set; }
        public int ID_Tipo_Empleado { get; set; }
        public int ID_Especialidad { get; set; }
    }
}
