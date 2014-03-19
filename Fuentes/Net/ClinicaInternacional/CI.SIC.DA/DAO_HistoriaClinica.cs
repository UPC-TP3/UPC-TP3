using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;


namespace CI.SIC.DA
{
    public class DAO_HistoriaClinica : BaseDA<DAO_HistoriaClinica>
    {

        public int fn_RegistrarHC(BE_HistoriaClinica p_objHC)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@IntervecionQ", p_objHC.IntervencionQ);
                parameters.Add("@Alergias", p_objHC.Alergias);
                parameters.Add("@ID_Paciente", p_objHC.ID_Paciente);
                parameters.Add("@ID_GrupoSanguineo", p_objHC.ID_GrupoSanguineo);
                parameters.Add("@ID_Procedencia", p_objHC.ID_Procedencia);
                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_RegistrarHistoriaClinica", parameters);
                return rpta;
            }
            catch { throw; }
        }

    }
}
