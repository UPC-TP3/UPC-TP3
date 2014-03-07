using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class IngresoHospitalizacion : BaseBL<IngresoHospitalizacion>
    {
        public bool insertIngresoHosp(IngresoHospitalizacionBE objIngreso)
        {
            try
            {
                return IngresoHospitalizacionDAO.Instancia.insertIngresoHosp(objIngreso);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public List<CamaBE> ListarCamas(int codEspecialidad)
        {
            try
            {
                return IngresoHospitalizacionDAO.Instancia.ListarCamas(codEspecialidad);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
