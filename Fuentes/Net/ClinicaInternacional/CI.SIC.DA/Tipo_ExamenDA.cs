using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class Tipo_ExamenDA : BaseDA<Tipo_ExamenDA>
    {
        public List<Tipo_ExamenBE> Listado(string pTipo)
        {
            var lista = new List<Tipo_ExamenBE>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            //parameters.Add("@id_orden_examen", pId_orden_examen);
            //parameters.Add("@fecha", pFecha);

            if (pTipo == "T")
                lista.Add(new Tipo_ExamenBE { Id_tpo_examen = 0, Descripcion = "Todos"});

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Lista_Tipo_Examen", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new Tipo_ExamenBE
                    {
                        Id_tpo_examen = reader.GetInt32(reader.GetOrdinal("Id_tpo_examen")),
                        Descripcion = reader.GetString(reader.GetOrdinal("Descripcion"))
                    });
                }
            }
            return lista;
        }
    }
}
