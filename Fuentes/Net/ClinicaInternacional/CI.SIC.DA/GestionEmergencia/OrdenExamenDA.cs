using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class OrdenExamenDA : BaseDA<OrdenExamenDA>
    {      

        public void Grabar(OrdenExamenBE ordenExamen)
        {
            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GrabarOrdenExamen";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@idatencion", SqlDbType.Int) { Value = ordenExamen.IdAtencion, Direction = ParameterDirection.Input },
                        new SqlParameter("@idmedico", SqlDbType.Int) { Value = ordenExamen.IdMedico, Direction = ParameterDirection.Input },
                        new SqlParameter("@estado", SqlDbType.VarChar) { Value = ordenExamen.Estado, Direction = ParameterDirection.Input },
                        new SqlParameter("@fecha", SqlDbType.DateTime) { Value = ordenExamen.Fecha, Direction = ParameterDirection.Input },
                        new SqlParameter("@idpaciente", SqlDbType.Int) { Value = ordenExamen.IdPaciente, Direction = ParameterDirection.Input },
                        new SqlParameter("@detalle", SqlDbType.VarChar) { Value = ordenExamen.Detalle, Direction = ParameterDirection.Input },                        
                        new SqlParameter("@idexamen", SqlDbType.Int) { Value = ordenExamen.IdExamen, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();
                    cmd.ExecuteNonQuery();                    
                }
            }            
        }
    }
}
