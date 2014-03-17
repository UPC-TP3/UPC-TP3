using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class TipoExamenDA : BaseDA<TipoExamenDA>
    {
        public IList<TipoExamenBE> Listar()
        {
            var lista = new List<TipoExamenBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ListarTipoExamen";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var item = new TipoExamenBE
                            {
                                Id = reader.GetValueInt32(reader.GetOrdinal("id")),
                                Nombre  = reader.GetValueString(reader.GetOrdinal("nombre"))                                
                            };

                            lista.Add(item);
                        }
                    }
                }
            }

            return lista;
        }        
    }
}
