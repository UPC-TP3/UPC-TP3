using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_CartaGarantia : BaseBL<BL_CartaGarantia>
    {
        public BE_CartaGarantia GetCartaGarantiaXCodigo(int codCarta)
        {
            try
            {
                return DAO_CartaGarantia.Instancia.GetCartaGarantiaXCodigo(codCarta);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
