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
    public class OrdenHospitalizacionDAO : BaseDA<OrdenHospitalizacionDAO>
    {
        public OrdenHospitalizacionBE getOrdeByCodigo(int codOrden)
        {
            OrdenHospitalizacionBE objOrden = null;
            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;
            try
            {
                cmd.CommandText = "usp_GetOrdenHospXCodigo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@pIdOrden", codOrden));
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    objOrden = new OrdenHospitalizacionBE();
                    objOrden.ID_Orden_Hospitalizacion = reader.GetInt32(reader.GetOrdinal("ID_Orden_Hospitalizacion"));
                    objOrden.ID_Orden_Hospitalizacion = reader.GetInt32(reader.GetOrdinal("ID_Orden_Hospitalizacion"));
                    objOrden.GA_FechaOrden = reader.GetDateTime(reader.GetOrdinal("GA_FechaOrden"));
                    objOrden.GA_Prevision = reader.GetString(reader.GetOrdinal("GA_Prevision"));
                    objOrden.GA_Motivo = reader.GetString(reader.GetOrdinal("GA_Motivo"));
                    objOrden.GA_Tratamiento = reader.GetString(reader.GetOrdinal("GA_Tratamiento"));
                    objOrden.GA_NroDiasHospitalizacion = reader.GetInt32(reader.GetOrdinal("GA_NroDiasHospitalizacion"));
                    objOrden.GA_ExamenesPreOperatorios = reader.GetInt32(reader.GetOrdinal("GA_ExamenesPreOperatorios"));
                    objOrden.GA_MedicoTratante = reader.GetString(reader.GetOrdinal("GA_MedicoTratante"));
                    objOrden.GA_MedicoTurno = reader.GetString(reader.GetOrdinal("GA_MedicoTurno"));
                    objOrden.ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente"));
                    objOrden.FechaHora = reader.GetDateTime(reader.GetOrdinal("FechaHora"));
                    objOrden.ID_Motivo_Hospitalizacion = reader.GetInt32(reader.GetOrdinal("ID_Motivo_Hospitalizacion"));
                    objOrden.GA_Procedencia = reader.GetInt32(reader.GetOrdinal("GA_Procedencia"));
                }

            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                reader.Close();
                cmd.Dispose();
                cn.Close();
            }

            return objOrden;
        }
    }
}
