using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_Medico : BaseBL<BL_Medico>
    {

        public List<BE_Medico> GetMedico()
        {
            try
            {
                return DAO_Medico.Instancia.GetMedicos();
            }
            catch (Exception)
            {                
                throw;
            }
           
        }
    }
}
