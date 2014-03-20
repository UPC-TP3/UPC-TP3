using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class InformeResultadoDA : BaseDA<InformeResultadoDA>
    {
        public bool Nuevo(InformeResultadoBE pInformeResultadoBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                if (pInformeResultadoBE.Imagen == null)
                    pInformeResultadoBE.Imagen = "";

                parameters.Add("@id_orden_examen", pInformeResultadoBE.Id_orden_examen);
                parameters.Add("@resultado", pInformeResultadoBE.Resultado);
                parameters.Add("@observacion", pInformeResultadoBE.Observacion);
                parameters.Add("@estado", pInformeResultadoBE.Estado);
                parameters.Add("@imagen", pInformeResultadoBE.Imagen);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("pa_Nuevo_Informe_Resultado", parameters);

                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public bool Modificar(InformeResultadoBE pInformeResultadoBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                if (pInformeResultadoBE.Imagen == null)
                    pInformeResultadoBE.Imagen = "";

                parameters.Add("@id_orden_examen", pInformeResultadoBE.Id_orden_examen);
                parameters.Add("@resultado", pInformeResultadoBE.Resultado);
                parameters.Add("@observacion", pInformeResultadoBE.Observacion);
                parameters.Add("@estado", pInformeResultadoBE.Estado);
                parameters.Add("@imagen", pInformeResultadoBE.Imagen);
                parameters.Add("@adicional", pInformeResultadoBE.Adicional);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("pa_Modificar_Informe_Resultado", parameters);

                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public InformeResultadoBE Registro(int pId_orden_examen)
        {
            InformeResultadoBE lista = null;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@id_orden_examen", pId_orden_examen);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Registro_Informe_Resultado", parameters))
            {
                while (reader.Read())
                {
                    lista = (new InformeResultadoBE
                    {
                        Fecha = reader.GetDateTime(reader.GetOrdinal("Fecha")),
                        Id_orden_examen = reader.GetInt32(reader.GetOrdinal("Id_orden_examen")),
                        Resultado = reader.GetString(reader.GetOrdinal("Resultado")),
                        Observacion = reader.GetString(reader.GetOrdinal("Observacion")),
                        Estado = reader.GetString(reader.GetOrdinal("Estado")),
                        Imagen = reader.GetString(reader.GetOrdinal("Imagen")),
                        Adicional = reader.GetString(reader.GetOrdinal("adicional"))
                    });
                }
            }
            return lista;
        }
    }
}
