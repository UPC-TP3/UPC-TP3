using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class DAO_Comprobante_Pago : BaseDA<DAO_Comprobante_Pago>
    {
        public bool Insertar(BE_Comprobante_Pago pComprabante_PagoBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                
                parameters.Add("@FechaComprobante", pComprabante_PagoBE.FechaComprobante);
                parameters.Add("@TipoComprobante", pComprabante_PagoBE.TipoComprobante);
                parameters.Add("@FormaDePago", pComprabante_PagoBE.FormaDePago);
                parameters.Add("@MontoComprobante", pComprabante_PagoBE.MontoComprobante);
                parameters.Add("@ConceptoDePago", pComprabante_PagoBE.ConceptoDePago);
                parameters.Add("@ID_Cita", pComprabante_PagoBE.ID_Cita);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_Insert_Comprobante_Pago", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }
    }
}
