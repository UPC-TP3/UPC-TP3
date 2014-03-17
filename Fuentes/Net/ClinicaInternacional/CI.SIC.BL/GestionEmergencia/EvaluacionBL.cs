using System.Collections.Generic;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class EvaluacionBL : BaseBL<EvaluacionBL>
    {
        public IList<EvaluacionBE> Listar()
        {            
            return EvaluacionDA.Instancia.Listar();
        }

        public EvaluacionBE Obtener(int id)
        {
            return EvaluacionDA.Instancia.Obtener(id);
        }

        public int Grabar(EvaluacionBE evaluacion)
        {
            return EvaluacionDA.Instancia.Grabar(evaluacion);
        }  

    }
}
