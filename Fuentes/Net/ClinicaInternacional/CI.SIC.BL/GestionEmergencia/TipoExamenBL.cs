using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class TipoExamenBL : BaseBL<TipoExamenBL>
    {
        public IList<TipoExamenBE> Listar()
        {
            return TipoExamenDA.Instancia.Listar();
        }
    }
}
