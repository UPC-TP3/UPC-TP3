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
    public class DAO_MaestroTablas : BaseDA<DAO_MaestroTablas>
    {
        public List<BE_MaestroTabla> GetDatatabla(string codTabla)
        {
            List<BE_MaestroTabla> _ListMaestro = new List<BE_MaestroTabla>();

            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;

            try
            {               

                cmd.CommandText = "usp_GetDataMaestroXCodigo";
                cmd.Parameters.Add(new SqlParameter("@CodTabla", codTabla));
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    _ListMaestro.Add(new BE_MaestroTabla
                    {
                        MAS_CodTabla = reader.GetString(reader.GetOrdinal("MAS_CodTabla")),
                        MAS_CodCampo = reader.GetString(reader.GetOrdinal("MAS_CodCampo")),
                        MAS_DesCorta = reader.GetString(reader.GetOrdinal("MAS_DesCorta")),
                        MAS_DesLarga = reader.GetString(reader.GetOrdinal("MAS_DesLarga")),
                        MAS_Valor = reader.GetString(reader.GetOrdinal("MAS_Valor")),
                        MAS_Estado = reader.GetString(reader.GetOrdinal("MAS_Estado"))
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
            return _ListMaestro;
        }

        public List<BE_MotivoHospita> GetMotivosHospitaliza()
        {
            List<BE_MotivoHospita> _ListMotivos = new List<BE_MotivoHospita>();

            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;

            try
            {

                cmd.CommandText = "usp_GetMotivosHospitaliza";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    _ListMotivos.Add(new BE_MotivoHospita
                    {
                        ID_Motivo_Hospitalizacion = reader.GetInt32(reader.GetOrdinal("ID_Motivo_Hospitalizacion")),
                        DescripcionInternamiento = reader.GetString(reader.GetOrdinal("DescripcionInternamiento"))
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
            return _ListMotivos;
        }

        public List<BE_Sede> GetSedes()
        {
            List<BE_Sede> _ListSedes = new List<BE_Sede>();

            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;

            try
            {
                cmd.CommandText = "usp_GetSedes";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    _ListSedes.Add(new BE_Sede
                    {
                        ID_Local = reader.GetInt32(reader.GetOrdinal("ID_Local")),
                        nombre = reader.GetString(reader.GetOrdinal("nombre"))
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
            return _ListSedes;
        }
    }
}
