using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class Orden_PagoDA : BaseDA<Orden_PagoDA>
    {
        public bool Nuevo(Orden_PagoBE pOrden_PagoBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();


                parameters.Add("@id_orden_examen", pOrden_PagoBE.Id_orden_examen);
                parameters.Add("@estado", pOrden_PagoBE.Estado);
                parameters.Add("@importe", pOrden_PagoBE.Importe);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("pa_Nuevo_Orden_Pago", parameters);
                
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public int Correlativo()
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();


                parameters.Add("@tabla", "TB_ORDEN_SERVICIO");


                int rpta = Convert.ToInt32(SqlHelper.Instance.ExecuteScalar("pa_Obtener_Correlativo", parameters));

                return rpta;
            }
            catch { throw; }
        }
    }
}
