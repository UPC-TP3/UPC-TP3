using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class ConsultorioDA : BaseDA<ConsultorioDA>
    {
        public List<ConsultorioBE> Listado(string pTipo, int pId_local, int pId_tpo_examen)
        {
            var lista = new List<ConsultorioBE>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@id_local", pId_local);
            parameters.Add("@id_tpo_examen", pId_tpo_examen);

            if (pTipo == "T")
                lista.Add(new ConsultorioBE { Id_consultorio = 0, Descripcion = "Todos", Nro_consultorio= "Todos" });

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Lista_Consultorio", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new ConsultorioBE
                    {
                        Id_consultorio = reader.GetInt32(reader.GetOrdinal("Id_consultorio")),
                        //Descripcion = reader.GetString(reader.GetOrdinal("Descripcion")),
                        Nro_consultorio = reader.GetString(reader.GetOrdinal("Nro_consultorio"))
                    });
                }
            }
            return lista;
        }
    }
}
