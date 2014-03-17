using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class VerificacionBL : BaseBL<VerificacionBL>
    {
        public IList<EvaluacionDetalleBE> Listar(int id)
        {
            return VerificacionDA.Instancia.Listar(id);
        }
    }
}
