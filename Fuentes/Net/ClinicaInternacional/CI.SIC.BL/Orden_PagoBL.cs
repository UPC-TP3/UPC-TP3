using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class Orden_PagoBL : BaseBL<Orden_PagoBL>
    {
        public bool Nuevo(Orden_PagoBE pOrden_PagoBE)
        {
            bool result = false;
            result = Orden_PagoDA.Instancia.Nuevo(pOrden_PagoBE);

            return result;
        }

        public int Correlativo()
        {
            int result = 0;
            result = Orden_PagoDA.Instancia.Correlativo();
            return result;
        }
    }
}
