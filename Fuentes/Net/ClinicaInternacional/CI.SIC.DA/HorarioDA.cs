using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class HorarioDA : BaseDA<HorarioDA>
    {
        public List<HorarioBE> Listado(string pTipo, int pId_consultorio)
        {
            var lista = new List<HorarioBE>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@id_consultorio", pId_consultorio);
            //parameters.Add("@fecha", pFecha);

            //if (pTipo == "S")
            //    lista.Add(new HorarioBE { Id_horario = 0, Medico = "", Fecha = "Seleccione" });

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Lista_Horario", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new HorarioBE
                    {
                        Id_horario = reader.GetInt32(reader.GetOrdinal("Id_horario")),
                        Fecha = reader.GetDateTime(reader.GetOrdinal("Fecha")),
                        Medico = reader.GetString(reader.GetOrdinal("Medico"))
                    });
                }
            }
            return lista;
        }

        public HorarioBE Registro(int pId_horario)
        {
            HorarioBE lista = null;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@id_horario", pId_horario);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Registro_Horario", parameters))
            {
                while (reader.Read())
                {
                    lista = (new HorarioBE
                    {
                        Fecha = reader.GetDateTime(reader.GetOrdinal("Fecha")),
                        Medico = reader.GetString(reader.GetOrdinal("Medico")),
                        Id_consultorio = reader.GetInt32(reader.GetOrdinal("Id_consultorio")),
                        Id_medico = reader.GetInt32(reader.GetOrdinal("Id_medico"))
                    });
                }
            }
            return lista;
        }
    }
}