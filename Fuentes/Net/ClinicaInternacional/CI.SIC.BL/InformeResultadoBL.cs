using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class InformeResultadoBL : BaseBL<InformeResultadoBL>
    {
        public bool Nuevo(InformeResultadoBE pInformeResultadoBE)
        {
            bool result = false;
            result = InformeResultadoDA.Instancia.Nuevo(pInformeResultadoBE);

            return result;
        }

        public InformeResultadoBE Registro(int pId_orden_examen)
        {
            InformeResultadoBE result = null;
            result = InformeResultadoDA.Instancia.Registro(pId_orden_examen);
            return result;
        }
    }
}
