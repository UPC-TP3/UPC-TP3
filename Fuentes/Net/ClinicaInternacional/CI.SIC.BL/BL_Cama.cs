using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_Cama : BaseBL<BL_Cama>
    {
        public List<BE_Cama> ListarCamas(int codEspecialidad)
        {
            try
            {
                return DAO_Cama.Instancia.ListarCamas(codEspecialidad);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
