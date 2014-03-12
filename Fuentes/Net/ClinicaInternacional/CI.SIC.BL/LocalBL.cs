using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class LocalBL : BaseBL<LocalBL>
    {
        public List<LocalBE> Listado(string pTipo)
        {
            List<LocalBE> result = null;
            result = LocalDA.Instancia.Listado(pTipo);
            return result;
        }
    }
}
