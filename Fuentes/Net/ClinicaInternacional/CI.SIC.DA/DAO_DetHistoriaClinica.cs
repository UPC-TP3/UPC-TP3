using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class DAO_DetHistoriaClinica : BaseDA<DAO_DetHistoriaClinica>
    {


        public List<BE_DetHistoriaClinica> fn_ListarDetHistoriaClinica(int p_nIdPaciente)
        {
            var lista = new List<BE_DetHistoriaClinica>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@ID_Paciente", p_nIdPaciente);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_DetalleHistoriClinica", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_DetHistoriaClinica
                    {
                        ID_DetHistoria = reader.GetInt32(reader.GetOrdinal("ID_DetHistoria")),
                        ID_Historia = reader.GetInt32(reader.GetOrdinal("ID_Historia")),
                        Procedencia = reader.GetString(reader.GetOrdinal("Procedencia")),
                        Diagnostico = reader.GetString(reader.GetOrdinal("Diagnostico")),
                        Tratamiento = reader.GetString(reader.GetOrdinal("Tratamiento")),
                        FechaAtencion = reader.GetDateTime(reader.GetOrdinal("FechaAtencion"))
                    });
                }
            }
            return lista;
        }
    }
}
