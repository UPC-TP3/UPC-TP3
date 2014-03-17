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
    public class DAO_Hospitalizacion : BaseDA<DAO_Hospitalizacion>
    {
        public bool insertIngresoHosp(BE_HojaHospitaliza objIngreso)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@FechaIngreso", objIngreso.FechaIngreso);
                parameters.Add("@FechaAlta", objIngreso.FechaAlta);
                parameters.Add("@ID_Procedencia", objIngreso.ID_Procedencia);
                parameters.Add("@TipoOrden", objIngreso.TipoOrden);
                parameters.Add("@Tratamiento", objIngreso.Tratamiento);
                parameters.Add("@ID_Paciente", objIngreso.ID_Paciente);
                parameters.Add("@ID_Orden_Hospitalizacion", objIngreso.ID_Orden_Hospitalizacion);
                parameters.Add("@ID_Local", objIngreso.ID_Local);
                parameters.Add("@ID_Carta", objIngreso.ID_Carta);
                parameters.Add("@ID_Cama", objIngreso.ID_Cama);
                parameters.Add("@ID_Especialidad", objIngreso.ID_Especialidad);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_Insert_Ingreso_Internamiento", parameters);
                return (rpta > 0) ? true : false;

            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public bool insertOrdenHospital(BE_OrdenHospitaliza objOrden)
        {

            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@Prevision", objOrden.Prevision);
                parameters.Add("@NroDiasHospitalizacion", objOrden.NroDiasHospitalizacion);
                parameters.Add("@ExamenesPreOperatorios", objOrden.ExamenesPreOperatorios);
                parameters.Add("@ID_MedicoTratante", objOrden.ID_MedicoTratante);
                parameters.Add("@ID_MedicoTurno", objOrden.ID_MedicoTurno);
                parameters.Add("@ID_Paciente", objOrden.ID_Paciente);
                parameters.Add("@FechaHora", objOrden.FechaHora);
                parameters.Add("@ID_Motivo_Hospitalizacion", objOrden.ID_Motivo_Hospitalizacion);
                parameters.Add("@ID_Consulta", objOrden.ID_Consulta);
                parameters.Add("@ID_Local", objOrden.ID_Local);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_InsertOrdenHospital", parameters);
                return (rpta > 0) ? true : false;
            }
            catch (System.Exception)
            {
                return false;
                throw;
            }
        }


        public BE_OrdenHospitaliza getOrdeByCodigo(int codOrden)
        {
            BE_OrdenHospitaliza objOrden = null;
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
                    objOrden = new BE_OrdenHospitaliza();
                    objOrden.ID_Orden_Hospitalizacion = reader.GetInt32(reader.GetOrdinal("ID_Orden_Hospitalizacion"));
                    objOrden.FechaOrden = reader.GetDateTime(reader.GetOrdinal("FechaOrden"));
                    objOrden.Prevision = reader.GetString(reader.GetOrdinal("Prevision"));
                    objOrden.ID_Estado = reader.GetInt32(reader.GetOrdinal("ID_Estado"));
                    objOrden.Tratamiento = reader.GetString(reader.GetOrdinal("Tratamiento"));
                    objOrden.NroDiasHospitalizacion = reader.GetInt32(reader.GetOrdinal("NroDiasHospitalizacion"));
                    objOrden.ExamenesPreOperatorios = reader.GetString(reader.GetOrdinal("ExamenesPreOperatorios"));
                    objOrden.ID_MedicoTratante = reader.GetInt32(reader.GetOrdinal("ID_MedicoTratante"));
                    objOrden.ID_MedicoTurno = reader.GetInt32(reader.GetOrdinal("ID_MedicoTurno"));
                    objOrden.ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente"));
                    objOrden.FechaHora = reader.GetDateTime(reader.GetOrdinal("FechaHora"));
                    objOrden.Observaciones = reader.GetString(reader.GetOrdinal("Observaciones"));
                    objOrden.ID_Motivo_Hospitalizacion = reader.GetInt32(reader.GetOrdinal("ID_Motivo_Hospitalizacion"));
                    objOrden.ID_Consulta = reader.GetInt32(reader.GetOrdinal("ID_Consulta"));
                    objOrden.ID_Local = reader.GetInt32(reader.GetOrdinal("ID_Local"));
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

        public List<BE_OrdenHospitaliza> getOrdenes(string fecIni, string fecFin)
        {
            List<BE_OrdenHospitaliza> _ListOrden = new List<BE_OrdenHospitaliza>();
            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;

            try
            {
                cmd.CommandText = "usp_GetOrdenesHospitalizacion";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@pfecIni", Convert.ToDateTime(fecIni)));
                cmd.Parameters.Add(new SqlParameter("@pfecFin", Convert.ToDateTime(fecFin)));
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (reader.Read())
                {
                    _ListOrden.Add(new BE_OrdenHospitaliza
                    {
                        ID_Orden_Hospitalizacion = reader.GetInt32(reader.GetOrdinal("ID_Orden_Hospitalizacion")),
                        FechaOrden = reader.GetDateTime(reader.GetOrdinal("FechaOrden")),
                        Prevision = reader.GetString(reader.GetOrdinal("Prevision")),
                        Tratamiento = reader.GetString(reader.GetOrdinal("Tratamiento")),
                        NroDiasHospitalizacion = reader.GetInt32(reader.GetOrdinal("NroDiasHospitalizacion")),
                        ExamenesPreOperatorios = reader.GetString(reader.GetOrdinal("ExamenesPreOperatorios")),
                        ID_MedicoTratante = reader.GetInt32(reader.GetOrdinal("ID_MedicoTratante")),
                        ID_MedicoTurno = reader.GetInt32(reader.GetOrdinal("ID_MedicoTurno")),
                        ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente")),
                        FechaHora = reader.GetDateTime(reader.GetOrdinal("FechaHora")),
                        Observaciones = reader.GetString(reader.GetOrdinal("Observaciones")),
                        ID_Motivo_Hospitalizacion = reader.GetInt32(reader.GetOrdinal("ID_Motivo_Hospitalizacion")),
                        ID_Consulta = reader.GetInt32(reader.GetOrdinal("ID_Consulta")),
                        ID_Local = reader.GetInt32(reader.GetOrdinal("ID_Local")),
                        ID_Estado = reader.GetInt32(reader.GetOrdinal("ID_Estado")),

                        MedTratante = reader.GetString(reader.GetOrdinal("MedTratante")),
                        MedTurno = reader.GetString(reader.GetOrdinal("MedTurno")),
                        Paciente = reader.GetString(reader.GetOrdinal("Paciente")),
                        DescripcionInternamiento = reader.GetString(reader.GetOrdinal("DescripcionInternamiento")),
                    });
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            finally
            {
                reader.Close();
                cmd.Dispose();
                cn.Close();
            }

            return _ListOrden;
        }
    }
}
