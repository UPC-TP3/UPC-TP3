using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_Hospitalizacion : BaseBL<BL_Hospitalizacion>
    {
        public bool insertIngresoHosp(BE_HojaHospitaliza objIngreso)
        {
            try
            {
                return DAO_Hospitalizacion.Instancia.insertIngresoHosp(objIngreso);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public BE_OrdenHospitaliza getOrdeByCodigo(int codOrden)
        {
            try
            {
                return DAO_Hospitalizacion.Instancia.getOrdeByCodigo(codOrden);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
