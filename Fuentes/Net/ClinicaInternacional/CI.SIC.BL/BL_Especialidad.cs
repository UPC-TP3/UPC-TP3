using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_Especialidad : BaseBL<BL_Especialidad>
    {
        public List<BE_Especialidad> GetEspecialidad()
        {
            try
            {
                return DAO_Especialidad.Instancia.GetEspecialidad();
            }
            catch (Exception)
            {                
                throw;
            }
        }
    }
}
