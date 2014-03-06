using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class Orden_ExamenDA : BaseDA<Orden_ExamenDA>
    {
        public Orden_ExamenBE Registro(int pId_orden_examen)
        {
            //var lista = new Orden_ExamenBE();
            Orden_ExamenBE lista= null;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@id_orden_atencion", pId_orden_examen);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Registro_Orden_Examen", parameters))
            {
                while (reader.Read())
                {
                    lista= (new Orden_ExamenBE
                    {
                        Fecha = reader.GetDateTime(reader.GetOrdinal("Fecha")),
                        Id_orden_atencion = reader.GetInt32(reader.GetOrdinal("Id_orden_atencion")),
                        Id_historia = reader.GetInt32(reader.GetOrdinal("Id_historia")),
                        Paciente = reader.GetString(reader.GetOrdinal("Paciente")),
                        Medico = reader.GetString(reader.GetOrdinal("Medico")),
                        Id_tpo_examen = reader.GetInt32(reader.GetOrdinal("Id_tpo_examen")),
                        Examen = reader.GetString(reader.GetOrdinal("Examen")),
                        Precio = reader.GetDecimal(reader.GetOrdinal("Precio")),
                        Id_examen= reader.GetInt32(reader.GetOrdinal("Id_examen")),
                        Tipo_atencion= reader.GetString(reader.GetOrdinal("Tipo_atencion")),
                        Estado= reader.GetString(reader.GetOrdinal("Estado"))
                    });
                }
            }
            return lista;
        }
    }
}
