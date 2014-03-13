using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class DAO_Cama : BaseDA<DAO_Cama>
    {

        public List<BE_Cama> ListarCamas(int codEspecialidad)
        {
            List<BE_Cama> _listCamas = new List<BE_Cama>();

            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;
            try
            {
                cmd.CommandText = "usp_GetListaCamas";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    _listCamas.Add(new BE_Cama
                    {
                        ID_Cama = reader.GetInt32(reader.GetOrdinal("ID_Cama")),
                        NroCama = reader.GetString(reader.GetOrdinal("DesCama")),
                        TipoCama = reader.GetString(reader.GetOrdinal("TipoCama")),
                        Ubicacion = reader.GetString(reader.GetOrdinal("Ubicacion")),
                        Estado = reader.GetString(reader.GetOrdinal("Estado"))
                    });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                reader.Close();
                cmd.Dispose();
                cn.Close();
            }

            return _listCamas;
        }
    }
}
