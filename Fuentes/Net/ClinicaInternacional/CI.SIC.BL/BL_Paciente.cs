using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_Paciente : BaseBL<BL_Paciente>
    {
        public BE_Paciente GetPacienteXIdPaciente(int IdPaciente, string NroDocumento)
        {
            try
            {
                return DAO_Paciente.Instancia.GetPacienteXIdPaciente(IdPaciente, NroDocumento);
            }
            catch (Exception ex)
            {                
                throw;
            }
        }
    }
}
