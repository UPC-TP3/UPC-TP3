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
    public class DAO_Medico : BaseDA<DAO_Medico>
    {
        public List<BE_Medico> GetMedicos()
        {
            List<BE_Medico> _lstMedico = new List<BE_Medico>();
            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;

            try
            {
                cmd.CommandText = "usp_GetMedicos";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    _lstMedico.Add(new BE_Medico
                    {
                        ID_Medico = reader.GetInt32(reader.GetOrdinal("ID_Medico")),
                        nom_medico = reader.GetString(reader.GetOrdinal("NomCompleto"))
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

            return _lstMedico;
        }

        public List<BE_Medico> GetMedicoXEspecialidad(string codEspecialidad)
        {
            List<BE_Medico> _lstMedico = null;
            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;

            try
            {
                cmd.CommandText = "usp_GetMedicoXEspecialidad";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@pcodEspecialidad", codEspecialidad));
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    _lstMedico.Add(new BE_Medico
                    {
                        ID_Medico = reader.GetInt32(reader.GetOrdinal("ID_Medico")),
                        nom_medico = reader.GetString(reader.GetOrdinal("nom_medico")),
                        ape_medico = reader.GetString(reader.GetOrdinal("ape_medico"))
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

            return _lstMedico;
        }


    }
}
