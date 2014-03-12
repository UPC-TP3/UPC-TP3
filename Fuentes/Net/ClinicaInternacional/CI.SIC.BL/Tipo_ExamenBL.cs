using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class Tipo_ExamenBL : BaseBL<Tipo_ExamenBL>
    {
        public List<Tipo_ExamenBE> Listado(string pTipo)
        {
            List<Tipo_ExamenBE> result = null;
            result = Tipo_ExamenDA.Instancia.Listado(pTipo);
            return result;
        }
    }
}
