using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class ConsultorioBL : BaseBL<ConsultorioBL>
    {
        public List<ConsultorioBE> Listado(string pTipo, int pId_local, int pId_tpo_examen)
        {
            List<ConsultorioBE> result = null;
            result = ConsultorioDA.Instancia.Listado(pTipo, pId_local, pId_tpo_examen);
            return result;
        }
    }
}
