using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class LocalDA : BaseDA<LocalDA>
    {
        public List<LocalBE> Listado(string pTipo)
        {
            var lista = new List<LocalBE>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            //parameters.Add("@id_orden_examen", pId_orden_examen);
            //parameters.Add("@fecha", pFecha);

            if (pTipo == "T")
                lista.Add(new LocalBE { Id_local = 0, Nombre = "Todos" });
            if (pTipo == "S")
                lista.Add(new LocalBE { Id_local = 0, Nombre = "Seleccione" });

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Lista_Local", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new LocalBE
                    {
                        Id_local = reader.GetInt32(reader.GetOrdinal("Id_local")),
                        Nombre = reader.GetString(reader.GetOrdinal("Nombre")),
                    });
                }
            }
            return lista;
        }
    }
}
