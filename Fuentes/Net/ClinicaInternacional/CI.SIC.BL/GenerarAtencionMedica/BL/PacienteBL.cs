using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE.GenerarAtencionMedica.BE;
using CI.SIC.DA.GenerarAtencionMedica.DA;

namespace CI.SIC.BL.GenerarAtencionMedica.BL
{
    public class PacienteBL
    {
        public PacienteBE Buscar(string dni)
        {
            return new PacienteDA().Buscar(dni);
        }

        public void Crear(PacienteBE paciente)
        {
            new PacienteDA().Crear(paciente);
        }        
    }
}
