using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_MaestroTablas : BaseBL<BL_MaestroTablas>
    {
        public List<BE_MaestroTabla> GetDatatabla(string codTabla)
        {
            try
            {
                return DAO_MaestroTablas.Instancia.GetDatatabla(codTabla);
            }
            catch (Exception)
            {                
                throw;
            }
        }

        public List<BE_MotivoHospita> GetMotivosHospitaliza()
        {
            try
            {
                return DAO_MaestroTablas.Instancia.GetMotivosHospitaliza();
            }
            catch (Exception)
            {
                throw;
            }

        }

        public List<BE_Sede> GetSedes()
        {
            try
            {
                return DAO_MaestroTablas.Instancia.GetSedes();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
    }
}
