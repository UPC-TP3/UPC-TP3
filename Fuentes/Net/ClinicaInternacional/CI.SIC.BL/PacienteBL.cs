using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class PacienteBL : BaseBL<PacienteBL>
    {
        public PacienteBE GetPacienteXIdPaciente(int IdPaciente, string NroDocumento)
        {
            try
            {
                return PacienteDAO.Instancia.GetPacienteXIdPaciente(IdPaciente, NroDocumento);
            }
            catch (Exception ex)
            {                
                throw;
            }
        }
    }
}
