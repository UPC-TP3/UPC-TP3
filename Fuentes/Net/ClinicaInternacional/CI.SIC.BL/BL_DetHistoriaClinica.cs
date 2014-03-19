using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.DA;
using CI.SIC.BE;


namespace CI.SIC.BL
{
    public class BL_DetHistoriaClinica : BaseBL<BL_DetHistoriaClinica>
    {
        public List<BE_DetHistoriaClinica> fn_ListarDetHistoriaClinica(int p_nIdPaciente)
        {
            return DAO_DetHistoriaClinica.Instancia.fn_ListarDetHistoriaClinica(p_nIdPaciente);
        }


    }
}
