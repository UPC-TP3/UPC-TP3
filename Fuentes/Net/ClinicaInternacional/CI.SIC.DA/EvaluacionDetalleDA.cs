using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class EvaluacionDetalleDA
    {
        public List<EvaluacionDetalleBE> Listar(int id)
        {
            var lista = new List<EvaluacionDetalleBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ObtenerEvaluacionDetalle";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@evaluacion", SqlDbType.Int) { Value = id, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        var colIdEvaluacionDetalle = reader.GetOrdinal("GE_CodigoEvaluacionDetalle");
                        var colIdVerificacion = reader.GetOrdinal("GE_CodigoVerificacion");
                        var colConformidad = reader.GetOrdinal("GE_Conformidad");                        
                        var colItem = reader.GetOrdinal("GE_Item");                        

                        while (reader.Read())
                        {
                            var item = new EvaluacionDetalleBE
                            {
                                IdEvaluacionDetalle = reader.GetValueInt32(colIdEvaluacionDetalle),
                                IdVerificacion = reader.GetValueInt32(colIdVerificacion),
                                Conformidad = reader.GetValueBoolean(colConformidad),                                
                                Item = reader.GetValueString(colItem)
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
