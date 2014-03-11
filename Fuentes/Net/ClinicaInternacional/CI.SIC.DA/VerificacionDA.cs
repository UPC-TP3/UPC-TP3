using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class VerificacionDA : BaseDA<VerificacionDA>
    {
        public List<EvaluacionDetalleBE> Listar(int id)
        {
            var lista = new List<EvaluacionDetalleBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ListarVerificacion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    cmd.Parameters.AddRange(new[]
                        {
                            new SqlParameter("@instalacion", SqlDbType.Int)
                                {
                                    Value = id,
                                    Direction = ParameterDirection.Input
                                }
                        });

                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var item = new EvaluacionDetalleBE
                            {
                                IdEvaluacionDetalle = 0,
                                IdVerificacion = reader.GetValueInt32(reader.GetOrdinal("GE_CodigoVerificacion")),
                                Conformidad = false,
                                Item = reader.GetValueString(reader.GetOrdinal("GE_Item"))
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
