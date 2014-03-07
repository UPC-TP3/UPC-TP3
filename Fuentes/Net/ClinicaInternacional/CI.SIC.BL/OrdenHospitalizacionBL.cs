using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class OrdenHospitalizacionBL : BaseBL<OrdenHospitalizacionBL>
    {
         public OrdenHospitalizacionBE getOrdeByCodigo(int codOrden)
        {
            try
            {
                return OrdenHospitalizacionDAO.Instancia.getOrdeByCodigo(codOrden);
            }
            catch (Exception)
            {
                throw;
            }         
         }

        
    }
}
