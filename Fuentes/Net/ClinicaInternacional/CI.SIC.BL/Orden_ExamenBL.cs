using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class Orden_ExamenBL : BaseBL<Orden_ExamenBL>
    {
        public Orden_ExamenBE Registro(int pId_orden_examen)
        {
            Orden_ExamenBE result = null;
            result = Orden_ExamenDA.Instancia.Registro(pId_orden_examen);
            return result;
        }  
    }
}
