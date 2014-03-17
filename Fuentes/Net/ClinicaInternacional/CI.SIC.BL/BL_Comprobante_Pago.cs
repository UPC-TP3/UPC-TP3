using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_Comprobante_Pago : BaseBL<BL_Comprobante_Pago>
    {
        public bool Nuevo(BE_Comprobante_Pago pComprobante_PagoBE)
        {
            bool result = false;
            result = DAO_Comprobante_Pago.Instancia.Insertar(pComprobante_PagoBE);

            return result;
        }
    }
}
