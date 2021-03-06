﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    public  class ECitaDomiciliaria
    {

        public int CodigoCita { get; set; }

        public int CodigoMedico { get; set; }
        public int CodigoPaciente { get; set; }
        public int CodigoAgenda { get; set; }
        public DateTime? FechaAgenda { get; set; }
        //public DateTime? HoraInicioAgenda { get; set; }
        //public DateTime? HoraFinAgenda { get; set; }
        public bool AtencionLocal { get; set; }
        public string DireccionDomicilio { get; set; }
        public string ReferenciaDomicilio { get; set; }
        public string SintomasPaciente { get; set; }
        public string Aseguradora { get; set; }
        public string Cobertura { get; set; }

        public string NombrePaciente { get; set; }
        public string NombreMedico { get; set; }

        public string NombresMedico { get; set; }
        public string ApellidosMedico { get; set; }

        public int Id_Especialidad { get; set; }
        public string DescripcionEspecialidad { get; set; }
        public string NumeroColegiatura { get; set; }

        public string NombresPaciente { get; set; }
        public string ApellidosPaciente { get; set; }


        public string NumeroConsultorio { get; set; }
        public string Dni { get; set; }
        public string Horario_Turno { get; set; }  

    }
}
