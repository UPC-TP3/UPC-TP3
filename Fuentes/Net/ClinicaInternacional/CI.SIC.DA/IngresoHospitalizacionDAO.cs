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
    public class IngresoHospitalizacionDAO : BaseDA<IngresoHospitalizacionDAO>
    {
        public bool insertIngresoHosp(IngresoHospitalizacionBE objIngreso)
        {
            try
            {
                

                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@GA_FechaIngreso", objIngreso.GA_FechaIngreso);
                parameters.Add("@GA_HoraIngreso", objIngreso.GA_HoraIngreso);
                parameters.Add("@GA_TipoOrden", objIngreso.GA_TipoOrden);
                parameters.Add("@GA_Tratamiento", objIngreso.GA_Tratamiento);
                parameters.Add("@GA_ViaIngreso", objIngreso.GA_ViaIngreso);
                parameters.Add("@ID_Paciente", objIngreso.ID_Paciente);
                parameters.Add("@GA_CartaGarantia", objIngreso.ID_Paciente);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_Insert_Ingreso_Internamiento", parameters);
                return (rpta > 0) ? true : false;

            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }

        public List<CamaBE> ListarCamas(int codEspecialidad)
        {
            List<CamaBE> _listCamas = new List<CamaBE>();

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
                    _listCamas.Add(new CamaBE
                    {
                        ID_Cama = reader.GetInt32(reader.GetOrdinal("ID_Cama")),
                        GA_NroCama = reader.GetString(reader.GetOrdinal("GA_NroCama")),
                        GA_TipoCama = reader.GetString(reader.GetOrdinal("GA_TipoCama")),
                        GA_Ubicacion = reader.GetString(reader.GetOrdinal("GA_Ubicacion")),
                        GA_Estado = reader.GetString(reader.GetOrdinal("GA_Estado"))
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
