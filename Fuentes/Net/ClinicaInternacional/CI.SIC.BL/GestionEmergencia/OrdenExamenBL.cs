using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class OrdenExamenBL : BaseBL<OrdenExamenBL>
    {
        
        public void Grabar(OrdenExamenBE ordenExamen)
        {
            OrdenExamenDA.Instancia.Grabar(ordenExamen);
        }
    }
}
