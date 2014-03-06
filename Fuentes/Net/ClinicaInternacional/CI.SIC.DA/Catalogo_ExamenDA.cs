using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class Catalogo_ExamenDA : BaseDA<Catalogo_ExamenDA>
    {
        public List<Examen_RequisitoBE> ListadoRequisitos(int pId_examen)
        {
            var lista = new List<Examen_RequisitoBE>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@id_examen", pId_examen);
            //parameters.Add("@fecha", pFecha);

            //if (pTipo == "T")
            //    lista.Add(new ConsultorioBE { Id_consultorio = 0, Descripcion = "Todos", Nro_consultorio = "Todos" });

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Lista_Examen_Requisito", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new Examen_RequisitoBE
                    {
                        Id_examen = reader.GetInt32(reader.GetOrdinal("Id_examen")),
                        //Descripcion = reader.GetString(reader.GetOrdinal("Descripcion")),
                        Requisito = reader.GetString(reader.GetOrdinal("Requisito"))
                    });
                }
            }
            return lista;
        }
    }
}
