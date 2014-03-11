using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE.GenerarAtencionMedica.BE;
using CI.SIC.DA.GenerarAtencionMedica.DA;

namespace CI.SIC.BL.GenerarAtencionMedica.BL
{
    public class TurnoBL
    {
        public List<MedicoBE> ListarMedicosPorTurno(string turno)
        {
            return new TurnoDA().ListarMedicosPorTurno(turno);
        }
    }
}
