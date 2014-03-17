using System.Collections.Generic;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class InstalacionBL : BaseBL<InstalacionBL>
    {
        public IList<InstalacionBE> Listar()
        {
            return InstalacionDA.Instancia.Listar();
        }

    }
}
