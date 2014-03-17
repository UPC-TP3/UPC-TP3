using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class DAO_Especialidad : BaseDA<DAO_Especialidad>
    {
        public List<BE_Especialidad> GetEspecialidad()
        {
            List<BE_Especialidad> _lstEspecialidad = new List<BE_Especialidad>();
            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;

            try
            {
                cmd.CommandText = "usp_GetEspecialidades";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    _lstEspecialidad.Add(new BE_Especialidad
                    {
                        ID_Especialidad = reader.GetInt32(reader.GetOrdinal("ID_Especialidad")),
                        descripcion = reader.GetString(reader.GetOrdinal("descripcion"))
                    });
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                reader.Close();
                cmd.Dispose();
                cn.Close();
            }

            return _lstEspecialidad;
        }
    }
}
